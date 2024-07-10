<?php 
include_once("../../Modelo/aula.php");
class query extends zona {
    function GenerarTabla($offset,$limit)  {
        return $this->tabla($offset,$limit);
    }
    function TotalPaginas() {
        return $this->TotaldePagina();
    }
}
?>