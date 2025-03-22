<?php 
include_once("../../Modelo/horario.php");
class query extends zona {
    function SelectAno_Escolar()  {
        return $this->SelectAllAno_Escolar();
    }
    function SelectAno_Seccion() {
        return $this->SelectAllAno_Seccion();
    }
    function SelectAula() {
        return $this->SelectAllAula();
    }
    function SelectAsignatura() {
        return $this->SelectAllAsignatura();
    }
    function SelectHorario() {
        return $this->SelectAllHorario();
    }
    function SelectProfesores() {
        return $this->SelectAllProfesores();
    }
    function SelectIntervalo() {
        return $this->SelectAllIntervalo();
    }
}

?>