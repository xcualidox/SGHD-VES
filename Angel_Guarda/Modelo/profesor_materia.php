<?php
include_once("basedatos.php");
class zona extends database_connect{
    private $usuario;

    function setDatos($usuario){
		$this->usuario=$usuario;
	  }

    function registrar($profesor, $materia){
      $sql= "INSERT INTO `profesores_materias`(`profesor`, `materia`) VALUES(?,?)";
		  return $this->query($sql,[$profesor,$materia]);
    }

    function Eliminar($profesor){
        $sql= "DELETE FROM `profesores_materias`
        WHERE profesor = ?";
		 return $this->query($sql,$profesor);
    }
    function SeleccionarMaterias($cedula) {
      $sql="SELECT `materia` FROM `profesores_materias` WHERE `profesor`=?";
      return $this->fetch_all_query($this->query($sql,$cedula)); 
    }
    function tabla($offset, $limit) {
      $sql= "SELECT DISTINCT personas.cedula, personas.nombres, personas.apellidos
      FROM personas
      INNER JOIN profesores_materias ON personas.cedula = profesores_materias.profesor LIMIT $offset,$limit";
		return $this->fetch_all_query($this->query($sql,""));
    }
    function Profesores_Materias() {
      $sql= "SELECT *
      FROM personas
      LEFT JOIN profesores_materias ON personas.cedula = profesores_materias.profesor
      WHERE profesores_materias.profesor IS NULL";
		return $this->fetch_all_query($this->query($sql,""));
    }
    function TotaldePagina() {
      $sql= "SELECT DISTINCT personas.cedula, personas.nombres, personas.apellidos
      FROM personas
      INNER JOIN profesores_materias ON personas.cedula = profesores_materias.profesor";
		return count($this->fetch_all_query($this->query($sql,"")));
    }
    function ListadeAsignaturas() {
      $sql="SELECT * from asignatura";
      return $this->fetch_all_query($this->query($sql,""));
    }
}

?>