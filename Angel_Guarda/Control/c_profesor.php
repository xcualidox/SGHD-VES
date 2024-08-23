<?php


require_once(__DIR__ . "/../Modelo/m_profesor.php");



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

	function Modifica()
	{
		$objeto = new personas();
		$cedula = $_POST['cedula'];
		$cedulaOriginal = $_POST['origin']; // Cédula antes de la modificación
	
		// Si la cédula no ha cambiado, no es necesario verificarla
		if ($cedula === $cedulaOriginal) {
			// Actualiza sin necesidad de verificar duplicados
			$objeto->setDatos($_POST["cedula"], $_POST["nombres"], $_POST["apellidos"], $_POST["direccion"], $_POST["telefono"], $_POST["correo"]);
			$objeto->modificar($cedulaOriginal);
			header("Location: ../Vista/profesor/v_profesor.php");
			exit();
		}
	
		// Si la cédula ha cambiado, verifica si ya está en uso
		$resultado = $objeto->verificarCedula($cedula);
	
		if ($resultado) {
			// Redirigir al profesor si se encuentra la cédula en otro registro
			header("Location: ../Vista/profesor/v_profesor.php");
			exit();
		} else {
		
			$objeto->setDatos($_POST["cedula"], $_POST["nombres"], $_POST["apellidos"], $_POST["direccion"], $_POST["telefono"], $_POST["correo"]);
			$objeto->modificar($cedulaOriginal);
			header("Location: ../Vista/profesor/v_profesor.php");
			exit();
		}
	}

function Elimina()
{	
	$objeto = new personas();
	$objeto->eliminar($_POST["origin"]);
	header("Location: ../Vista/profesor/v_profesor.php");
}


?>


