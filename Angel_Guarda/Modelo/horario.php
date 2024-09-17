<?php
include_once("basedatos.php");
class zona extends bdmysql{
    private $receso,$ano_escolar, $ano_seccion, $asginatura, $aula, $bloque,$grupo,$profesor,$id;

    function setDatos($receso,$ano_escolar, $ano_seccion, $asginatura, $aula, $bloque, $grupo, $profesor,$id){
      $this->receso=$receso;
      $this->ano_escolar=$ano_escolar;
      $this->ano_seccion=$ano_seccion;
        $this->asginatura=$asginatura;
        $this->aula=$aula;
        $this->bloque=$bloque;
        $this->grupo=$grupo;
        $this->profesor=$profesor;
        $this->id=$id;
	  }

    function SelectAllAno_Escolar(){
      $sql= "SELECT `codigo`, `nombre` from ano_escolar";
      return $this->ejecutar($sql);
    }
    function SelectAllAno_Seccion(){
      $sql= "SELECT * from ano_seccion";
      return $this->ejecutar($sql);
    }
    function SelectAllAula(){
      $sql= "SELECT * from aula WHERE `disponibilidad`=1";
      return $this->ejecutar($sql);
    }
    function SelectAllAsignatura(){
      $sql= "SELECT * from asignatura";
      return $this->ejecutar($sql);
    }
    function SelectAllHorario(){
      $sql= "SELECT DISTINCT  ano_escolar.nombre, ano_seccion.ano, ano_seccion.seccion, horario_estudiante.codigo_a_escolar, horario_estudiante.codigo_a_y_seccion, intervalo.intervalo, horario_estudiante.receso
      FROM horario_estudiante
      JOIN ano_escolar ON horario_estudiante.codigo_a_escolar = ano_escolar.codigo
      JOIN ano_seccion ON horario_estudiante.codigo_a_y_seccion = ano_seccion.codigo
      JOIN intervalo ON horario_estudiante.intervalo = intervalo.id";
      return $this->ejecutar($sql);
    }
    function SelectAllProfesores(){
      $sql= "SELECT personas.cedula, personas.nombres, personas.apellidos FROM personas WHERE EXISTS ( SELECT * FROM profesores_materias WHERE personas.cedula = profesores_materias.profesor)";
      return $this->ejecutar($sql);
    }
    function SelectAllIntervalo(){
      $sql= "SELECT intervalo, id from intervalo WHERE `estado`=1";
      return $this->ejecutar($sql);
    }
    function Registrar_Horario(){
        $sql= "INSERT INTO  horario_estudiante(codigo_a_escolar, codigo_a_y_seccion, codigo_asignatura, codigo_aula, codigo_dia, grupo, profesor, intervalo,receso) values('$this->ano_escolar','$this->ano_seccion', $this->asginatura, $this->aula, '$this->bloque', '$this->grupo', $this->profesor,'$this->id', '$this->receso')";
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
    function VerificarHorarioAula($ano,$seccion,$bloque){
        $sql= "SELECT `codigo_aula` FROM `horario_estudiante` WHERE `codigo_a_escolar`='$ano' AND `codigo_a_y_seccion`='$seccion' AND `codigo_dia`='$bloque'" ;
        return $this->ListAll($this->ejecutar($sql), MYSQLI_NUM);
    }
    function VerificarAno($ano)  {
      $sql= "SELECT DISTINCT `codigo_a_y_seccion` FROM `horario_estudiante` WHERE `codigo_a_escolar`='$ano'";
    return $this->ListAll($this->ejecutar($sql), MYSQLI_NUM); 
    }

    function VerificarHorarioProfesor($ano,$seccion,$asignatura,$bloque){
      $sql= "SELECT `profesor` FROM `horario_estudiante` WHERE
      `codigo_a_escolar`='$ano' AND
      `codigo_a_y_seccion`='$seccion' AND
      `codigo_asignatura`='$asignatura' AND
      `codigo_dia`='$bloque'";
      return $this->ListAll($this->ejecutar($sql), MYSQLI_NUM);
    }

    function ClearHorario($ano_escolar, $ano_seccion) {
      $sql="DELETE FROM `horario_estudiante`
      WHERE codigo_a_escolar = '$ano_escolar' AND codigo_a_y_seccion = '$ano_seccion';";
      return $this->ejecutar($sql);
    }
    function BloquesHorario($ano_escolar, $seccion) {
      $sql = "SELECT aula.codigo, aula.nombre, asignatura.codigo, asignatura.nombre, 
                     horario_estudiante.codigo_dia, horario_estudiante.grupo, 
                     personas.cedula, personas.nombres, personas.apellidos,
                     horario_estudiante.receso 
              FROM horario_estudiante
              LEFT JOIN asignatura ON horario_estudiante.codigo_asignatura = asignatura.codigo
              LEFT JOIN aula ON horario_estudiante.codigo_aula = aula.codigo 
              LEFT JOIN personas ON horario_estudiante.profesor = personas.cedula
              WHERE horario_estudiante.codigo_a_escolar = '$ano_escolar' 
              AND horario_estudiante.codigo_a_y_seccion = '$seccion'";
      
      return $this->ListAll($this->ejecutar($sql), MYSQLI_NUM);
    }
    function BloquesHorarioPDF($ano_escolar, $seccion, $bloque) {
      $sql="SELECT aula.codigo, aula.nombre, asignatura.codigo,  asignatura.nombre, horario_estudiante.codigo_dia, horario_estudiante.grupo, personas.cedula, personas.nombres, personas.apellidos,  horario_estudiante.receso 
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