<?php 
session_start();
include_once("../Modelo/profesor_materia.php");
$operacion = new zona();
if (isset($_POST["cedula"])) {
    $dato=$operacion->SeleccionarMaterias($_POST["cedula"]);
    echo json_encode($dato);
}
else {
    if ($_POST["profesor"]!="") {
       $cedula=$_POST["profesor"];
    }
    else {
        $cedula=$_POST["origin"];
    }
    $operacion->Eliminar($cedula);
    if ($_POST["add"]!="") {
        $array=explode(",",$_POST["add"]);
    
        for ($i=1; $i < count($array); $i++) { 
            $operacion->registrar($cedula,$array[$i]);
        }
    }
    header("Location: ../Vista/Profesores_Materias/profesor_materia.php");
}

?>