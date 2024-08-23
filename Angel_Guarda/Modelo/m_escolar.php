<?php
include_once("basedatos.php");
class escolar extends database_connect{
    private $nom, $fecI, $fechaF;

    function setDatos($nom, $fecI, $fechaF){
		$this->nom=$nom;
		$this->fecI=$fecI;
    $this->fechaF=$fechaF;
	  }

    function incluye(){
        $sql= "insert into ano_escolar(nombre, fecha_inicio, fecha_fin) values(?,?,?)";
		return $this->query($sql,[$this->nom,$this->fecI,$this->fechaF]);
    }

    function modificar($origin){
        $sql= "UPDATE `ano_escolar`
                SET `nombre`=?, `fecha_inicio`=?, `fecha_fin`=?
                WHERE `nombre`=?";
		return $this->query($sql,[$this->nom,$this->fecI,$this->fechaF,$origin]);
    }
    
    function eliminar($origin) {
      $sql= "DELETE FROM `ano_escolar` WHERE `nombre`=?";
		return $this->query($sql,$origin);
    }
    function tabla($offset, $limit) {
      $sql= "SELECT `nombre`, `fecha_inicio`, `fecha_inicio`, `fecha_fin` from ano_escolar LIMIT $offset,$limit";
		return $this->fetch_all_query($this->query($sql,""));
    }
    function TotaldePagina() {
      $sql= "SELECT `nombre` from ano_escolar";
		return count($this->fetch_all_query($this->query($sql,"")));
    }
}

class query extends escolar {
  function GenerarTabla($offset,$limit)  {
      return $this->tabla($offset,$limit);
  }
  function TotalPaginas() {
      return $this->TotaldePagina();
  }
}

?>