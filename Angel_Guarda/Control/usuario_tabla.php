<?php 
include_once("../../Modelo/usuario.php");
function GenerarTabla($offset,$limit)  {
    $objeto = new zona();
    return $objeto->tabla($offset,$limit);
}
function TotalPaginas() {
    $objeto = new zona();
    return $objeto->TotaldePagina();
}

?>