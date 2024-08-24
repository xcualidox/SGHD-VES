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


?>


