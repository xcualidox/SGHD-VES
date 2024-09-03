<?php 
session_start();
include_once("../Modelo/profesor_materia.php");
$operacion = new zona();

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

    // Si 'profesor' y 'origin' son diferentes, realiza la modificación
    if ($_POST["profesor"] != $_POST["origin"]) {
        $cedula_nueva = $_POST["profesor"];
        $cedula_original = $_POST["origin"];
        $operacion->Modificar($cedula_nueva, $cedula_original);

        // Ahora eliminamos las entradas antiguas asociadas a 'cedula_original'
        $operacion->Eliminar($cedula_original);
    } else {
        // Si 'profesor' y 'origin' son iguales, eliminamos las entradas
        $operacion->Eliminar($cedula);
    }

    // Si hay materias que agregar
    if ($_POST["add"] != "") {
        $array = explode(",", $_POST["add"]);
        for ($i = 1; $i < count($array); $i++) { 
            $operacion->registrar($cedula, $array[$i]);
        }
    }

    // Redirige después de completar la operación
    header("Location: ../Vista/Profesores_Materias/profesor_materia.php");
    exit(); // Es recomendable usar exit después de header para evitar que el script continúe ejecutándose
}
?>
