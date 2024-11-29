<?php

include_once(__DIR__ . '/../Modelo/m_descuentos.php');
include_once(__DIR__ . '/../Control/c_fechaHora.php');

$objCDescuento = new ControladorDescuento();
$objCDescuento->manejarPedido();


class ControladorDescuento{

    public function manejarPedido(){

        if (isset($_POST['accion'])) {
            $pedido = htmlspecialchars($_POST['accion'], ENT_QUOTES, 'UTF-8');
            switch ($pedido) {
                case 'descuentoActual':
                    $response=$this->buscarDescuentoActual();
                    echo json_encode($response);
                    exit();
                
                default:
                $response = [
                    'success' => false,
                    'message' => 'Pedido invalido en el controlador.'
                    ];
                echo json_encode($response);
                    exit();
            }
        }
        else{
            $response = [
                'success' => false,
                'message' => "Accion invalida enviada a ControladorDescuento"
                ];
        }

    }

    public function buscarDescuentoActual(){
        $objDescuento = new descuentos();
        $objFechaHora = new ControladorFechaHora();
        $fechaOnline=$objFechaHora->obtenerFechaOnline();
        $success=false;
        if(!isset($fechaOnline['error'])){
            $fecha=$fechaOnline;
            $descuento = $objDescuento->obtenerDescuento($fechaOnline);
            $online = true;
        }
        else{
            $fecha = date('Y-m-d');
            $descuento = $objDescuento->obtenerDescuento($fecha);
            $online = false;
        }
        
        if (!empty($descuento)){ $success=true; }
        $response = [
            'success' => $success,
            'response' => ['descuento' => $descuento['descuento'], 'fecha' => $fecha],
            'online' => $online
        ];
        return $response;
    }   
}



?>