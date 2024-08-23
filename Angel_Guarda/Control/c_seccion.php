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
	$ano=$_POST["a"];
	$seccion=$_POST["sec"];
	$objeto = new seccion();
	$objeto->setDatos($_POST["a"], $_POST["sec"]);
	$objeto->incluye();
	header("Location: ../Vista/seccion/v_seccion.php");
	}

function Modifica()
{

	$objeto = new seccion();
	$objeto->setDatos($_POST["a"], $_POST["sec"]);
	$objeto->modificar($_POST["origin"], $_POST["origin2"]);
	header("Location: ../Vista/seccion/v_seccion.php");
}

function Elimina()
{	
	$objeto = new seccion();
	$objeto->eliminar($_POST["origin"], $_POST["origin2"]);
	header("Location: ../Vista/seccion/v_seccion.php");
}
?>