<?php
include_once("../Modelo/asignatura.php");
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
	$codigo=$_POST["cod"];
	$nombre=$_POST["nom"];
	$objeto = new zona();
	$objeto->setDatos($_POST["cod"], $_POST["nom"]);
	$objeto->incluye();
	header("Location: ../Vista/Asignatura/asignatura.php");
	}

function Modifica()
{
	$codigo=$_POST["cod"];
	$nombre=$_POST["nom"];
	$objeto = new zona();
	$objeto->setDatos($_POST["cod"], $_POST["nom"]);
	$objeto->modificar($_POST["origin"]);
	header("Location: ../Vista/Asignatura/asignatura.php");
}

function Elimina()
{	
	$objeto = new zona();
	$objeto->eliminar($_POST["origin"]);
	header("Location: ../Vista/Asignatura/asignatura.php");
}
?>