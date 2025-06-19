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

        if(isset($_POST['pagina'])){
            $pagina = $_POST['pagina'];
        }
        else{      $pagina = 1;        }
        
        $resultados_por_pagina = 10;
        
        $limit = $resultados_por_pagina;
        
        $offset = ($pagina-1)*$resultados_por_pagina;

        return $this->SelectAllHorario($limit,$offset);
    }
    function SelectProfesores() {
        return $this->SelectAllProfesores();
    }
    function SelectIntervalo() {
        return $this->SelectAllIntervalo();
    }
}

?>