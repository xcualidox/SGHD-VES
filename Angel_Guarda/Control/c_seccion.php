<?php


require(__DIR__ . "/../Modelo/m_seccion.php");


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
	session_start();
	$ano=$_POST["a"];
	$seccion=$_POST["sec"];
	$objeto = new seccion();
	$objeto->setDatos($_POST["a"], $_POST["sec"]);
	$objeto->incluye();
	require_once("c_bitacora.php");
    insertBitacora($_SESSION['username'], "insertar", $_SESSION['username']." ha agregado la sección ".$_POST["a"]."-".$_POST["sec"].".");
	header("Location: ../Vista/seccion/v_seccion.php");
	}

function Modifica()
{
	session_start();
	$objeto = new seccion();
	$objeto->setDatos($_POST["a"], $_POST["sec"]);
	$objeto->modificar($_POST["origin"], $_POST["origin2"]);
	require_once("c_bitacora.php");
    insertBitacora($_SESSION['username'], "modificar", $_SESSION['username']." ha modificado la sección ".$_POST["origin"]."-".$_POST["origin2"].".");
	header("Location: ../Vista/seccion/v_seccion.php");
}

function Elimina()
{	
	session_start();
	$objeto = new seccion();
	$objeto->eliminar($_POST["origin"], $_POST["origin2"]);
	require_once("c_bitacora.php");
    insertBitacora($_SESSION['username'], "eliminar", $_SESSION['username']." ha eliminado la sección ".$_POST["origin"]."-".$_POST["origin2"].".");
	header("Location: ../Vista/seccion/v_seccion.php");
}
?>