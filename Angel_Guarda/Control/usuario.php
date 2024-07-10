<?php
include_once("../Modelo/usuario.php");
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
	$consulta="select * from usuarios where cedula='$cedula'";
	$resultado=mysqli_query($conexion, $consulta);
	$filas=mysqli_num_rows($resultado);

	if($filas>0){
		header("Location: ../Vista/Usuarios/usuario_error.php");
	}
	
	else{
		$objeto = new zona();
		$objeto->setDatos($_POST["cedula"], $_POST["nombre"], $_POST["apellido"], $_POST["rol"]);
		$objeto->incluye();
		header("Location: ../Vista/Usuarios/usuario.php");
	}
	}

function Modifica()
{
	$objeto = new zona();
	$objeto->setDatos($_POST["cedula"], $_POST["nombre"], $_POST["apellido"], $_POST["rol"]);
	$objeto->modificar($_POST["origin"]);
	header("Location: ../Vista/Usuarios/usuario.php");
}

function Elimina()
{	
	$objeto = new zona();
	$objeto->eliminar($_POST["origin"]);
	header("Location: ../Vista/Usuarios/usuario.php");
}
?>