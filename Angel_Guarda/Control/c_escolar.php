<?php
require_once(__DIR__ . "/../Modelo/m_escolar.php");



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

	$objeto = new escolar();
	$objeto->setDatos($_POST["nom"], $_POST["fecI"], $_POST["fecF"]);
	$objeto->incluye();
    require_once("c_bitacora.php");
    insertBitacora($_SESSION['username'], "insertar", $_SESSION['username']." ha agregado el año escolar ".$_POST["nom"].".");
	header("Location: ../Vista/escolar/v_escolar.php");
}

function Modifica()
{
	session_start();
	$objeto = new escolar();
	$objeto->setDatos($_POST["nom"], $_POST["fecI"], $_POST["fecF"]);
	$objeto->modificar($_POST["origin"]);
    require_once("c_bitacora.php");
    insertBitacora($_SESSION['username'], "modificar", $_SESSION['username']." ha modificado el año escolar ".$_POST["nom"].".");
	header("Location: ../Vista/escolar/v_escolar.php");
}

function Elimina()
{	
    session_start();
	$objeto = new escolar();
	$objeto->eliminar($_POST["origin"]);
    require_once("c_bitacora.php");
    insertBitacora($_SESSION['username'], "eliminar", $_SESSION['username']." ha eliminado el año escolar ".$_POST["nom"].".");
	header("Location: ../Vista/escolar/v_escolar.php");
}
?>