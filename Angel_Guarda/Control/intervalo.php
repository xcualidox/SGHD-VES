<?php
include_once("../Modelo/intervalo.php");
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
	$objeto = new zona();
	$objeto->setDatos($_POST["nom"]);
	$objeto->incluye();
	header("Location: ../Vista/Intervalo/intervalo.php");
	
}

function Modifica()
{
	$objeto = new zona();
	$objeto->setDatos($_POST["nom"]);
	$objeto->modificar($_POST["origin"]);
	header("Location: ../Vista/Intervalo/intervalo.php");
}

function Elimina()
{	
	$objeto = new zona();
	$objeto->eliminar($_POST["origin"]);
	header("Location: ../Vista/Intervalo/intervalo.php");
}
function Disponi($disponibilidad)  {
	$objeto = new zona();
	$objeto->Disponibilidad($disponibilidad,$_POST["nom"]);
	header("Location: ../Vista/Intervalo/intervalo.php");
}
?>