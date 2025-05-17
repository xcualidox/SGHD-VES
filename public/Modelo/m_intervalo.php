<?php
include_once("basedatos.php");
class intervalo extends database_connect{
    private $nom,  $des, $dis;
    private $hourFinal;
    private $hourInicio;
    function setDatos($nom,    $hourInicio,   $hourFinal,){
		$this->nom=$nom;
    $this->hourFinal=$hourFinal;
     $this->hourInicio=$hourInicio;
	  }

    function incluye(){
        $sql = "INSERT INTO intervalo (intervalo, estado, hora_inicio,hora_final,) VALUES (?, '0', ?,?)";
        return $this->query($sql, [$this->nom, $this->hourInicio,$this->hourFinal]);
    }

  function modificar($origin){
    $sql = "UPDATE `intervalo`
            SET `intervalo` = ?,  `hora_inicio` = ?,`hora_final` = ?
            WHERE `intervalo` = ?";
    return $this->query($sql, [$this->nom,$this->hourInicio, $this->hourFinal, $origin]);
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