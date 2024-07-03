<?php
include_once("basedatos.php");
class zona extends database_connect{
    private $a, $sec;

    function setDatos($a, $sec){
		$this->a=$a;
		$this->sec=$sec;
	  }

    function incluye(){
        $sql= "insert into ano_seccion(ano, seccion) values(?,?)";
    return $this->query($sql,[$this->a,$this->sec]);
    }

    function modificar($origin, $origin2){
        $sql= "UPDATE `ano_seccion`
                SET `ano`=?, `seccion`=?
                WHERE `ano`=? AND `seccion`=?";
		return $this->query($sql,[$this->a,$this->sec,$origin,$origin2]);
    }
    
    function eliminar($origin, $origin2) {
      $sql= "DELETE FROM `ano_seccion` WHERE `ano`=? AND `seccion`=?";
    return $this->query($sql,[$origin,$origin2]);
    }
    function tabla($offset, $limit) {
      $sql= "SELECT `ano`, `seccion` from ano_seccion LIMIT $offset,$limit";
    return $this->fetch_all_query($this->query($sql,""));
    }
    function TotaldePagina() {
      $sql= "SELECT `ano` from ano_seccion";
      return count($this->fetch_all_query($this->query($sql,"")));
    }
}

?>