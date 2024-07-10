<?php
include_once("basedatos.php");
class zona extends bdmysql{
    private $nom, $fecI, $fechaF;

    function setDatos($cedula, $nombre, $apellido, $rol){
		$this->cedula=$cedula;
		$this->nombre=strtoupper($nombre);
    $this->apellido=strtoupper($apellido);
    $this->rol=strtoupper($rol);
	  }

    function incluye(){
        $sql= "insert into usuarios(cedula, nombre, apellido, rol) values('$this->cedula','$this->nombre', '$this->apellido', '$this->rol')";
		return $this->ejecutar($sql);
    }

    function modificar($origin){
        $sql= "UPDATE `usuarios`
                SET `cedula`='$this->cedula', `nombre`='$this->nombre', `apellido`='$this->apellido', `rol`='$this->rol'
                WHERE `cedula`='$origin'";
		return $this->ejecutar($sql);
    }
    
    function eliminar($origin) {
      $sql= "DELETE FROM `usuarios` WHERE `cedula`='$origin'";
		return $this->ejecutar($sql);
    }
    function tabla($offset, $limit) {
      $sql= "SELECT * from `usuarios` WHERE `cedula`<>'2023' LIMIT $offset,$limit";
		return $this->ejecutar($sql);
    }
    function TotaldePagina() {
      $sql= "SELECT * from `usuarios` WHERE `cedula`<>'2023'";
		return $this->Cantidad($this->ejecutar($sql));
    }
}

?>