<?php

require_once(__DIR__ . "/../Modelo/m_estudiantes.php");


//Llamo el Modelo Estudiante
$estudiante = new estudiante();

// Obtener los años escolares
$anosEscolares = $estudiante->obtenerAnoEscolar();
$anoSeccion= $estudiante->obtenerAnoSeccion();



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

    // Enviar una respuesta JSON al cliente
    echo json_encode([
        'status' => 'success',
        'message' => 'Datos insertados correctamente'
    ]);
    
}
//LISTADOD de ESTUDIANTES Y REPRESENTANTES
$datos = $estudiante->obtenerRepresentanteRepresentado();

