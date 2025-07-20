<?php
include_once("basedatos.php");
class seccion extends database_connect{
    private $a, $sec,$horareceso;

    function setDatos($a, $sec,$horareceso){
		$this->a=$a;
		$this->sec=$sec;
		$this->horareceso=$horareceso;
	  }

    function incluye(){
        $sql= "insert into ano_seccion(ano, seccion,receso) values(?,?,?)";
    return $this->query($sql,[$this->a,$this->sec,$this->horareceso]);
    }

function modificar($codigo) {
    $sql = "UPDATE `ano_seccion`
            SET `ano` = ?, `seccion` = ?, `receso` = ?
            WHERE `codigo` = ?";
    return $this->query($sql, [$this->a, $this->sec, $this->horareceso, $codigo]);
}
    
    function eliminar($origin, $origin2) {
      $sql= "DELETE FROM `ano_seccion` WHERE `codigo`=?";
    return $this->query($sql,[$origin]);
    }
    function tabla($offset, $limit) {
      $sql= "SELECT * from ano_seccion LIMIT $offset,$limit";
    return $this->fetch_all_query($this->query($sql,""));
    }
    function TotaldePagina() {
      $sql= "SELECT `ano` from ano_seccion";
      return count($this->fetch_all_query($this->query($sql,"")));
    }
}

class query extends seccion {
  function GenerarTabla($offset,$limit)  {
      return $this->tabla($offset,$limit);
  }
  function TotalPaginas() {
      return $this->TotaldePagina();
  }
}

?>