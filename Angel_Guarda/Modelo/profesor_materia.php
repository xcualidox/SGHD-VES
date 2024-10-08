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

    function Modificar($nuevoprofesor, $profesor){
      $sql= "UPDATE `profesores_materias` SET `profesor`=? WHERE `profesor`=?";
      return $this->query($sql,[$nuevoprofesor,$profesor]);
    }

    function VerificarProfesorPensum($cedula) {
      $sql="SELECT * FROM `profesores_materias` WHERE `profesor`=?";
      return $this->fetch_all_query($this->query($sql,$cedula));
    }

    function VerificarProfesorPersona($cedula) {
      $sql="SELECT * FROM `personas` WHERE `cedula`=?";
      return $this->fetch_all_query($this->query($sql,$cedula));
    }

    function VerificarMateriaPensum($cedula){
      $sql="SELECT `materia` FROM `profesores_materias` where `profesor`=?";
      return $this->fetch_all_query($this->query($sql,$cedula));
    }

    function EliminarMaterias($profesor,$a_conservar){
      $sql= "DELETE FROM `profesores_materias` WHERE profesor = ? and materia NOT IN ( ".$a_conservar." );";
      return $this->query($sql,$profesor);
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