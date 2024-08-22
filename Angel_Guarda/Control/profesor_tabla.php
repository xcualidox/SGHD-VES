<?php 
include_once("../../Modelo/profesor.php");
class query extends personas {
    function GenerarTabla($offset,$limit)  {
        return $this->tabla($offset,$limit);
    }
    function TotalPaginas() {
        return $this->TotaldePagina();
    }
    function obtenerDatosProfesores() {
        $zona = new personas();
        return $zona->tabla(0, 100); // Reemplaza los parámetros por los adecuados
    }
}
?>