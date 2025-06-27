<?php
include_once("../Modelo/horario.php"); 
$objeto = new zona();
$bloques = explode(",", $_POST["valores_horario"]);

// Definición de la página

// echo "<pre>";
// echo "Contenido de \$_POST:\n";
// var_dump($_POST);

// if (isset($_POST["valores_horario"])) {
//     $bloques = explode(",", $_POST["valores_horario"]);
//     echo "\nContenido del array \$bloques (extraído de valores_horario):\n";
//     var_dump($bloques);
// } else {
//     echo "\nAdvertencia: No se recibió valores_horario por POST.\n";
// }
// echo "</pre>";

// // Puedes poner un die aquí para detener la ejecución si solo estás haciendo debug
// die("Fin del vardump. Revisa los datos anteriores.");
$pagina = isset($_POST['pagina']) ? $_POST['pagina'] : 1;
$resultados_por_pagina = 10;
$offset = ($pagina - 1) * $resultados_por_pagina;



// Validar y asignar $intervalo
$intervalo = 45;
// if (isset($_POST["id_intervalo"]) && $_POST["id_intervalo"] !== "undefined" && $_POST["id_intervalo"] !== "") {
//     $intervalo = $_POST["id_intervalo"];
// } else {
//     $resultado = $objeto->GetIntervalo($_POST["ano"], $_POST["seccion"]);
//     var_dump( $resultado );
//      var_dump ($intervalo);   
//     if (count($resultado) > 0) {
//         $intervalo = $resultado[0][0];

   
//     } else {
//         // Si no hay intervalo válido, detenemos el proceso
//         die("Error: No se encontró un intervalo válido para el año y sección seleccionados.");
//     }
// }

// Limpiar horario anterior
$objeto->ClearHorario(18, ano_seccion: 22);

// Procesar bloques si hay datos
if (count($bloques) > 1) {
    for ($i = 0; $i < count($bloques); ) {
        // Asignar valores
        $receso = $_POST['receso'];
        $ano_escolar = 18;
        $ano_seccion = 22;
        $asginatura = $bloques[$i + 2];
        $aula = $bloques[$i + 1];
        $bloque = $bloques[$i];
        $grupo = $bloques[$i + 4];
        $profesor = $bloques[$i + 3];
        $id = $intervalo;

        // Asegurarse de que la asignatura sea válida
        if ($asginatura != 'null') {
            $asginatura = "'".$asginatura."'";
        }

        // Registrar horario
        $objeto->setDatos($receso, $ano_escolar, $ano_seccion, $asginatura, $aula, $bloque, $grupo, $profesor, $id);
        echo $objeto->Registrar_Horario();

        $i = $i + 5;
    }

    // Bitácora
    require_once("c_bitacora.php");
    $ano_array = $objeto->SelectAlgo('nombre','ano_escolar','codigo='.$ano_escolar);
    $seccion_array = $objeto->SelectAlgo('*','ano_seccion','codigo='.$ano_seccion);

    $ano_bitacora = $ano_array[0][0];
    $seccion_bitacora = $seccion_array[0][1].' '.$seccion_array[0][2];

    insertBitacora($_SESSION['username'], "insertar", 'Creó el horario para el año "'.$ano_bitacora.'" sección "'.$seccion_bitacora.'".');
}

header("Location: ../Vista/Horario/horario.php");
exit();
?>