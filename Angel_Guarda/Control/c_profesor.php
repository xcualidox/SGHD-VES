<?php


require_once(__DIR__ . "/../Modelo/m_profesor.php");
require_once(__DIR__ . "/../../php/model/m_login.php");














if (isset($_POST["ope"])) {
    $operacion = $_POST["ope"];
    switch ($operacion) {
        case 'Incluir':
            Registra();
            break;
        
        case 'Borrar':
            Elimina();
            break;
        
        case 'Modificar':
            Modifica();
            break;
    }
}
	
function Registra()
{

	$personasModel = new personas();
	$cedula = $_POST['cedula'];
    // Verificar si la cédula existe
    $resultado = $personasModel->verificarCedula($cedula);

	if ($resultado ) {
        // Redirigir al profesor si se encuentra la cédula
        header("Location: ../Vista/profesor/v_profesor.php");
        exit();
    }
	
	else{
		$objeto = new personas();
		$objeto->setDatos($_POST["cedula"], $_POST["nombres"], $_POST["apellidos"], $_POST["direccion"], $_POST["telefono"], $_POST["correo"]);
		$objeto->incluye();
		require_once("../../php/controller/c_login.php");
		createLogin($_POST["cedula"], $_POST["rol"]);
		header("Location: ../Vista/profesor/v_profesor.php");
	}
	}

	function Modifica() {
	
	
		$objetoPersonas = new personas();
		$cedula = $_POST['cedula'];
		$cedulaOriginal = $_POST['origin']; // Cédula antes de la modificación
	
		// Si la cédula no ha cambiado, no es necesario verificarla
		if ($cedula === $cedulaOriginal) {
			// Actualiza los datos personales
			$objetoPersonas->setDatos($_POST["cedula"], $_POST["nombres"], $_POST["apellidos"], $_POST["direccion"], $_POST["telefono"], $_POST["correo"]);
			$objetoPersonas->modificar($cedulaOriginal);
	
			// Si se ha proporcionado un rol, actualizar el rol en la tabla login
			if (!empty($_POST["rol"])) {
				$loginModel = new Login();
				$loginModel->setUsername($cedula);
				$loginModel->setRol($_POST["rol"]);
				$loginModel->modificarRol($cedula, $_POST["rol"]);
			}
	
			header("Location: ../Vista/profesor/v_profesor.php");
			exit();
		} else {
			// Si la cédula ha cambiado, verifica si ya está en uso
			$resultado = $objetoPersonas->verificarCedula($cedula);
	
			if ($resultado) {
				// Redirigir al profesor si se encuentra la cédula en otro registro
				header("Location: ../Vista/profesor/v_profesor.php");
				exit();
			} else {
				// Actualiza los datos personales y el rol
				$objetoPersonas->setDatos($_POST["cedula"], $_POST["nombres"], $_POST["apellidos"], $_POST["direccion"], $_POST["telefono"], $_POST["correo"]);
				$objetoPersonas->modificar($cedulaOriginal);
	
				// Actualiza el rol en la tabla login
				$loginModel = new Login();
				$loginModel->setUsername($_POST["cedula"]);
				$loginModel->setRol($_POST["rol"]);
				$loginModel->modificarRol($_POST["cedula"], $_POST["rol"]);
	
				header("Location: ../Vista/profesor/v_profesor.php");
				exit();
			}
		}
	}

function Elimina()
{	
	$objeto = new personas();
	$objeto->eliminar($_POST["origin"]);
	header("Location: ../Vista/profesor/v_profesor.php");
}

//Añadiendo el Nombre de las Columnas
$nombre_Columnas = new personas();

$NombreColumnas=$nombre_Columnas ->nombreColumna($nombre_Columnas );
$soloNombresColumnas = array_map(function($columna) {
    return $columna['Field'];
}, $NombreColumnas);





 //#Paginado
// Determina la página actual
if (!isset($_GET["pag_asig"])) {
    $paginaActual = 1; // Página predeterminada es la primera
} else {
    $paginaActual = (int)$_GET["pag_asig"]; // Página actual obtenida de la URL
}

$limit = 5; // Número de registros por página
$offset = ($paginaActual - 1) * $limit; // Offset para la consulta SQL

$objeto = new query();
$contador = $objeto->GenerarTabla($offset, $limit); // Obtener los registros de la página actual
$numFilas = $objeto->TotalPaginas(); // Obtener el número total de registros

// Crear el arreglo de datos
$tablaDatos = array_map(function($fila) {
    return [
        'cedula' => $fila["cedula"],
        'nombres' => $fila["nombres"],
        'apellidos' => $fila["apellidos"],
        'direccion' => $fila["direccion"],
        'telefono' => $fila["telefono"],
        'correo' => $fila["correo"]
    ];
}, $contador);



// Calcular el total de páginas
$totalpag = ceil($numFilas / $limit);

// Inicializa una variable para almacenar el HTML de la paginación
$paginacionHTML = "<div class='paginacion'>";

// Si el total de páginas es menor o igual a 10, mostrar todas las páginas
if ($totalpag <= 10) {
    for ($i = 1; $i <= $totalpag; $i++) {
        if ($paginaActual == $i) {
            $paginacionHTML .= "<a href=?pag_asig=" . $i . " class='seleccionado'>" . $i . "</a>";
        } else {
            $paginacionHTML .= "<a href=?pag_asig=" . $i . ">" . $i . "</a>";
        }
    }
} else {
    // Mostrar un rango de páginas alrededor de la página actual
    for ($i = $paginaActual - 4; $i <= $paginaActual + 6; $i++) {
        if ($i <= 0) {
            continue; // Asegurarse de no mostrar números negativos o cero
        }
        if ($i > $totalpag) {
            break; // Romper el bucle si el índice supera el total de páginas
        }
        if ($paginaActual == $i) {
            $paginacionHTML .= "<a href=?pag_asig=" . $i . " class='seleccionado'>" . $i . "</a>";
        } else {
            $paginacionHTML .= "<a href=?pag_asig=" . $i . ">" . $i . "</a>";
        }
    }
}

$paginacionHTML .= "</div>";


?>




