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
	$objeto = new escolar();
	$objeto->setDatos($_POST["nom"], $_POST["fecI"], $_POST["fecF"]);
	$objeto->incluye();
    require_once("c_bitacora.php");
    insertBitacora($_SESSION['username'], "insertar", "Agregó el año escolar ".$_POST["nom"].".");
	header("Location: ../Vista/escolar/v_escolar.php");
    exit();
}

function Modifica()
{
	$objeto = new escolar();
	$objeto->setDatos($_POST["nom"], $_POST["fecI"], $_POST["fecF"]);
	$objeto->modificar($_POST["origin"]);
    require_once("c_bitacora.php");
    insertBitacora($_SESSION['username'], "modificar", "Modificó el año escolar ".$_POST["nom"].".");
	header("Location: ../Vista/escolar/v_escolar.php");
    exit();
}

function Elimina()
{	
	$objeto = new escolar();
	$objeto->eliminar($_POST["origin"]);
    require_once("c_bitacora.php");
    insertBitacora($_SESSION['username'], "eliminar", "Eliminó el año escolar ".$_POST["nom"].".");
	header("Location: ../Vista/escolar/v_escolar.php");
    exit();
}
?>