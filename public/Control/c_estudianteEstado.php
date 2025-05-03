<?php


require_once(__DIR__ . "/../Modelo/m_estudiantes.php");


$data = json_decode(file_get_contents('php://input'), true);
$cedula = $data['cedula'];

$modeloEstudiante = new Estudiante();
$resultadoEstado = $modeloEstudiante->obtenerEstadoEstudiante($cedula);

// Extraer valor del campo 'activo'
$estadoActual = 0; // valor por defecto
if (!empty($resultadoEstado)) {
    $estadoArray = $modeloEstudiante->fetch_query($resultadoEstado); // usar tu método para extraer resultados
    $estadoActual = isset($estadoArray['activo']) ? (int)$estadoArray['activo'] : 0;
}

$nuevoEstado = $estadoActual == 1 ? 0 : 1;

$resultado = $modeloEstudiante->actualizarEstadoEstudiante($cedula, $nuevoEstado);

if ($resultado) {
    echo json_encode([
        'success' => true,
        'nuevo_estado' => $nuevoEstado
    ]);
} else {
    echo json_encode([
        'success' => false,
        'error' => 'No se pudo actualizar el estado'
    ]);
}