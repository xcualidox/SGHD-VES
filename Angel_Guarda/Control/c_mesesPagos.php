<?php

require_once(__DIR__ . "/../Modelo/m_mesesPagos.php");

$objMesesPagos = new mesesPagos();

$resultados_por_pagina = 10;
if(isset($_POST['pagina'])){
    $pagina = $_POST['pagina'];
}
else{
    $pagina = 1;
}

$offset = ($pagina-1)*$resultados_por_pagina;

if (isset($_POST['obtenerColumnasMesesPagos'])){

    $columnasMesesPagosCrudo=$objMesesPagos->obtenerColumnasMesesPagos(); //Listado original
    $columnasMesesPagosCrudo2=array_column($columnasMesesPagosCrudo, 'COLUMN_NAME'); //Solo valores del diccionario
    $columnasMesesPagos=$columnasMesesPagosCrudo2;
    
    if ($columnasMesesPagosCrudo) {
        echo json_encode([
            'status' => 'success',
            'message' => 'Fino señores',
            'resultados' => $columnasMesesPagos
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

if (isset($_POST['obtenerMesesPagos'])) {

    $parametrosCrudos=$_POST['parametrosBusqueda'];
    $parametros=json_decode($parametrosCrudos, true);
    //$listaPagos=true;
    $listaMesesPagos=$objMesesPagos->obtenerMesesPagos($parametros,$resultados_por_pagina,$offset);

    if (is_array($listaMesesPagos)) {
        echo json_encode([
            'success' => true,
            'message' => 'Fino señores',
            'resultados' => $listaMesesPagos
            ]);
        
    }
    else{
        echo json_encode([
            'success' => false,
            'message' => 'Error',
            'resultados' => $listaMesesPagos
        ]);

    }
    
    exit();
}
?>