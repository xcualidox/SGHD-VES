<?php
include_once("../Modelo/horario.php"); 
$objeto = new zona();
$bloques=explode(",",$_POST["valores_horario"]);
if ($_POST["id_intervalo"]!="undefined") {
    $intervalo=$_POST["id_intervalo"];
}
else {
    $resultado=$objeto->GetIntervalo($_POST["ano"],$_POST["seccion"]);
    if (count($resultado)>0) {
        $intervalo=$resultado[0][0];
    }
   
}

$objeto->ClearHorario($_POST["ano"],$_POST["seccion"]);
if (count($bloques)>1) {
    for ($i=0; $i < count($bloques);) {
        $objeto->setDatos($_POST["ano"],$_POST["seccion"],$bloques[$i+2], $bloques[$i+1],$bloques[$i],$bloques[$i+4],$bloques[$i+3],$intervalo);
        echo $objeto->Registrar_Horario();
        $i=$i+5;
    }
}
header("Location: ../Vista/Horario/horario.php");
?>