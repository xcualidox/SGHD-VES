<?php 
session_start();
include_once("../Modelo/profesor_materia.php");
$operacion = new zona();

$url="Location: ../Vista/Profesores_Materias/profesor_materia.php";
$estado;

if (isset($_POST["cedula"])) {
    // Si se recibe una cédula, selecciona las materias del profesor
    $dato = $operacion->SeleccionarMaterias($_POST["cedula"]);
    echo json_encode($dato);
} else {
    // Determina si se utiliza el valor de 'profesor' o 'origin'
    if ($_POST["profesor"] != "") {
        $cedula = $_POST["profesor"];
    } else {
        $cedula = $_POST["origin"];
    }

    $cedula_nueva = $_POST["profesor"];
    $cedula_original = $_POST["origin"];

    //Verificar si la cedula del profesor al que se quiere modificar ya exista
    $verificacion1 = $operacion->VerificarProfesorPensum($cedula_nueva);
    
    //Verifica si el profesor al que se va a cambiar existe
    $verificacion2 = $operacion->VerificarProfesorPersona($cedula_nueva);

    // Si 'profesor' y 'origin' son diferentes, realiza la modificación
    if ($cedula_nueva != $cedula_original) {

        //Si se intenta editar y cambiar la cedula a un profesor que ya tenga materias entonces:
        if (count($verificacion1) != 0) {

            //Para debug
            echo 'Profesor mezclado al modificar o ya existe al crear';

            $estado='error';

            
            header($url.'?estado='.$estado);
            exit();

        }

        else{

            $operacion->Modificar($cedula_nueva, $cedula_original);
            require_once("c_bitacora.php");
            insertBitacora($_SESSION['username'], "modificar", 'Movió el PEMSUN del profesor '.$cedula_original.' a '.$cedula_nueva.'.');
    
            // Ahora eliminamos las entradas antiguas asociadas a 'cedula_original'
            //$operacion->Eliminar($cedula_original);

        }
    }

    else {
        // Si 'profesor' y 'origin' son iguales, eliminamos las entradas
        $array = explode(",", $_POST["add"]);
        
        //Lista de materias a conservar, eliminará las materias del mismo profesor que no sean estas
        $a_conservar = '';

        //$i empieza desde 1 porque 0 es un valor vacío, no me preguntes porque Xd
        for ($i=1; $i < count($array); $i++) {
            if($i+1 == count($array)){
                $a_conservar = $a_conservar . '"' . $array[$i] . '"';
            }
            else{
                $a_conservar = $a_conservar . '"' . $array[$i] . '",';
            }
        }

        $operacion->EliminarMaterias($cedula,$a_conservar);
        echo $a_conservar;
    }

    // Si hay materias que agregar y el profesor existe
    if ($_POST["add"] != "") {
        
        $array = explode(",", $_POST["add"]);

        //Solo alterar materias si el profesor existe

        //Obtiene la lista de materias ya agregadas al profesor
        $lol = $operacion->VerificarMateriaPensum($cedula);

        //Aplana la array acorde al indice 'materia' (la array esta en formato raro)
        $materias_profesor = array_column($lol,'materia');

        //debug:

/*         print_r($lol);
        echo '</br>';
        print_r($materias_profesor); */

        if (count($verificacion2) > 0){

            for ($i = 1; $i < count($array); $i++) {
                
                //Siempre registrar a no ser...
                $registrar=true;

                //Si la materia a agregar coincide con una materia ya agregada entonces desactivar el registro para esa materia.
                for ($i2=0; $i2 < count($materias_profesor); $i2++) { 
                    //echo '|$i: '.$array[$i].', $i2: '.$materias_profesor[$i2]."</br>";

                    if($array[$i]==$materias_profesor[$i2]){
                        $registrar=false;
                    }

                }

                if($registrar){
                    
                    $operacion->registrar($cedula, $array[$i]);

                    require_once("c_bitacora.php");
                    insertBitacora($_SESSION['username'], "modificar", 'Cambió el PEMSUN del profesor '.$cedula.'.');
                }


            }

        }

    }

    //Establece la variable de url a enviar en caso de exito
    $estado = 'exito';
    header($url.'?estado='.$estado);
    exit(); // Es recomendable usar exit después de header para evitar que el script continúe ejecutándose
}
?>
