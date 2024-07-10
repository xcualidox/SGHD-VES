<?php 
include_once("../../Modelo/profesor_materia.php");
class query extends zona {
    function GenerarTabla($offset,$limit)  {
        return $this->tabla($offset,$limit);
    }
    function TotalPaginas() {
        return $this->TotaldePagina();
    }
    function ListAsignaturas()  {
        return $this->ListadeAsignaturas();
    }
    function ProfesoresMaterias()  {
        return $this->Profesores_Materias();
    }
}
?>