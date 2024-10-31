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
        $aEliminar=$objeto->obtenerMensualidadPorId($id_borrar);
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

            require_once("c_bitacora.php");
            insertBitacora($_SESSION['username'], "eliminar", ' Eliminó la mensualidad de '. ucFirst($aEliminar['mes']) .' del Año Escolar "'.$aEliminar['ano_escolar'].'"');
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
        $idesxd = [];
        for ($i=0; $i < count($mensualidades); $i++) { 
            $datos=$mensualidades[$i];

            $ano=$_POST['ano_escolar'];
            $mes=$datos['mes'];
            $monto=$datos['monto'];
            $id_mensualidad=$datos['id'];

            if ($id_mensualidad!=''){
                $aUsar=$objeto->obtenerMensualidadPorId($id_mensualidad);
            }
            else{
                $aUsar['mes']=$mes;
                $aUsar['ano_escolar']=$ano;
            }

            //Para el Toast
            $ya_registrado=$objeto->verificarMensualidad($ano,$mes,$monto,$id_mensualidad);

            //If para evitar conteo innecesario cuando ya esta registrado, para exitos e intentos en la vista
            if(count($ya_registrado) == 0){

                
                if (empty($id_mensualidad)) {

                    $resultado=$objeto->insertarMensualidad($ano,$mes,$monto);
                    array_push($resultados,$resultado);   

                    if($resultado){
                        require_once("c_bitacora.php");
                        //$anoescolar_bitacora=$objeto->agarrarAnoPorId($aUsar['ano_escolar']);
                        $anoescolar_bitacora=['nombre'=>'Lmao'];
                        $anoescolar_bitacora=$anoescolar_bitacora['nombre'];
                        insertBitacora($_SESSION['username'], "insertar", ' Insertó la mensualidad de '. ucFirst($aUsar['mes']) .' del Año Escolar "'.$anoescolar_bitacora.'"');
                    }


                }
                else{
                    //Obtener el ID original para la bitácora
                    $fila_original=$objeto->verificarMensualidad(id: $id_mensualidad);
                    
                    $mes_original=$fila_original[0]['mes'];
                    $ano_original=$fila_original[0]['nombre'];
                    $monto_original=$fila_original[0]['monto'];

                    $resultado=$objeto->actualizarMensualidad($ano,$mes,$monto,$id_mensualidad);
                    array_push($resultados,$resultado);

                    if($resultado){
                        require_once("c_bitacora.php");
                        $anoescolar_bitacora_query=$objeto->agarrarAnoPorId($ano);
                        //$anoescolar_bitacora=['nombre'=>'Lmao'];
                        $anoescolar_bitacora=$anoescolar_bitacora_query['nombre'];
                        

                        insertBitacora($_SESSION['username'], "modificar", ' Modificó la mensualidad de '. ucFirst($mes_original) .' del A.Escolar "'.$ano_original.'" ('.$monto_original.'$) por '. ucFirst($mes). ' del A.Escolar "'.$anoescolar_bitacora.'" ('.$monto.'$)');
                    }

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