<?php
include_once("basedatos.php");
class asignatura extends database_connect{
    private $cod, $nom, $years;

    function setDatos($cod, $nom, $years){
		$this->cod=$cod;
		$this->nom=$nom;
		$this->years=$years;
	  }

    function incluye(){
        $queries = ["insert into asignatura(codigo, nombre) values(?,?)" => [$this->cod,$this->nom]];
        foreach($this->years as $year){
           $queries["insert into materia_ano(codigo_materia, ano) values(?,?)".str_repeat(' ', $year)] = [$this->cod, $year];
        }
        // $sql= "insert into asignatura(codigo, nombre) values(?,?)";
    // return $this->query($sql,[$this->cod,$this->nom]);
       return $this->queryTransaction($queries);
    }

    function modificar($origin){
        // $sql= "UPDATE `asignatura`
        //         SET `codigo`=?, `nombre`=?
        //         WHERE `codigo`=?";
        $queries = ["UPDATE `asignatura`
                SET `codigo`=?, `nombre`=?
                WHERE `codigo`=?" => [$this->cod,$this->nom,$origin]];
        $queries["DELETE FROM materia_ano WHERE codigo_materia = ?".str_repeat(' ', $year)] = [$origin];
        foreach($this->years as $year){
           $queries["insert into materia_ano(codigo_materia, ano) values(?,?)".str_repeat(' ', $year)] = [$this->cod, $year];
        }
		    return $this->queryTransaction($queries);
    }
    
    function eliminar($origin) {
      $sql= "DELETE FROM `asignatura` WHERE `codigo`=?";
      return $this->query($sql,$origin);
    }
    function tabla($offset, $limit) {
      $sql= "SELECT 
    a.codigo,
    a.nombre, 
    -- Otros campos de asignatura que necesites
    GROUP_CONCAT(aa.ano ORDER BY aa.ano SEPARATOR ', ') AS anos_asociados
FROM 
    asignatura a
LEFT JOIN 
    materia_ano aa ON a.codigo = aa.codigo_materia
GROUP BY 
    a.codigo, a.nombre LIMIT $offset,$limit";
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