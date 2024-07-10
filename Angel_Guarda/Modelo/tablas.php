<?php
include_once("basedatos.php");
class zona extends bdmysql{
    function tabla($offset, $limit, $tabla) {
      $sql= "SELECT * from $tabla LIMIT $offset,$limit";
		return $this->ejecutar($sql);
    }
    function TotaldePagina($tabla) {
      $sql= "SELECT * from $tabla";
		return $this->Cantidad($this->ejecutar($sql));
    }
}

?>