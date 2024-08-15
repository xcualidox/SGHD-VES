<?php
include_once("basedatos.php");
class zona extends database_connect{
    private $nom, $fecI, $fechaF;

    function setDatos($cedula, $p_nombre, $s_nombre, $p_apellido, $s_apellido, $direccion, $telefono, $correo){
		$this->cedula=$cedula;
		$this->p_nombre=strtoupper($p_nombre);
    $this->s_nombre=strtoupper($s_nombre);
    $this->p_apellido=strtoupper($p_apellido);
    $this->s_apellido=strtoupper($s_apellido);
    $this->direccion=strtoupper($direccion);
    $this->telefono=$telefono;
    $this->correo=$correo;
	  }

    function incluye(){
        $sql= "insert into personas(cedula, nombres, apellidos, direccion, telefono, correo) values(?,?,?,?,?,?,?,?)";
		return $this->query($sql,[$this->cedula,$this->p_nombre,$this->s_nombre,$this->p_apellido,$this->s_apellido,$this->direccion,$this->telefono,$this->correo]);
    }

    function modificar($origin){
        $sql= "UPDATE `personas`
                SET `cedula`=?, `nombres`=?, `apellidos`=?, `direccion`=?, `telefono`=?, `correo`=?
                WHERE `cedula`=?";
		return $this->query($sql,[$this->cedula,$this->p_nombre,$this->s_nombre,$this->p_apellido,$this->s_apellido,$this->direccion,$this->telefono,$this->correo,$origin]);
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