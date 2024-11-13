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

    //Obtener datos restantes
    require_once(__DIR__.'/../Modelo/m_estudiantes.php');
    require_once(__DIR__ . "/../Modelo/m_escolar.php");
    $objetoEstudiante = new estudiante();
    $estudiante=$objetoEstudiante->verificarEstudiante($data['cedula']);
    $relacion=$objetoEstudiante->verificarRelacionEstudiante($data['cedula']);
    $objetoAno = new escolar();

    //Setear datos a enviar
    $exitos = 0;
    for ($i=0; $i < count($data['meses']); $i++) { 

        $aEnviar=[];
        $aEnviar[]=$data['cedula'];
        $aEnviar[]=$relacion['cedula_representante'];
        $aEnviar[]=date('d-m-Y');
        $aEnviar[]=$data['numero_referencia'];
        $ano_escolar = $objetoAno->buscarAno($data['ano_escolar'])['nombre'];
        $aEnviar[]=$ano_escolar;
        $aEnviar[]=$data['meses'][$i]['id'];
        $aEnviar[]=$data['nota_pago'];
        $aEnviar[]=$data['descuento'];
        $aEnviar[]=$estudiante['nombres'].' '.$estudiante['apellidos'];

        $representante = $objetoEstudiante->verificarRepresentante($relacion['cedula_representante']);
        $aEnviar[]=$representante['nombres'].' '.$representante['apellidos'];
        $aEnviar[]=$representante['telefono'];
        $aEnviar[]=$representante['direccion'];

        $aEnviar[]=$data['valor_pago_enviar'];
        $aEnviar[]=$data['forma_pago'];
        $aEnviar[]=$data['dolarBCV'];
        
        $pago=$pagos->insertarPagos($aEnviar);
        //$pago=false;
        if($pago){
            require_once(__DIR__.'/c_bitacora.php');
            $id=$pagos->lastId();
            insertBitacora($_SESSION['username'], "insertar", ' Registró el pago ID: '. $id .' del estudiante "'.$estudiante['nombres'].' '.$estudiante['apellidos'].'"');
            $exitos++;
        }
        

    }

    $intentos = count($data['meses']);


    $response = [
        'success' => $exitos." exitos de ".$intentos." intentos."
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

//Esto es para el PDF de
$obtenerPagosPDF=$pagos->obtenerPagos(['idPago' => 16],1,0);


?>