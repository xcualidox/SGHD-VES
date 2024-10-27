<?php 
require_once(__DIR__ . "/../Modelo/m_mensualidad.php");

if ($_SERVER['REQUEST_METHOD'] === 'POST') {


    if (isset($_POST['anoescolar'])){

        $objeto = new mensualidad;

        $anoescolar=$_POST['anoescolar'];
        $mensualidadObtenida = $objeto->obtenerMensualidad($anoescolar);
        $mensualidadAplanada = array_values($mensualidadObtenida);
        
        $response = [
            'success' => true,
            'message' => 'Gei el que lo lea XD',
            'mensualidad' =>  $mensualidadAplanada
        ];

        echo json_encode($response);
        exit();

    }

    if (isset($_POST['mensualidades'])){

        $mensualidades = json_decode($_POST['mensualidades'], true);


        $response = [
            'success' => true,
            'message' => 'Gei el que lo lea XD',
            'mensualidad' =>  $mensualidadAplanada
        ];



        echo json_encode($response);
        exit();

    }

}


?>