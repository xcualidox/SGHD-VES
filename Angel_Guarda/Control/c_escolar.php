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
	header("Location: ../Vista/escolar/v_escolar.php");
}

function Modifica()
{
	
	$objeto = new escolar();
	$objeto->setDatos($_POST["nom"], $_POST["fecI"], $_POST["fecF"]);
	$objeto->modificar($_POST["origin"]);
	header("Location: ../Vista/escolar/v_escolar.php");
}

function Elimina()
{	
	$objeto = new escolar();
	$objeto->eliminar($_POST["origin"]);
	header("Location: ../Vista/escolar/v_escolar.php");
}
?>