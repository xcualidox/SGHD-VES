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



    public function insertEstudiante($cedulaEstudianteActual, $cedulaEstudiante, $nombres, $apellidos, $anoSeccion, $anoEscolar, $cedulaRepresentante)
    {
        // Primero, verificar si el estudiante ya está registrado
        $sql = "SELECT * FROM estudiante WHERE cedula_estudiante = ?";
        $result = $this->query($sql, [$cedulaEstudianteActual]);
    
        if ($result) {
            // Si el estudiante actual existe
            if ($cedulaEstudianteActual !== $cedulaEstudiante) {

                  // Eliminar la relación en 'representante-representado' antes de actualizar
                    $sqlDelete = "DELETE FROM `representante-representado` WHERE cedula_estudiante = ?";
                    $this->query($sqlDelete, [$cedulaEstudianteActual]);
                // Si la cédula nueva es diferente, realizar la actualización de la cédula
                $sqlUpdate = "UPDATE estudiante SET cedula_estudiante = ?, nombres = ?, apellidos = ?, ano = ?, seccion = ? WHERE cedula_estudiante = ?";
                $this->query($sqlUpdate, [$cedulaEstudiante, $nombres, $apellidos, $anoEscolar, $anoSeccion, $cedulaEstudianteActual]);
                $this->insertarOActualizarRelacionRepresentanteEstudiante($cedulaEstudiante, $cedulaRepresentante);


            } else {
                // Si las cédulas son iguales, actualizar solo los datos
                $sqlUpdate = "UPDATE estudiante SET nombres = ?, apellidos = ?, ano = ?, seccion = ? WHERE cedula_estudiante = ?";
                $this->query($sqlUpdate, [$nombres, $apellidos, $anoEscolar, $anoSeccion, $cedulaEstudianteActual]);
            }
        } else {
            // Si no se encuentra el estudiante actual, insertar el nuevo estudiante
            if (!empty($cedulaEstudiante)) { // Verifica que la nueva cédula no esté vacía
                $sqlInsert = "INSERT INTO estudiante (cedula_estudiante, nombres, apellidos, ano, seccion) VALUES (?, ?, ?, ?, ?)";
                $this->query($sqlInsert, [$cedulaEstudiante, $nombres, $apellidos, $anoEscolar, $anoSeccion]);
            } else {
                // Manejo de error: Cédula nueva está vacía
                throw new Exception("La cédula del nuevo estudiante no puede estar vacía.");
            }
        }
    }

    public function insertRepresentante($cedulaRepresentante, $nombres, $apellidos, $correo, $direccion, $telefono, $telefonoDomicilio)
    {
        // Verificar si el representante ya está registrado
        $sql = "SELECT * FROM representante WHERE cedula_representante = ?";
        $result = $this->query($sql, [$cedulaRepresentante]);
    
        if ($result) {
            // Si ya está registrado, realizar la actualización
            $sqlUpdate = "UPDATE representante SET nombres = ?, apellidos = ?, correo = ?, direccion = ?, telefono = ?, telefono_2 = ? WHERE cedula_representante = ?";
            $this->query($sqlUpdate, [$nombres, $apellidos, $correo, $direccion, $telefono, $telefonoDomicilio, $cedulaRepresentante]);
        } else {
            // Si no está registrado, inserta el nuevo representante
            $sqlInsert = "INSERT INTO representante (cedula_representante, nombres, apellidos, correo, direccion, telefono, telefono_2) VALUES (?, ?, ?, ?, ?, ?, ?)";
            $this->query($sqlInsert, [$cedulaRepresentante, $nombres, $apellidos, $correo, $direccion, $telefono, $telefonoDomicilio]);
        }
    }



    public function insertarOActualizarRelacionRepresentanteEstudiante($cedulaEstudiante, $cedulaRepresentante)
    {
        try {
            // Verificar si la relación ya existe
            $sql = "SELECT * FROM `representante-representado` WHERE cedula_estudiante = ?";
            $result = $this->query($sql, [$cedulaEstudiante]);
    
            if ($result) {
                // Si existe, actualiza la relación
                $sqlUpdate = "UPDATE `representante-representado` SET cedula_representante = ? WHERE cedula_estudiante = ?";
                $this->query($sqlUpdate, [$cedulaRepresentante, $cedulaEstudiante]);
                return json_encode(['success' => true, 'message' => 'La relación actualizada correctamente.']);
            } else {
                // Si no existe, inserta la relación
                $sqlInsert = "INSERT INTO `representante-representado` (cedula_estudiante, cedula_representante) VALUES (?, ?)";
                $this->query($sqlInsert, [$cedulaEstudiante, $cedulaRepresentante]);
                return json_encode(['success' => true, 'message' => 'Relación insertada correctamente.']);
            }
        } catch (Exception $e) {
            return json_encode(['success' => false, 'message' => 'Error: ' . $e->getMessage()]);
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
                r.telefono,
                r.telefono_2
            FROM `representante-representado` rr 
            JOIN estudiante e ON rr.cedula_estudiante = e.cedula_estudiante 
            JOIN representante r ON rr.cedula_representante = r.cedula_representante
            ";
        
        // Ejecutar la consulta
        $result = $this->query($query, []);
    
        // Verificar si se encontraron resultados
        if ($result) {
            // Devolver todos los registros encontrados
            return $this->fetch_all_query($result);
        }
    
        return []; // Devuelve un array vacío si no se encontraron resultados
    }
    public function consultarEstudianteRepresentante($cedulaEstudiante = null, $cedulaRepresentante = null, $nombreEstudiante = null, $nombreRepresentante = null) {
        // Inicia la consulta base
        $query = "
            SELECT 
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
                r.telefono,
                r.telefono_2
              
            FROM `representante-representado` rr 
            JOIN estudiante e ON rr.cedula_estudiante = e.cedula_estudiante 
            JOIN representante r ON rr.cedula_representante = r.cedula_representante
            WHERE 1=1";  // Esto garantiza que se pueda agregar condicionales de manera flexible
    
        // Array para almacenar los parámetros de la consulta
        $params = [];
    
        // Agrega condiciones dinámicamente basadas en los parámetros pasados
        if ($cedulaEstudiante) {
            $query .= " AND e.cedula_estudiante = ?";
            $params[] = $cedulaEstudiante;
        }
    
        if ($cedulaRepresentante) {
            $query .= " AND r.cedula_representante = ?";
            $params[] = $cedulaRepresentante;
        }
    
        if ($nombreEstudiante) {
            // Buscar por nombres y apellidos concatenados del estudiante
            $query .= " AND CONCAT(e.nombres, ' ', e.apellidos) LIKE ?";
            $params[] = "%" . $nombreEstudiante . "%";  // Usamos LIKE para buscar coincidencias parciales
        }
    
        if ($nombreRepresentante) {
            // Buscar por nombres y apellidos concatenados del representante
            $query .= " AND CONCAT(r.nombres, ' ', r.apellidos) LIKE ?";
            $params[] = "%" . $nombreRepresentante . "%";
        }
    
        // Ejecutar la consulta con los parámetros
        $result = $this->query($query, $params);
    
        // Verificar si se encontraron resultados
        if ($result) {
            // Devolver todos los registros encontrados
            return $this->fetch_all_query($result);
        }
    
        return []; // Devuelve un array vacío si no se encontraron resultados
    }
}
