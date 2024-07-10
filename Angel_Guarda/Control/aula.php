<?php
include_once("../Modelo/aula.php");
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
	case 'Activar':
		Disponi(1);
		break;
		
	case 'Desactivar':
		Disponi(0);
		break;
	}
	
	
function Registra()
{
	$nombre=$_POST["nom"];
	$objeto = new zona();
	$objeto->setDatos($_POST["nom"], $_POST["des"], $_POST["dis"]);
	$objeto->incluye();
	header("Location: ../Vista/Aula/aula.php");
	
}

function Modifica()
{
	$nombre=$_POST["nom"];
	$objeto = new zona();
	$objeto->setDatos($_POST["nom"], $_POST["des"], $_POST["dis"]);
	$objeto->modificar($_POST["origin"]);
	header("Location: ../Vista/Aula/aula.php");
	
}

function Elimina()
{	
	$objeto = new zona();
	$objeto->eliminar($_POST["origin"]);
	header("Location: ../Vista/Aula/aula.php");
}
function Disponi($disponibilidad)  {
	$objeto = new zona();
	$objeto->Disponibilidad($disponibilidad,$_POST["nom"]);
	header("Location: ../Vista/Aula/aula.php");
}
?>