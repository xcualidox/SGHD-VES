<?php
include_once("../Modelo/profesor.php");
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
	
function Registra()
{
	$cedula=$_POST['cedula'];
	$conexion=mysqli_connect("localhost", "root", "", "proyecto");
	$consulta="select * from personas where cedula='$cedula'";
	$resultado=mysqli_query($conexion, $consulta);
	$filas=mysqli_num_rows($resultado);

	if($filas>0){
		header("Location: ../Vista/Profesor/profesor_error.php");
	}
	
	else{
		$objeto = new zona();
		$objeto->setDatos($_POST["cedula"], $_POST["primer_nombre"], $_POST["segundo_nombre"], $_POST["primer_apellido"], $_POST["segundo_apellido"], $_POST["direccion"], $_POST["telefono"], $_POST["correo"]);
		$objeto->incluye();
		header("Location: ../Vista/Profesor/profesor.php");
	}
	}

function Modifica()
{
	$objeto = new zona();
	$objeto->setDatos($_POST["cedula"], $_POST["primer_nombre"], $_POST["segundo_nombre"], $_POST["primer_apellido"], $_POST["segundo_apellido"], $_POST["direccion"], $_POST["telefono"], $_POST["correo"]);
	$objeto->modificar($_POST["origin"]);
	header("Location: ../Vista/Profesor/profesor.php");
}

function Elimina()
{	
	$objeto = new zona();
	$objeto->eliminar($_POST["origin"]);
	header("Location: ../Vista/Profesor/profesor.php");
}
?>