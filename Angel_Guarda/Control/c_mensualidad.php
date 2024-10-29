<?php 
require_once(__DIR__ . "/../Modelo/m_mensualidad.php");

if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    //Recargar Tabla
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
    //Obtener Años escolares
    if (isset($_POST['agarrar_anos'])){

        $objeto = new mensualidad;

        $anos_escolar = $objeto->obtenerAnoEscolar();
        if ($anos_escolar) {

            $response = [
            'success' => true,
            'message' => 'Aqui tan tus anos broder',
            'anos_escolares' =>  $anos_escolar
            ];

            echo json_encode($response);
            exit();
        }
        else{

            $response = [
            'success' => false,
            'message' => 'No tenemos anos para ti :('
            ];

        }

        echo json_encode($response);
        exit();

    }

    //Eliminar
    if (isset($_POST['id_mensualidad'])){

        $objeto = new mensualidad;

        $id_borrar=$_POST['id_mensualidad'];
        $resultado=$objeto->eliminarMensualidad($id_borrar);            

        if (!$resultado){
            $response = [
                'success' => false,
                'message' => 'No se pudo mano.'
            ];
        }
        else{
            $response = [
                'success' => true,
                'message' => 'Eliminado correctamente.'
            ];
        }
        echo json_encode($response);
        exit();
    }

    //Insertar y Modificar
    if (isset($_POST['mensualidades'])){

        $objeto = new mensualidad;

        $mensualidades = json_decode($_POST['mensualidades'], true);

        //resultados para toast
        $resultados = [];

        for ($i=0; $i < count($mensualidades); $i++) { 
            
            $datos=$mensualidades[$i];

            $ano=$_POST['ano_escolar'];
            $mes=$datos['mes'];
            $monto=$datos['monto'];
            $id_mensualidad=$datos['id'];

            $ya_registrado=$objeto->verificarMensualidad($ano,$mes,$monto,$id_mensualidad);

            if(count($ya_registrado) == 0){

                //Insertar
                if (empty($datos['id'])){
    
                    $resultado=$objeto->insertarMensualidad($ano,$mes,$monto);
                    array_push($resultados,$resultado);
    
                }
    
                //Modificar
                else{
    
                    $resultado=$objeto->actualizarMensualidad($ano,$mes,$monto,$id_mensualidad);
                    array_push($resultados,$resultado);
    
                }
            }
        }
     
        $response = [
            'success' => $resultados,
            'message' => 'Que sea lo que dios quiera mano'
        ];



        echo json_encode($response);
        exit();

    }

}


?>