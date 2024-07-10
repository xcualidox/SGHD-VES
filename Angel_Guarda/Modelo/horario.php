<?php
include_once("basedatos.php");
class zona extends bdmysql{
    private $ano_escolar, $ano_seccion, $asginatura, $aula, $bloque;

    function setDatos($ano_escolar, $ano_seccion, $asginatura, $aula, $bloque, $grupo, $profesor,$id){
      $this->ano_escolar=$ano_escolar;
      $this->ano_seccion=$ano_seccion;
        $this->asginatura=$asginatura;
        $this->aula=$aula;
        $this->bloque=$bloque;
        $this->grupo=$grupo;
        $this->profesor=$profesor;
        $this->id=$id;
	  }

    function Registrar_Horario(){
        $sql= "INSERT INTO  horario_estudiante(codigo_a_escolar, codigo_a_y_seccion, codigo_asignatura, codigo_aula, codigo_dia, grupo, profesor, intervalo) values('$this->ano_escolar','$this->ano_seccion', '$this->asginatura', '$this->aula', '$this->bloque', '$this->grupo', '$this->profesor','$this->id')";
		return $this->ejecutar($sql);
    }
    function ListaMateriaPrefesor($materia) {
      $sql="SELECT DISTINCT profesores_materias.profesor FROM `profesores_materias` WHERE profesores_materias.materia='$materia'";
      return $this->ListAll($this->ejecutar($sql), MYSQLI_NUM); 
    }
    function ListaBloqueProfesor($bloque,$cedula, $ano) {
      $sql="SELECT DISTINCT `profesor` FROM `horario_estudiante` WHERE `profesor`='$cedula' AND `codigo_dia`='$bloque' AND codigo_a_escolar = '$ano'";
      return $this->ListAll($this->ejecutar($sql), MYSQLI_NUM); 
    }
    function BorrarBloque($ano,$bloque,$seccion) {
      $sql="DELETE FROM `horario_estudiante` WHERE `codigo_a_escolar`='$ano' AND `codigo_dia`='$bloque' AND codigo_a_y_seccion = '$seccion'";
      return $this->ejecutar($sql); 
    }
    function GetIntervalo($ano_escolar, $ano_seccion) {
      $sql= "SELECT DISTINCT `intervalo` FROM `horario_estudiante` WHERE codigo_a_escolar = '$ano_escolar' AND codigo_a_y_seccion = '$ano_seccion'";
		  return $this->ListAll($this->ejecutar($sql), MYSQLI_NUM); 
    }
    function VerificarAula($ano,$bloque)  {
        $sql= "SELECT `codigo_aula` FROM `horario_estudiante` WHERE `codigo_a_escolar`='$ano' AND `codigo_dia`='$bloque'";
		return $this->ListAll($this->ejecutar($sql), MYSQLI_NUM); 
    }
    function VerificarAno($ano)  {
      $sql= "SELECT DISTINCT `codigo_a_y_seccion` FROM `horario_estudiante` WHERE `codigo_a_escolar`='$ano'";
    return $this->ListAll($this->ejecutar($sql), MYSQLI_NUM); 
    }
    function ClearHorario($ano_escolar, $ano_seccion) {
      $sql="DELETE FROM `horario_estudiante`
      WHERE codigo_a_escolar = '$ano_escolar' AND codigo_a_y_seccion = '$ano_seccion';";
      return $this->ejecutar($sql);
    }
    function BloquesHorario($ano_escolar, $seccion) {
      $sql="SELECT aula.codigo, aula.nombre, asignatura.codigo,  asignatura.nombre, horario_estudiante.codigo_dia, horario_estudiante.grupo, personas.cedula, personas.primer_nombre, personas.segundo_nombre, personas.primer_apellido, personas.segundo_apellido
      FROM horario_estudiante
      JOIN asignatura ON horario_estudiante.codigo_asignatura = asignatura.codigo
      JOIN aula ON horario_estudiante.codigo_aula = aula.codigo 
      JOIN personas ON horario_estudiante.profesor= personas.cedula
      WHERE horario_estudiante.codigo_a_escolar='$ano_escolar' 
      AND horario_estudiante.codigo_a_y_seccion='$seccion'";
      return $this->ListAll($this->ejecutar($sql), MYSQLI_NUM);
    }
    function BloquesHorarioPDF($ano_escolar, $seccion, $bloque) {
      $sql="SELECT aula.codigo, aula.nombre, asignatura.codigo,  asignatura.nombre, horario_estudiante.codigo_dia, horario_estudiante.grupo, personas.cedula, personas.primer_nombre, personas.segundo_nombre, personas.primer_apellido, personas.segundo_apellido
      FROM horario_estudiante
      JOIN asignatura ON horario_estudiante.codigo_asignatura = asignatura.codigo
      JOIN aula ON horario_estudiante.codigo_aula = aula.codigo 
      JOIN personas ON horario_estudiante.profesor= personas.cedula
      WHERE horario_estudiante.codigo_a_escolar='$ano_escolar' 
      AND horario_estudiante.codigo_a_y_seccion='$seccion'
      AND horario_estudiante.codigo_dia='$bloque'";
      return $this->ListAll($this->ejecutar($sql), MYSQLI_NUM);
    }
    function modificar($origin){
        $sql= "UPDATE `ano_escolar`
                SET `nombre`='$this->nom', `fecha_inicio`='$this->fecI', `fecha_fin`='$this->fechaF'
                WHERE `nombre`='$origin'";
		return $this->ejecutar($sql);
    }
    
    function eliminar($ano, $seccion) {
      $sql= "DELETE FROM `horario_estudiante` WHERE `codigo_a_escolar`='$ano' AND `codigo_a_y_seccion`='$seccion'";
		return $this->ejecutar($sql);
    }
}

?>