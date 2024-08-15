<?php
include_once("basedatos.php");
class zona extends database_connect{
    private $nom, $fecI, $fechaF;

    function setDatos($cedula, $nombres, $apellidos, $direccion, $telefono, $correo){
		$this->cedula=$cedula;
		$this->nombres=strtoupper($nombres);
    $this->apellidos=strtoupper($apellidos);
    $this->direccion=strtoupper($direccion);
    $this->telefono=$telefono;
    $this->correo=$correo;
	  }

    function incluye(){
        $sql= "insert into personas(cedula, nombres, apellidos, direccion, telefono, correo) values(?,?,?,?,?,?)";
		return $this->query($sql,[$this->cedula,$this->nombres,$this->apellidos,$this->direccion,$this->telefono,$this->correo]);
    }

    function modificar($origin){
        $sql= "UPDATE `personas`
                SET `cedula`=?, `nombres`=?, `apellidos`=?, `direccion`=?, `telefono`=?, `correo`=?
                WHERE `cedula`=?";
		return $this->query($sql,[$this->cedula,$this->nombres,$this->apellidos,$this->direccion,$this->telefono,$this->correo,$origin]);
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