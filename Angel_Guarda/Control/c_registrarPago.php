<?php
// Establecer la cabecera para que el navegador interprete el contenido como JSON


// Captura los datos JSON enviados en la solicitud
$data = json_decode(file_get_contents('php://input'), true);


$response = [
    'success' => true,
    'data' => $data // Esto devuelve todos los datos recibidos
];

// Responder con los datos procesados
echo json_encode($response);
?>