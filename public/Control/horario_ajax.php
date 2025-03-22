<?php 
include_once("../Modelo/horario.php"); 
require_once("c_bitacora.php");

$objeto = new zona();
if (isset($_POST["bloques"])) {
    $dato=$objeto->VerificarAula($_POST["anos"],$_POST["bloques"]);
    $mismaAula=$objeto->VerificarHorarioAula($_POST["anos"],$_POST["seccion"],$_POST['bloques']);

    $datoAplanado=array_merge(...$dato);
    $mismaAulaAplanada=array_merge(...$mismaAula);

    $dato_diff=array_values(array_diff($datoAplanado,$mismaAulaAplanada));

    echo json_encode($dato_diff);
    exit();
}
else if (isset($_POST["materia"])) {
    $array= array();
    $x=0;
    $dato=$objeto->ListaMateriaPrefesor($_POST["materia"]);

    //Verifica si el bloque a modificar tiene el mismo profesor
    $mismoProfesor=$objeto->VerificarHorarioProfesor($_POST["ano_array"], $_POST["seccion"],$_POST["materia"],$_POST["block"]);

    //Aplana las array, es decir, las convierte de multi a unidimensional
    $datoFlat=array_merge(...$dato);
    $mismoProfesorFlat=array_merge(...$mismoProfesor);

    for ($i=0; $i < count($dato); $i++) { 
        $consulta=$objeto->ListaBloqueProfesor($_POST["block"], $dato[$i][0], $_POST["ano_array"]);
        if (count($consulta)==0) {
            $array[$x]=$dato[$i][0];
            $x=$x+1;
        }
    }
    //Si la query que verifica si el bloque tiene el mismo profesor da un resultado, entonces lo añade de vuelta a la array para mostrarlo en modificar
    if ($mismoProfesorFlat){
        $array[$x+1]=$mismoProfesorFlat[0];
        $array=array_values($array);
    }
    echo json_encode($array);
    exit();
}
else if(isset($_POST["ano_solo"])) {
    $dato=$objeto->BorrarBloque($_POST["ano_solo"],$_POST["block"],$_POST["seccion_solo"]);
    echo json_encode($dato);
    exit();
}
else if (isset($_POST["anos_crear"])) {
    $dato=$objeto->VerificarAno($_POST["anos_crear"]);
    echo json_encode($dato);
    exit();
}
else if(isset($_POST["anos_borrar"]) && isset($_POST["seccion_borrar"])){
    $dato=$objeto->eliminar($_POST["anos_borrar"], $_POST["seccion_borrar"]);

    //Busca los valores para la bitácora
    $ano_array=$objeto->SelectAlgo('nombre','ano_escolar','codigo='.$_POST["anos_borrar"]);
    $seccion_array=$objeto->SelectAlgo('*','ano_seccion','codigo='.$_POST["seccion_borrar"]);

    //Los saca directamente del array
    $ano_bitacora=$ano_array[0][0];
    $seccion_bitacora=$seccion_array[0][1].' '.$seccion_array[0][2];

    insertBitacora($_SESSION['username'], "eliminar", 'Eliminó el horario del año "'.$ano_bitacora.'" sección "'.$seccion_bitacora.'".');
    echo json_encode($dato);
    exit();
}
else {
    $dato=$objeto->BloquesHorario($_POST["anos"],$_POST["seccion"]);
    echo json_encode($dato);
    exit();
}

?>