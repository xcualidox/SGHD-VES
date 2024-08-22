<?php
include_once("basedatos.php");
class zona extends database_connect{
    private $cedula;
    private $nombres;
    private $apellidos;
    private $direccion;
    private $telefono;
    private $correo;

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
    function verificarCedula($cedula) {
      $sql = "SELECT * FROM `personas` WHERE `cedula` = ?";
      
  
      $resultado = $this->query($sql, [$cedula]);

      // Verificar si hubo algún resultado
      if ($resultado) {
          // Retorna los datos obtenidos
          return $this->fetch_query($resultado); // Retorna el primer registro encontrado
      } else {
          return false;
      }
  }
    
    
    function eliminar($origin) {
      $sql=  "
      DELETE FROM `personas` WHERE `cedula` = ?;
      DELETE FROM `login` WHERE `username` = ?
      ";
	  return $this->query($sql, [$origin, $origin]);
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