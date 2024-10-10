<?php
include_once("../Modelo/horario.php"); 
$objeto = new zona();
$bloques = explode(",", $_POST["valores_horario"]);

if ($_POST["id_intervalo"] != "undefined") {
    $intervalo = $_POST["id_intervalo"];
} else {
    $resultado = $objeto->GetIntervalo($_POST["ano"], $_POST["seccion"]);
    if (count($resultado) > 0) {
        $intervalo = $resultado[0][0];
    }
}

$objeto->ClearHorario($_POST["ano"], $_POST["seccion"]);

if (count($bloques) > 1) {
    for ($i = 0; $i < count($bloques); ) {
        // Asignar valores de $_POST a variables
        $receso = $_POST['receso'];
        $ano_escolar = $_POST["ano"];
        $ano_seccion = $_POST["seccion"];
        $asginatura = $bloques[$i + 2];
        $aula = $bloques[$i + 1];
        $bloque = $bloques[$i];
        $grupo = $bloques[$i + 4];
        $profesor = $bloques[$i + 3];
        $id = $intervalo;

        //Si la asignatura es válida entonces encerrarla en comillas para ejecutar correctamente el query
        if ($asginatura!='null'){
            $asginatura="'".$asginatura."'";
        }
  
        
        // Llamada a setDatos con las variables definidas
        $objeto->setDatos($receso, $ano_escolar, $ano_seccion, $asginatura, $aula, $bloque, $grupo, $profesor, $id);
        echo $objeto->Registrar_Horario();

        $i = $i + 5;
    }
    session_start();
    require_once("c_bitacora.php");
    insertBitacora($_SESSION['username'], "add", $_SESSION['username']." ha creado el horario para el año ".$_POST["ano"]." sección ".$_POST["nom"].".");
}

header("Location: ../Vista/Horario/horario.php");
?>
