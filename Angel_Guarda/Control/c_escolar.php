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
if (isset($_POST["nombre"]) && isset($_POST["activo"])) {
    $nombre = $_POST["nombre"];
    $activo = $_POST["activo"];

    // Crear una instancia de la clase escolar
    $objeto = new escolar();

    if ($activo == 0) {
        // Si se intenta desactivar un año escolar, verificamos si es el único activo
        $activoActual = $objeto->contarActivos();
        if ($activoActual <= 1) {
            // Si solo hay un año escolar activo, no permitimos desactivarlo
            header("Location: ../Vista/escolar/v_escolar.php");
            exit();
        }
    } else {
        // Si activamos un nuevo año escolar, desactivamos todos los demás
        $objeto->desactivarTodos();
    }

    // Cambiar el estado del año escolar seleccionado

    $objeto->cambiarEstado($nombre, $activo);
    require_once("c_bitacora.php");
    insertBitacora($_SESSION['username'], "modificar", "Activo Año Escolar: ".$nombre. ".");

    header("Location: ../Vista/escolar/v_escolar.php");
    exit();
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