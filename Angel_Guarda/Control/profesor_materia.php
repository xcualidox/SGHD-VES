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
    
            // Ahora eliminamos las entradas antiguas asociadas a 'cedula_original'
            $operacion->Eliminar($cedula_original);

        }
    }

    else {
        // Si 'profesor' y 'origin' son iguales, eliminamos las entradas
        $operacion->Eliminar($cedula);
    }

    // Si hay materias que agregar y el profesor existe
    if ($_POST["add"] != "") {
        $array = explode(",", $_POST["add"]);

        //Solo alterar materias si el profesor existe
        if (count($verificacion2) > 0){
            for ($i = 1; $i < count($array); $i++) { 
                $operacion->registrar($cedula, $array[$i]);
            }

        }

    }

    //Establece la variable de url a enviar en caso de exito
    $estado = 'exito';
    header($url.'?estado='.$estado);
    exit(); // Es recomendable usar exit después de header para evitar que el script continúe ejecutándose
}
?>
