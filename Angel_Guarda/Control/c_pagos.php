<?php

require_once(__DIR__ . "/../Modelo/m_pagos.php");

$pagos = new pagos();



$resultados_por_pagina = 10;
if(isset($_POST['pagina'])){
    $pagina = $_POST['pagina'];
}
else{
    $pagina = 1;
}

$offset = ($pagina-1)*$resultados_por_pagina;

//registrarPago
if(isset($_POST['registrarPago'])){
    // Establecer la cabecera para que el navegador interprete el contenido como JSON


    // Captura los datos JSON enviados en la solicitud
    $data = json_decode($_POST['datos'], true);


    $response = [
        'success' => true,
        'data' => $data // Esto devuelve todos los datos recibidos
    ];

    // Responder con los datos procesados
    echo json_encode($response);
    exit();
}


if (isset($_POST['obtenerColumnasPagos'])){

    $columnasPagosCrudo=$pagos->obtenerColumnasPagos(); //Listado original
    $columnasPagosCrudo2=array_column($columnasPagosCrudo, 'COLUMN_NAME'); //Solo valores del diccionario
    $columnasPagos=$columnasPagosCrudo2;
    
    if ($columnasPagosCrudo) {
        echo json_encode([
            'status' => 'success',
            'message' => 'Fino señores',
            'resultados' => $columnasPagos
            ]);
        
    }
    else{
        echo json_encode([
            'status' => 'error',
            'message' => 'Error'
        ]);
    }
    
    exit();

}

if (isset($_POST['obtenerPagos'])) {

    $parametrosCrudos=$_POST['parametrosBusqueda'];
    $parametros=json_decode($parametrosCrudos, true);
    //$listaPagos=true;
    $listaPagos=$pagos->obtenerPagos($parametros,$resultados_por_pagina,$offset);

    if (is_array($listaPagos)) {
        echo json_encode([
            'success' => true,
            'message' => 'Fino señores',
            'resultados' => $listaPagos
            ]);
        
    }
    else{
        echo json_encode([
            'success' => false,
            'message' => 'Error',
            'resultados' => $listaPagos
        ]);

    }
    
    exit();

}

?>