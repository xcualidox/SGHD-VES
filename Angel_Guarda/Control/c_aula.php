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
	$objeto = new aula();
	$objeto->setDatos($_POST["nom"], $_POST["des"], $_POST["dis"]);
	$objeto->incluye(); 
	require_once("c_bitacora.php");
    insertBitacora($_SESSION['username'], "insertar", "Agregó el aula ".$_POST["nom"].".");
	header("Location: ../Vista/aula/v_aula.php");
	exit();
}

function Modifica()
{
	$objeto = new aula();
	$objeto->setDatos($_POST["nom"], $_POST["des"], $_POST["dis"]);
	$objeto->modificar($_POST["origin"]);
	require_once("c_bitacora.php");
    insertBitacora($_SESSION['username'], "modificar", "Modificó el aula ".$_POST["nom"].".");
	header("Location: ../Vista/aula/v_aula.php");
	exit();
}

function Elimina()
{ 
	$objeto = new aula();
	$objeto->eliminar($_POST["origin"]);
	require_once("c_bitacora.php");
    insertBitacora($_SESSION['username'], "eliminar", "Eliminó el aula ".$_POST["nom"].".");
	header("Location: ../Vista/aula/v_aula.php");
	exit();
}
function Disponi($disponibilidad)  {
	$objeto = new aula();
	$objeto->Disponibilidad($disponibilidad,$_POST["nom"]);
	header("Location: ../Vista/aula/v_aula.php");
	exit();
}
?>