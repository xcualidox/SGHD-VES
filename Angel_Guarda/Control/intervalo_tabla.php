<?php 
include_once("../../Modelo/intervalo.php");
class query extends zona {
    function GenerarTabla($offset,$limit)  {
        return $this->tabla($offset,$limit);
    }
    function TotalPaginas() {
        return $this->TotaldePagina();
    }
}
?>