<?php

require_once(__DIR__ . "/../Modelo/m_estudiantes.php");

$estudiante = new estudiante();

// Obtener los años escolares
$anosEscolares = $estudiante->obtenerAnoEscolar();
$anoSeccion = $estudiante->obtenerAnoSeccion();

$resultados = [];  // Inicializar una variable vacía para los resultados

if (isset($_GET['campo']) && isset($_GET['buscar'])) {
    $campo = $_GET['campo'];
    $buscar = $_GET['buscar'];

    // Dividir el término de búsqueda en palabras
    $palabras = explode(' ', trim($buscar));

    $resultados = []; // Inicializa el arreglo de resultados

    switch ($campo) {
        case 'cedula_estudiante':
            $resultados = $estudiante->consultarEstudianteRepresentante($buscar, null, null, null);
            break;
        case 'nombre_estudiante':
            foreach ($palabras as $palabra) {
                $resultadosPalabra = $estudiante->consultarEstudianteRepresentante(null, null, $palabra, null);
                $resultados = array_merge($resultados, $resultadosPalabra);
            }
            break;
        case 'cedula_representante':
            $resultados = $estudiante->consultarEstudianteRepresentante(null, $buscar, null, null);
            break;
        case 'nombre_representante':
            foreach ($palabras as $palabra) {
                $resultadosPalabra = $estudiante->consultarEstudianteRepresentante(null, null, null, $palabra);
                $resultados = array_merge($resultados, $resultadosPalabra);
            }
            break;
        default:
            $resultados = []; // Si no se selecciona ningún campo válido
            break;
    }

    // Filtrar resultados duplicados basados en un campo único, como 'cedula_estudiante'
    $resultados = array_unique(array_map('serialize', $resultados)); // Serialize para hacer único
    $resultados = array_map('unserialize', $resultados);
} else {
    // Si no se está realizando una búsqueda, traer todos los datos
    $resultados = $estudiante->obtenerRepresentanteRepresentado();
    //Le hago Reverse para traermelo de manera de Ultimo que se muestre de Primero
    $resultados = array_reverse($resultados);
}

if (isset($_POST['datosRepresentantes']) && isset($_POST['datosEstudiantes'])) {
    $datosRepresentantes = $_POST['datosRepresentantes'];
    $datosEstudiantes = $_POST['datosEstudiantes'];

    // Insertar los datos del estudiante
    $estudiante->insertEstudiante(
        $datosEstudiantes['cedulaEstudiante'],
        $datosEstudiantes['nombres'],
        $datosEstudiantes['apellidos'],
        $datosEstudiantes['anoSeccion'],
        $datosEstudiantes['anoEscolar']
    );

    // Insertar los datos del representante
    $estudiante->insertRepresentante(
        $datosRepresentantes['cedulaRepresentante'],
        $datosRepresentantes['nombresRepresentante'],
        $datosRepresentantes['apellidosRepresentante'],
        $datosRepresentantes['correo'],
        $datosRepresentantes['direccion'],
        $datosRepresentantes['telefono'],
        $datosRepresentantes['telefonoDomicilio']
    );

    // Insertar la relación entre representante y estudiante
    $estudiante->insertarRelacionRepresentanteEstudiante(
        $datosEstudiantes['cedulaEstudiante'],
        $datosRepresentantes['cedulaRepresentante']
    );

    // Actualizar la relación entre el estudiante y el nuevo representante
    $estudiante->actualizarRepresentanteEstudiante(
        $datosEstudiantes['cedulaEstudiante'],
        $datosRepresentantes['cedulaRepresentante']
    );

    // Enviar una respuesta JSON al cliente
    echo json_encode([
        'status' => 'success',
        'message' => 'Datos insertados correctamente'
    ]);
}
