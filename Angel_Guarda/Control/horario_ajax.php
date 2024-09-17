<?php 
include_once("../Modelo/horario.php"); 
$objeto = new zona();
if (isset($_POST["bloques"])) {
    $dato=$objeto->VerificarAula($_POST["anos"],$_POST["bloques"]);
    $mismaAula=$objeto->VerificarHorarioAula($_POST["anos"],$_POST["seccion"],$_POST['bloques']);

    $datoAplanado=array_merge(...$dato);
    $mismaAulaAplanada=array_merge(...$mismaAula);

    $dato_diff=array_values(array_diff($datoAplanado,$mismaAulaAplanada));

    echo json_encode($dato_diff);
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
}
else if(isset($_POST["ano_solo"])) {
    $dato=$objeto->BorrarBloque($_POST["ano_solo"],$_POST["block"],$_POST["seccion_solo"]);
    echo json_encode($dato);
}
else if (isset($_POST["anos_crear"])) {
    $dato=$objeto->VerificarAno($_POST["anos_crear"]);
    echo json_encode($dato);
}
else if(isset($_POST["anos_borrar"]) && isset($_POST["seccion_borrar"])){
    $dato=$objeto->eliminar($_POST["anos_borrar"], $_POST["seccion_borrar"]);
    echo json_encode($dato);
}
else {
    $dato=$objeto->BloquesHorario($_POST["anos"],$_POST["seccion"]);
    echo json_encode($dato);
}

?>