<?php
include_once("../Modelo/a_seccion.php");
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
	$ano=$_POST["a"];
	$seccion=$_POST["sec"];
	$objeto = new zona();
	$objeto->setDatos($_POST["a"], $_POST["sec"]);
	$objeto->incluye();
	header("Location: ../Vista/A_seccion/a_seccion.php");
	}

function Modifica()
{
	$ano=$_POST["a"];
	$seccion=$_POST["sec"];
	$objeto = new zona();
	$objeto->setDatos($_POST["a"], $_POST["sec"]);
	$objeto->modificar($_POST["origin"], $_POST["origin2"]);
	header("Location: ../Vista/A_seccion/a_seccion.php");
}

function Elimina()
{	
	$objeto = new zona();
	$objeto->eliminar($_POST["origin"], $_POST["origin2"]);
	header("Location: ../Vista/A_seccion/a_seccion.php");
}
?>