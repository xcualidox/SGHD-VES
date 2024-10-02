<?php
require_once("basedatos.php");

class estudiante extends database_connect
{
    private $cedula_estudiante;
    private $nombres;
    private $apellidos;
    private $ano;
    private $seccion;


    // Método para asignar los valores del dólar
    public function setDatos(
        $cedula_estudiante,
        $nombres,
        $apellidos,
        $ano,
        $seccion
    ) {
        $this->cedula_estudiante = $cedula_estudiante;
        $this->nombres = $nombres;
        $this->apellidos = $apellidos;
        $this->ano = $ano;
        $this->seccion = $seccion;
    }

    // Método para modificar el precio del dólar

    public function insertEstudiante()
    {

        $sql = "INSERT INTO estudiante (cedula_estudiante, nombres, apellidos, ano, seccion)
        VALUES (5555656, 'angel', 'mendez', '2025-2026', 'XD');";
    }
    public function representante()
    {

        $sql = "INSERT INTO representante (cedula_representante, nombres, apellidos, correo, direccion, telefono, telefono_2)
        VALUES (123456789, 'Juan', 'Pérez', 'juan@example.com', 'Calle Falsa 123', '5551234', '5555678');"
        ;
        
    }


    // Método para obtener el precio actual del dólar

    public function obtenerAnoSeccion()
    {
        $sql = "SELECT CONCAT(`ano`, ' ', `seccion`) as ano_seccion FROM ano_seccion ORDER BY `ano` ASC;";
        $result = $this->query($sql, []);  // Ejecuta la consulta

        $anoAnoSeccion = [];
        if ($result) {
            // Iterar sobre los resultados y agregarlos a un array
            while ($row = $this->fetch_query($result)) {
                $anoAnoSeccion[] = $row['ano_seccion'];  // Almacena el valor concatenado
            }
        }
        return $anoAnoSeccion;
    }
    public function obtenerAnoEscolar()
    {
        $sql = "SELECT `nombre` FROM `ano_escolar` ORDER BY `nombre` DESC";
        $result = $this->query($sql, []);  // Ejecuta la consulta

        $anoEscolar = [];
        if ($result) {
            // Iterar sobre los resultados y agregarlos a un array
            while ($row = $this->fetch_query($result)) {
                $anoEscolar[] = $row['nombre'];
            }
        }
        return $anoEscolar;
    }
}
