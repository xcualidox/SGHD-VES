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



    public function insertEstudiante($cedulaEstudiante, $nombres, $apellidos, $anoSeccion, $anoEscolar)
    {
        // Primero, verificar si el estudiante ya está registrado
        $sql = "SELECT * FROM estudiante WHERE cedula_estudiante = ?";
        $result = $this->query($sql, [$cedulaEstudiante]);

        if (!$result) {
            // Si no está registrado, inserta el nuevo estudiante
            $sqlInsert = "INSERT INTO estudiante (cedula_estudiante, nombres, apellidos, ano, seccion) VALUES (?, ?, ?, ?, ?)";
            $this->query($sqlInsert, [$cedulaEstudiante, $nombres, $apellidos, $anoEscolar, $anoSeccion]);
        }
    }

    public function insertRepresentante($cedulaRepresentante, $nombres, $apellidos, $correo, $direccion, $telefono, $telefonoDomicilio)
    {
        // Verificar si el representante ya está registrado
        $sql = "SELECT * FROM representante WHERE cedula_representante = ?";
        $result = $this->query($sql, [$cedulaRepresentante]);

        if (!$result) {
            // Si no está registrado, inserta el nuevo representante
            $sqlInsert = "INSERT INTO representante (cedula_representante, nombres, apellidos, correo, direccion, telefono, telefono_2) VALUES (?, ?, ?, ?, ?, ?, ?)";
            $this->query($sqlInsert, [$cedulaRepresentante, $nombres, $apellidos, $correo, $direccion, $telefono, $telefonoDomicilio]);
        }
    }
    public function insertarRelacionRepresentanteEstudiante($cedulaEstudiante, $cedulaRepresentante)
    {
        // Verificar si la relación ya existe
        $sql = "SELECT * FROM `representante-representado` WHERE cedula_estudiante = ? AND cedula_representante = ?";
        $result = $this->query($sql, [$cedulaEstudiante, $cedulaRepresentante]);

        if (!$result) {
            // Si no existe, insertar la relación
            $sqlInsert = "INSERT INTO `representante-representado` (cedula_estudiante, cedula_representante) VALUES (?, ?)";
            $this->query($sqlInsert, [$cedulaEstudiante, $cedulaRepresentante]);
        }
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

    public function obtenerRepresentanteRepresentado() {
        // Consulta SQL
        $query = "SELECT 
                e.cedula_estudiante AS cedula_estudiante,
                e.nombres AS nombres_estudiante,
                e.apellidos AS apellidos_estudiante,
                e.ano,
                e.seccion,
                r.cedula_representante AS cedula_representante,
                r.nombres AS nombres_representante,
                r.apellidos AS apellidos_representante,
                r.correo,
                r.direccion,
                r.telefono
            FROM `representante-representado` rr 
            JOIN estudiante e ON rr.cedula_estudiante = e.cedula_estudiante 
            JOIN representante r ON rr.cedula_representante = r.cedula_representante
            ORDER BY e.cedula_estudiante DESC";
        
        // Ejecutar la consulta
        $result = $this->query($query, []);
    
        // Verificar si se encontraron resultados
        if ($result) {
            // Devolver todos los registros encontrados
            return $this->fetch_all_query($result);
        }
    
        return []; // Devuelve un array vacío si no se encontraron resultados
    }
}
