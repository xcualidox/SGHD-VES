<?php

require_once(__DIR__ . "/../Modelo/m_pagos.php");
require_once(__DIR__.'/../Modelo/m_mesesPagos.php');
require_once(__DIR__ . "/../Modelo/m_escolar.php");
require_once(__DIR__.'/../Modelo/m_mensualidad.php');

$objMensualidad = new mensualidad();
$pagos = new pagos();
$objMesesPagos = new mesesPagos();
$objetoAno = new escolar();

$resultados_por_pagina = 10;
if(isset($_POST['pagina'])){
    $pagina = $_POST['pagina'];
}
else{
    $pagina = 1;
}

$offset = ($pagina-1)*$resultados_por_pagina;

if(isset($_POST['obtenerDeudaMes'])){
    $idMes=$_POST['idMesPago'];
    $cedulaEstudiante=$_POST['cedula'];
    $ano_escolarID=$_POST['ano_escolar'];
    $ano_escolar = $objetoAno->buscarAno($ano_escolarID)['nombre'];
    $montoPrePagadoIndividualCrudo=$pagos->obtenerMontoPrePagadoTotal([$cedulaEstudiante,[$idMes],$ano_escolar]);
    $mesPagoEspecifico=$objMensualidad->obtenerMensualidadPorId($idMes);
    $mesPagoMonto=$mesPagoEspecifico['monto'];
    if($montoPrePagadoIndividualCrudo['suma']){
        $montoPrePagadoIndividual=$montoPrePagadoIndividualCrudo['suma'];
    }
    else{
        $montoPrePagadoIndividual=0;
    }
    $deudaMesIndividual=bcsub($mesPagoMonto,$montoPrePagadoIndividual,2);
    if(true){;
    //if (is_array($deudaMes)) {
        echo json_encode([
            'success' => true,
            'message' => 'Exito broder',
            'resultados' => $deudaMesIndividual
        ]);        
    }
    else{
        echo json_encode([
            'success' => false,
            'message' => 'Error',
            'resultados' => [$mesPagoMonto,$montoPrePagadoIndividual]
        ]);
    }
}

