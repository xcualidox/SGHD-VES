<?php
include_once("basedatos.php");
class zona extends database_connect{
    private $nom, $fecI, $fechaF;

    function setDatos($cedula, $p_nombre, $s_nombre, $p_apellido, $s_apellido){
		$this->cedula=$cedula;
		$this->p_nombre=strtoupper($p_nombre);
    $this->s_nombre=strtoupper($s_nombre);
    $this->p_apellido=strtoupper($p_apellido);
    $this->s_apellido=strtoupper($s_apellido);
	  }

    function incluye(){
        $sql= "insert into personas(cedula, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido) values(?,?,?,?,?)";
		return $this->query($sql,[$this->cedula,$this->p_nombre,$this->s_nombre,$this->p_apellido,$this->s_apellido]);
    }

    function modificar($origin){
        $sql= "UPDATE `personas`
                SET `cedula`=?, `primer_nombre`=?, `segundo_nombre`=?, `primer_apellido`=?, `segundo_apellido`=?
                WHERE `cedula`=?";
		return $this->query($sql,[$this->cedula,$this->p_nombre,$this->s_nombre,$this->p_apellido,$this->s_apellido,$origin]);
    }
    
    function eliminar($origin) {
      $sql= "DELETE FROM `personas` WHERE `cedula`=?";
		return $this->query($sql,$origin);
    }
    function tabla($offset, $limit) {
      $sql= "SELECT * from `personas` LIMIT $offset,$limit";
    return $this->fetch_all_query($this->query($sql,""));
    }
    function TotaldePagina() {
      $sql= "SELECT * from `personas`";
      return count($this->fetch_all_query($this->query($sql,"")));
    }
}

?>