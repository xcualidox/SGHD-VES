<?php
include_once("basedatos.php");
class zona extends database_connect{
    private $nom, $des, $dis;

    function setDatos($nom, $des, $dis){
		$this->nom=$nom;
		$this->des=$des;
        $this->dis=$dis;
	  }

    function incluye(){
        $sql= "insert into aula(nombre, descripcion, disponibilidad) values(?,?,?)";
		return $this->query($sql,[$this->nom,$this->des,$this->dis]);
    }

    function modificar($origin){
        $sql= "UPDATE `aula`
                SET `nombre`=?, `descripcion`=?
                WHERE `nombre`=?";
		return $this->query($sql, [$this->nom, $this->des, $origin]);
    }
    
    function eliminar($origin) {
      $sql= "DELETE FROM `aula` WHERE `nombre`=?";
		return $this->query($sql,$origin);
    }
    function Disponibilidad($disponibilidad, $nom) {
      $sql= "UPDATE `aula` SET `disponibilidad`=? WHERE `nombre`=?";
		return $this->query($sql,[$disponibilidad,$nom]);
    }
    function tabla($offset, $limit) {
      $sql= "SELECT * FROM aula LIMIT $offset,$limit";
		return $this->fetch_all_query($this->query($sql,""));
    }
    function TotaldePagina() {
      $sql= "SELECT `nombre` from aula";
      return count($this->fetch_all_query($this->query($sql,"")));
    }
}

?>