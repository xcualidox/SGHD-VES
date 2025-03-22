<?php
require_once(__DIR__ . "/../Modelo/m_asignatura.php");



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

	$objeto = new asignatura();
	$objeto->setDatos($_POST["cod"], $_POST["nom"]);
	$objeto->incluye();
	header("Location: ../Vista/Asignatura/v_asignatura.php");
	}

function Modifica()
{

	$objeto = new asignatura();
	$objeto->setDatos($_POST["cod"], $_POST["nom"]);
	$objeto->modificar($_POST["origin"]);
	header("Location: ../Vista/Asignatura/v_asignatura.php");
}

function Elimina()
{	
	$objeto = new asignatura();
	$objeto->eliminar($_POST["origin"]);
	header("Location: ../Vista/Asignatura/v_asignatura.php");
}
?>