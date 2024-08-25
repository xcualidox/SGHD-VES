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

$limit = 10; // Número de registros por página
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



// Función para obtener las columnas de la tabla
function obtenerNombreColumnas() {
    $nombre_Columnas = new personas();
    $NombreColumnas = $nombre_Columnas->nombreColumna($nombre_Columnas);
    return array_map(function($columna) {
        return $columna['Field'];
    }, $NombreColumnas);
}

// Función para obtener la página actual
function obtenerPaginaActual() {
    return isset($_GET["pag_asig"]) ? (int)$_GET["pag_asig"] : 1;
}

// Función para obtener los parámetros de búsqueda
function obtenerParametrosBusqueda() {
    $campo = isset($_GET['campo']) ? $_GET['campo'] : '';
    $buscar = isset($_GET['listar']) ? $_GET['listar'] : '';
    return [$campo, $buscar];
}

// Función para generar los datos de la tabla
function generarTabla($campo, $buscar, $offset, $limit) {
    $objeto = new query();
    
    if ($buscar !== '' && $campo !== '') {
        return $objeto->GenerarTablaFiltrada($campo, $buscar, $offset, $limit);
    } else {
        return $objeto->GenerarTabla($offset, $limit);
    }
}

// Función para contar las páginas totales
function contarPaginas($campo, $buscar, $limit) {
    $objeto = new query();
    
    if ($buscar !== '' && $campo !== '') {
        $numFilas = $objeto->TotalPaginasFiltradas($campo, $buscar);
    } else {
        $numFilas = $objeto->TotalPaginas();
    }

    return ceil($numFilas / $limit);
}

// Función para crear los datos de la tabla
function crearArregloDatos($contador) {
    return array_map(function($fila) {
        return [
            'cedula' => $fila["cedula"],
            'nombres' => $fila["nombres"],
            'apellidos' => $fila["apellidos"],
            'direccion' => $fila["direccion"],
            'telefono' => $fila["telefono"],
            'correo' => $fila["correo"]
        ];
    }, $contador);
}

// Función para generar la paginación
function generarPaginacionHTML($paginaActual, $totalpag, $campo, $buscar) {
    $paginacionHTML = "<div class='paginacion'>";

    if ($totalpag <= 10) {
        for ($i = 1; $i <= $totalpag; $i++) {
            if ($paginaActual == $i) {
                $paginacionHTML .= "<a href='?pag_asig={$i}&campo={$campo}&listar={$buscar}' class='seleccionado'>" . $i . "</a>";
            } else {
                $paginacionHTML .= "<a href='?pag_asig={$i}&campo={$campo}&listar={$buscar}'>" . $i . "</a>";
            }
        }
    } else {
        for ($i = $paginaActual - 4; $i <= $paginaActual + 6; $i++) {
            if ($i <= 0) continue;
            if ($i > $totalpag) break;

            if ($paginaActual == $i) {
                $paginacionHTML .= "<a href='?pag_asig={$i}&campo={$campo}&listar={$buscar}' class='seleccionado'>" . $i . "</a>";
            } else {
                $paginacionHTML .= "<a href='?pag_asig={$i}&campo={$campo}&listar={$buscar}'>" . $i . "</a>";
            }
        }
    }
    $paginacionHTML .= "</div>";
    return $paginacionHTML;
}

// Controlador principal
function controladorPaginado() {
    $soloNombresColumnas = obtenerNombreColumnas();
    $paginaActual = obtenerPaginaActual();
    $limit = 10; // Número de registros por página
    $offset = ($paginaActual - 1) * $limit; // Offset para la consulta SQL
    list($campo, $buscar) = obtenerParametrosBusqueda();

    $contador = generarTabla($campo, $buscar, $offset, $limit);
    $totalpag = contarPaginas($campo, $buscar, $limit);

    $tablaDatos = crearArregloDatos($contador);
    $paginacionHTML = generarPaginacionHTML($paginaActual, $totalpag, $campo, $buscar);

    return [$soloNombresColumnas, $tablaDatos, $paginacionHTML];
}

// Llamada al controlador
list($soloNombresColumnas, $tablaDatos, $paginacionHTML) = controladorPaginado();

?>




