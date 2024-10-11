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

function passwordEncrypt($pw)
{
    return password_hash($pw, PASSWORD_DEFAULT);
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
        session_start();
		$objeto = new personas();
		$objeto->setDatos($_POST["cedula"], $_POST["nombres"], $_POST["apellidos"], $_POST["direccion"], $_POST["telefono"], $_POST["correo"]);
		$objeto->incluye();
		require_once("../../php/controller/c_login.php");
		createLogin($_POST["cedula"], $_POST["rol"]); 
        require_once("c_bitacora.php");
        insertBitacora($_SESSION['username'], "insertar", $_SESSION['username']." ha agregado al profesor ".$_POST["cedula"].".");
		header("Location: ../Vista/profesor/v_profesor.php");
	}
}

	function Modifica() {
        session_start();
        require_once("c_bitacora.php");
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
            insertBitacora($_SESSION['username'], "modificar", $_SESSION['username']." ha modificado al profesor ".$_POST["cedula"].".");
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

                //Verifica si el profesor a modificar es nuevo, es decir, no ha puesto su clave
                $esnuevo=$objetoPersonas->VerificarClaveNueva($cedula);
                if($esnuevo[0]['status']=='new'){
                    //Y si es nuevo pues encriptar la cedula como clave y actualizar el login
                    $clave_encriptada=passwordEncrypt($cedula);
                    $objetoPersonas->ActualizarClave($clave_encriptada,$cedula);
                }
	
				// Actualiza el rol en la tabla login
				$loginModel = new Login();
				$loginModel->setUsername($_POST["cedula"]);
				$loginModel->setRol($_POST["rol"]);
				$loginModel->modificarRol($_POST["cedula"], $_POST["rol"]);
                insertBitacora($_SESSION['username'], "modificar", $_SESSION['username']." ha modificado al profesor ".$_POST["cedula"].".");
				//header("Location: ../Vista/profesor/v_profesor.php");
				exit();
			}
		}
	}

function Elimina()
{	 
    session_start(); 
    require_once("c_bitacora.php");
	$objeto = new personas();
	$objeto->eliminar($_POST["origin"]); 
    insertBitacora($_SESSION['username'], "eliminar", $_SESSION['username']." ha eliminado al profesor ".$_POST["cedula"].".");
	header("Location: ../Vista/profesor/v_profesor.php");
}

//Añadiendo el Nombre de las Columnas




// Inicializar el objeto de nombre de columnas
// Inicializar el objeto de nombre de columnas
$nombre_Columnas = new personas();

// #Paginado

// Función para obtener las columnas de la tabla
function obtenerNombreColumnas($nombre_Columnas) {
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
function crearArregloDatos($contador, $nombre_Columnas) {
    $NombreColumnas = $nombre_Columnas->nombreColumna($nombre_Columnas);
    $soloNombresColumnas = array_map(function($columna) {
        return $columna['Field'];
    }, $NombreColumnas);

    return array_map(function($fila) use ($soloNombresColumnas) {
        $resultado = [];
        foreach ($soloNombresColumnas as $columna) {
            $resultado[$columna] = isset($fila[$columna]) ? $fila[$columna] : null;
        }
        return $resultado;
    }, $contador);
}

// Función para generar la paginación
function generarPaginacionHTML($paginaActual, $totalpag, $campo, $buscar) {
    $paginacionHTML = "<div class='paginacion'>";

    if ($totalpag <= 10) {
        for ($i = 1; $i <= $totalpag; $i++) {
            $paginacionHTML .= $paginaActual == $i
                ? "<a href='?pag_asig={$i}&campo={$campo}&listar={$buscar}' class='seleccionado'>{$i}</a>"
                : "<a href='?pag_asig={$i}&campo={$campo}&listar={$buscar}'>{$i}</a>";
        }
    } else {
        for ($i = max(1, $paginaActual - 4); $i <= min($totalpag, $paginaActual + 6); $i++) {
            $paginacionHTML .= $paginaActual == $i
                ? "<a href='?pag_asig={$i}&campo={$campo}&listar={$buscar}' class='seleccionado'>{$i}</a>"
                : "<a href='?pag_asig={$i}&campo={$campo}&listar={$buscar}'>{$i}</a>";
        }
    }
    $paginacionHTML .= "</div>";
    return $paginacionHTML;
}

// Controlador principal
function controladorPaginado($nombre_Columnas) {
    $soloNombresColumnas = obtenerNombreColumnas($nombre_Columnas);
    $paginaActual = obtenerPaginaActual();
    $limit = 10;
    $offset = ($paginaActual - 1) * $limit;
    list($campo, $buscar) = obtenerParametrosBusqueda();

    $contador = generarTabla($campo, $buscar, $offset, $limit);
    $totalpag = contarPaginas($campo, $buscar, $limit);

    $tablaDatos = crearArregloDatos($contador, $nombre_Columnas);
    $paginacionHTML = generarPaginacionHTML($paginaActual, $totalpag, $campo, $buscar);

    return [$soloNombresColumnas, $tablaDatos, $paginacionHTML];
}

// Llamada al controlador
list($soloNombresColumnas, $tablaDatos, $paginacionHTML) = controladorPaginado($nombre_Columnas);
?>