//registrarPago
if(isset($_POST['registrarPago'])){
    // Establecer la cabecera para que el navegador interprete el contenido como JSON


    // Captura los datos JSON enviados en la solicitud
    $data = json_decode($_POST['datos'], true);

    //Obtener datos restantes
    require_once(__DIR__.'/../Modelo/m_estudiantes.php');
    $objetoEstudiante = new estudiante();
    $estudiante=$objetoEstudiante->verificarEstudiante($data['cedula']);
    $relacion=$objetoEstudiante->verificarRelacionEstudiante($data['cedula']);

    //Setear datos a enviar
    $exitos = 0;
    
    //VERIFICAR QUE EL MONTO TOTAL NO EXCEDA LA DEUDA AQUI

    $mensualidad = $objMensualidad->obtenerMensualidad($data['ano_escolar']);
    $ano_escolar = $objetoAno->buscarAno($data['ano_escolar'])['nombre'];
    $parametrosMontoPrePagadoTotal=[$data['cedula'], array_column($data['meses'],'id'),$ano_escolar];
    $montoPrePagadoTotal = $pagos->obtenerMontoPrePagadoTotal($parametrosMontoPrePagadoTotal);

    $precioMensualidades=0;
    foreach ($mensualidad as $mesMensualidad) {
        $precioMensualidades = bcadd($precioMensualidades, $mesMensualidad['monto'],2);
    }

    if($montoPrePagadoTotal['suma']){
        $deuda=bcsub($precioMensualidades,$montoPrePagadoTotal['suma'],2);
    }
    else{
        $deuda=$precioMensualidades;
    }
    
    //if(!true){
    if($deuda>=$data['valor_pago_enviar']){
        $montoPagar=$data['valor_pago_enviar'];
        $montoPagarDebug=[];
        for ($i=0; $i < count($data['meses']); $i++) { 
            $montoXD[]=$montoPagar;
            $aEnviar=[];
            $aEnviar[]=$data['cedula'];
            $aEnviar[]=$relacion['cedula_representante'];
            $aEnviar[]=date('d-m-Y');
            $aEnviar[]=$data['numero_referencia'];
            $aEnviar[]=$ano_escolar;
            $aEnviar[]=$data['meses'][$i]['id'];
            $aEnviar[]=$data['nota_pago'];
            $aEnviar[]=$data['descuento'];
            $aEnviar[]=$estudiante['nombres'].' '.$estudiante['apellidos'];

            $representante = $objetoEstudiante->verificarRepresentante($relacion['cedula_representante']);
            $aEnviar[]=$representante['nombres'].' '.$representante['apellidos'];
            $aEnviar[]=$representante['telefono'];
            $aEnviar[]=$representante['direccion'];

            $mesId=$data['meses'][$i]['id'];
            $montoMesQuery=$objMensualidad->obtenerMensualidadPorId($mesId);
            $montoMes=$montoMesQuery['monto'];


            $mesPrePagado=$pagos->obtenerMontoPrePagadoTotal([$data['cedula'],[$data['meses'][$i]['id']],$ano_escolar])['suma'];
            //$deudaMes=-1;
            if (!$mesPrePagado) {
                $mesPrePagado=0;
            }
            $deudaMes=bcsub($montoMes,$mesPrePagado,2);
            $montoPagarDebug[]=$montoPagar;
            if($montoPagar >= $deudaMes){
                $montoEnviar = $deudaMes;
            }
            else{
                $montoEnviar = $montoPagar;
            }

            $montoEnviarDebug[]=$deudaMes.$montoEnviar;
            $aEnviar[]=$montoEnviar;
            $aEnviar[]=$data['forma_pago'];
            $aEnviar[]=$data['dolarBCV'];
            if ($montoEnviar>0 and $montoEnviar<=$deudaMes){
                $pago=$pagos->insertarPagos($aEnviar);

            }
            //$pago=false;
            if(isset($pago) and $pago){

                if($montoPagar >= $deudaMes){
                    $montoPagar = bcsub($montoPagar, $montoEnviar,2);
                    
                }
                else{
                    $montoPagar= bcsub($montoPagar, $montoPagar,2);
                }
                //meses_pagos
                $parametrosVerificar=[
                    'cedula_estudiante' => $data['cedula'],
                    'mes' => $data['meses'][$i]['id'],
                    'ano_escolar' => $data['ano_escolar']

                ];
                $verificarMesesPagos = $objMesesPagos->verificarMesPago($parametrosVerificar);
                $parametrosVerificarProcesados=array_values($parametrosVerificar);

                if(count($verificarMesesPagos)>0){
                    $mesVerificado=$verificarMesesPagos[0]; //obtenerMesesPagos utiliza fetch_all_query lo cual returnea array multidimensional
                    $montoAbonadoOriginal=$mesVerificado['abonado'];
                    $montoNuevo=[bcadd($montoAbonadoOriginal,$montoEnviar,2)];
                    $parametrosActualizar=array_merge($montoNuevo,$parametrosVerificarProcesados); //mezcla las array para enviar al query
                    $operacionMes=$objMesesPagos->actualizarAbonado($parametrosActualizar);

                }
                else{
                    $montoMaximo=$objMensualidad->obtenerMensualidadPorId($data['meses'][$i]['id']);
                    $ano_seccionQuery=$objetoAno->buscarIdAno($estudiante['seccion']);
                    $idSeccion=$ano_seccionQuery['codigo'];
                    $parametrosInsertar=[
                        $idSeccion, //Ano_seccion aqui
                        $montoEnviar
                    ];
                    $operacionMes=$objMesesPagos->insertarMesesPagos(array_merge($parametrosVerificarProcesados,$parametrosInsertar));
                }

                //Bitacora
                require_once(__DIR__.'/c_bitacora.php');
                $id=$pagos->lastId();
                insertBitacora($_SESSION['username'], "insertar", ' Registró el pago ID: '. $id .' del estudiante "'.$estudiante['nombres'].' '.$estudiante['apellidos'].'"');
                $exitos++;
            }
            else{
                $nada;
            }

        }

        $intentos = count($data['meses']);


        $response = [
            'success' => $exitos." exitos de ".$intentos." intentos.",
            'montoEnviarDebug' => [$montoEnviarDebug],
            'deuda' => $descuento['response']['descuento']
        ];

        // Responder con los datos procesados
        echo json_encode($response);
        exit();
    }
    else{
        $response = [
            'success' => 'error',
            'message' => 'Valor a Pagar mayor a deuda',
            'deuda' => $descuento['response']['descuento']
        ];

        // Responder con los datos procesados
        echo json_encode($response);
        exit();
    }
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
    $cantidadResultado=$pagos->cantidadResultados($parametros);
    
    

    if (is_array($listaPagos)) {
        echo json_encode([
            'success' => true,
            'message' => 'Fino señores',
            'resultados' => $listaPagos,
            'maxPag'=> ceil($cantidadResultado['COUNT(*)']/$resultados_por_pagina),
            'pagina'=> $pagina
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