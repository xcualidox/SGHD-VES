<?php
include_once("../Modelo/a_escolar.php");
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
	$nombre=$_POST["nom"];
	$fechaI=$_POST["fecI"];
    $fechaF=$_POST["fecD"];
	$objeto = new zona();
	$objeto->setDatos($_POST["nom"], $_POST["fecI"], $_POST["fecF"]);
	$objeto->incluye();
	header("Location: ../Vista/A_escolar/a_escolar.php");
}

function Modifica()
{
	$nombre=$_POST["nom"];
	$fechaI=$_POST["fecI"];
    $fechaF=$_POST["fecF"];
	$objeto = new zona();
	$objeto->setDatos($_POST["nom"], $_POST["fecI"], $_POST["fecF"]);
	$objeto->modificar($_POST["origin"]);
	header("Location: ../Vista/A_escolar/a_escolar.php");
}

function Elimina()
{	
	$objeto = new zona();
	$objeto->eliminar($_POST["origin"]);
	header("Location: ../Vista/A_escolar/a_escolar.php");
}
?>