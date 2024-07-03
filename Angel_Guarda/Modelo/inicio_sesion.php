<?php
include_once("basedatos.php");
class zona extends bdmysql{
    private $usuario;

    function setDatos($usuario){
		$this->usuario=$usuario;
	  }

    function validar(){
        $sql= "SELECT * FROM `usuarios` WHERE `cedula`='$this->usuario'";
		return $this->ListAll($this->ejecutar($sql),MYSQLI_NUM);
    }

    function CrearClave($clave, $pregunta, $respuesta){
        $sql= "UPDATE `usuarios`
                SET `clave`='$clave', `pregunta_seguridad`='$pregunta', `respuesta`='$respuesta'
                WHERE `cedula`='$this->usuario'";
		return $this->ejecutar($sql);
    }
    
    function eliminar($origin, $origin2) {
      $sql= "DELETE FROM `ano_seccion` WHERE `ano`='$origin' AND `seccion`='$origin2'";
		return $this->ejecutar($sql);
    }
}

?>