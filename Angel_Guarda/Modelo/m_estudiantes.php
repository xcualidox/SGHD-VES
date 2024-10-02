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
        $this->nombres = $nombres ;
        $this->apellidos = $apellidos ;
        $this->ano = $ano ;
        $this->seccion = $seccion ;
    }

    // Método para modificar el precio del dólar


    // Método para obtener el precio actual del dólar
    public function obtenerAnoEscolar()
    {
        $sql = "SELECT `nombre` FROM `ano_escolar`";
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
