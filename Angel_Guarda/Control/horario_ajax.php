<?php 
include_once("../Modelo/horario.php"); 
$objeto = new zona();
if (isset($_POST["bloques"])) {
    $dato=$objeto->VerificarAula($_POST["anos"],$_POST["bloques"]);
    echo json_encode($dato);
}
else if (isset($_POST["materia"])) {
    $array= array();
    $x=0;
    $dato=$objeto->ListaMateriaPrefesor($_POST["materia"]);
    for ($i=0; $i < count($dato); $i++) { 
        $consulta=$objeto->ListaBloqueProfesor($_POST["block"], $dato[$i][0], $_POST["ano_array"]);
        if (count($consulta)==0) {
            $array[$x]=$dato[$i][0];
            $x=$x+1;
        }
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