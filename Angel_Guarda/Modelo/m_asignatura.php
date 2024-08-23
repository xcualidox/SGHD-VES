<?php
include_once("basedatos.php");
class asignatura extends database_connect{
    private $cod, $nom;

    function setDatos($cod, $nom){
		$this->cod=$cod;
		$this->nom=$nom;
	  }

    function incluye(){
        $sql= "insert into asignatura(codigo, nombre) values(?,?)";
    return $this->query($sql,[$this->cod,$this->nom]);
    }

    function modificar($origin){
        $sql= "UPDATE `asignatura`
                SET `codigo`=?, `nombre`=?
                WHERE `codigo`=?";
		return $this->query($sql,[$this->cod,$this->nom,$origin]);
    }
    
    function eliminar($origin) {
      $sql= "DELETE FROM `asignatura` WHERE `codigo`=?";
      return $this->query($sql,$origin);
    }
    function tabla($offset, $limit) {
      $sql= "SELECT * from asignatura LIMIT $offset,$limit";
      return $this->fetch_all_query($this->query($sql,""));
    }
    function TotaldePagina() {
      $sql= "SELECT * from asignatura";
      return count($this->fetch_all_query($this->query($sql,"")));
    }
}

class query extends asignatura {
  function GenerarTabla($offset,$limit)  {
      return $this->tabla($offset,$limit);
  }
  function TotalPaginas() {
      return $this->TotaldePagina();
  }
  function obtenerDatosAsignaturas() {
    $zona = new asignatura();
    return $zona->tabla(0, 100); // Reemplaza los parámetros por los adecuados
}
}

?>