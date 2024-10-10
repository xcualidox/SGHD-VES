<?php
require_once(__DIR__ . "/../Modelo/m_aula.php");
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
		case 'Activar':
				Disponi(1);
				break;
				
		case 'Desactivar':
				Disponi(0);
				break;
	}
	
}

	
	
function Registra()
{
	session_start();
	$objeto = new aula();
	$objeto->setDatos($_POST["nom"], $_POST["des"], $_POST["dis"]);
	$objeto->incluye(); 
	require_once("c_bitacora.php");
    insertBitacora($_SESSION['username'], "insertar", $_SESSION['username']." ha agregado el aula ".$_POST["nom"].".");
	header("Location: ../Vista/aula/v_aula.php");
	
}

function Modifica()
{
	session_start();
	$objeto = new aula();
	$objeto->setDatos($_POST["nom"], $_POST["des"], $_POST["dis"]);
	$objeto->modificar($_POST["origin"]);
	require_once("c_bitacora.php");
    insertBitacora($_SESSION['username'], "modificar", $_SESSION['username']." ha modificado el aula ".$_POST["nom"].".");
	header("Location: ../Vista/aula/v_aula.php");
	
}

function Elimina()
{ 
	session_start();

	$objeto = new aula();
	$objeto->eliminar($_POST["origin"]);
	require_once("c_bitacora.php");
    insertBitacora($_SESSION['username'], "eliminar", $_SESSION['username']." ha eliminado el aula ".$_POST["nom"].".");
	header("Location: ../Vista/aula/v_aula.php");
}
function Disponi($disponibilidad)  {
	$objeto = new aula();
	$objeto->Disponibilidad($disponibilidad,$_POST["nom"]);
	header("Location: ../Vista/aula/v_aula.php");
}
?>