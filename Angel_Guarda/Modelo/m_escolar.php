<?php
include_once("basedatos.php");
class escolar extends database_connect{
    private $nom, $fecI, $fechaF;

    function setDatos($nom, $fecI, $fechaF){
		$this->nom=$nom;
		$this->fecI=$fecI;
    $this->fechaF=$fechaF;
	  }

    function buscarAno($anoId){
      $sql="SELECT * FROM ano_escolar WHERE codigo LIKE ?";
      $query=$this->query($sql,[$anoId]);
      $result=$this->fetch_query($query);
      return $result;
    }
    function buscarIdAno($nombreAno){
      $sql="SELECT * FROM ano_escolar WHERE CONCAT(ano,' ',seccion) LIKE ?";
      $query=$this->query($sql,[$nombreAno]);
      $result=$this->fetch_query($query);
      return $result;
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
    function desactivarTodos() {
      $sql = "UPDATE ano_escolar SET activo = 0";
      return $this->query($sql,[]);
  }

  function cambiarEstado($nombre, $activo) {
      $sql = "UPDATE ano_escolar SET activo = ? WHERE nombre = ?";
      return $this->query($sql, [$activo, $nombre]);
  }
  function contarActivos() {
    $sql = "SELECT COUNT(*) as total FROM ano_escolar WHERE activo = 1";
    $result = $this->query($sql, null); // Ejecutamos la consulta sin parámetros adicionales

    // Usamos fetch_query para obtener el resultado
    if ($result) {
        $row = $this->fetch_query($result);
        return $row['total'] ?? 0; // Devolvemos el total o 0 si no existe
    }


    return 0;
}
    
    function eliminar($origin) {
      $sql= "DELETE FROM `ano_escolar` WHERE `nombre`=?";
		return $this->query($sql,$origin);
    }
    function tabla($offset, $limit) {
      $sql= "SELECT `nombre`, `fecha_inicio`, `fecha_inicio`, `fecha_fin`, `activo` from ano_escolar LIMIT $offset,$limit";
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