<?php 



if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Asegúrate de que los datos están siendo decodificados correctamente
    $mensualidades = json_decode($_POST['mensualidades'], true);
    
    $response = [
        'success' => true,
        'message' => 'Datos recibidos correctamente',
        'mensualidad' =>  $mensualidades
    ];

    // Asegúrate de devolver la respuesta como JSON
    echo json_encode($response);

}


?>