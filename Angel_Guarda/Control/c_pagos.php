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
    
    //VERIFICAR QUE EL MONTO TOTAL NO EXCEDA LA DEUDA AQUI
    require_once(__DIR__.'/../Modelo/m_mensualidad.php');
    require_once(__DIR__.'/../Modelo/m_mesesPagos.php');
    $objMensualidad = new mensualidad();
    $objMesesPagos = new mesesPagos();

    $mensualidad = $objMensualidad->obtenerMensualidad($data['ano_escolar']);
    $ano_escolar = $objetoAno->buscarAno($data['ano_escolar'])['nombre'];
    $parametrosMontoPrePagadoTotal=[$data['cedula'], array_column($data['meses'],'id'),$ano_escolar];
    $montoPrePagadoTotal = $pagos->obtenerMontoPrePagadoTotal($parametrosMontoPrePagadoTotal);

    $precioMensualidades=0;
    foreach ($mensualidad as $mesMensualidad) {
        $precioMensualidades += floatval($mesMensualidad['monto']);
    }

    if($montoPrePagadoTotal['suma']){
        $deuda=$precioMensualidades-$montoPrePagadoTotal['suma'];
    }
    else{
        $deuda=$precioMensualidades;
    }
    
    //if(!true){
    if($deuda>=$data['valor_pago_enviar']){
        $montoPagar=$data['valor_pago_enviar'];
        $vueltas=0;
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

            $montoMes=$data['meses'][$i]['precio'];
            $montoPagar=$data['valor_pago_enviar'];


            if($montoPagar >= $montoMes){
                $montoEnviar = floatval($montoMes);
            }
            else{
                $montoEnviar = floatval($montoPagar);
            }

            $aEnviar[]=$montoEnviar;
            $aEnviar[]=$data['forma_pago'];
            $aEnviar[]=$data['dolarBCV'];
            //$deudaMes=-1;
            $mesPrePagado=$pagos->obtenerMontoPrePagadoTotal([$data['cedula'],[$data['meses'][$i]['id']],$ano_escolar])['suma'];
            $deudaMes=$montoMes-$mesPrePagado;
            if ($montoPagar>0 and $montoPagar<=$deudaMes){
                $pago=$pagos->insertarPagos($aEnviar);

            }
            //$pago=false;
            if(isset($pago) and $pago){

                if($montoPagar >= $montoMes){
                    $montoPagar -= floatval($montoMes);
                }
                else{
                    $montoPagar -= $montoPagar;
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
                    $montoAbonadoOriginal=floatval($mesVerificado['abonado']);
                    $montoNuevo=[$montoAbonadoOriginal+$montoEnviar];
                    $parametrosActualizar=array_merge($montoNuevo,$parametrosVerificarProcesados); //mezcla las array para enviar al query
                    $operacionMes=$objMesesPagos->actualizarAbonado($parametrosActualizar);

                }
                else{
                    $vueltas=$verificarMesesPagos;
                    $montoMaximo=$objMensualidad->obtenerMensualidadPorId($data['meses'][$i]['id']);
                    $idSeccion=18;
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
            'test' => $deudaMes
        ];

        // Responder con los datos procesados
        echo json_encode($response);
        exit();
    }
    else{
        $response = [
            'success' => 'error',
            'message' => 'Valor a Pagar mayor a deuda',
            'response' => $deudaMes
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