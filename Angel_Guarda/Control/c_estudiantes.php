<?php

require_once(__DIR__ . "/../Modelo/m_estudiantes.php");



$estudiante = new estudiante();

// Obtener los años escolares
$anosEscolares = $estudiante->obtenerAnoEscolar();
if (isset($_POST['datosRepresentantes']) && isset($_POST['datosEstudiantes'])) {
    // Obtener los datos enviados
    $datosRepresentantes = $_POST['datosRepresentantes'];
    $datosEstudiantes = $_POST['datosEstudiantes'];

    // Usar var_dump para verificar los datos recibidos
    var_dump($datosRepresentantes);
    var_dump($datosEstudiantes);

 
    // Enviar una respuesta JSON al cliente
    echo json_encode([
        'status' => 'success',
        'message' => 'Datos recibidos correctamente'
    ]);
}

?>
