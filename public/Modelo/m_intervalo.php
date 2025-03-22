<?php
include_once("basedatos.php");
class intervalo extends database_connect{
    private $nom, $des, $dis;

    function setDatos($nom){
		$this->nom=$nom;
	  }

    function incluye(){
        $sql= "insert into intervalo(intervalo, estado) values(?,'0')";
		return $this->query($sql,$this->nom);
    }

    function modificar($origin){
        $sql= "UPDATE `intervalo`
                SET `intervalo`=?
                WHERE `intervalo`=?";
		return $this->query($sql, [$this->nom,$origin]);
    }
    
    function eliminar($origin) {
      $sql= "DELETE FROM `intervalo` WHERE `intervalo`=?";
		return $this->query($sql,[$origin]);
    }
    function Disponibilidad($disponibilidad, $nom) {
      $reset= "UPDATE `intervalo` SET `estado`='0'";
      $this->query($reset,"");
      $sql= "UPDATE `intervalo` SET `estado`=? WHERE `id`=?";
		return $this->query($sql,[$disponibilidad,$nom]);
    }
    function tabla($offset, $limit) {
      $sql= "SELECT * from intervalo LIMIT $offset,$limit";
			return $this->fetch_all_query($this->query($sql,""));
    }
    function TotaldePagina() {
      $sql= "SELECT * from intervalo";
      return count($this->fetch_all_query($this->query($sql,"")));
    }
}

class query extends intervalo {
  function GenerarTabla($offset,$limit)  {
      return $this->tabla($offset,$limit);
  }
  function TotalPaginas() {
      return $this->TotaldePagina();
  }
}

?>