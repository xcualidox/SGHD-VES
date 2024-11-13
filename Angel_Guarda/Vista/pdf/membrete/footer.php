<?php
function generarFooter() {
    // Incluir el controlador y cargar los datos de la institución
    require_once(__DIR__ . '/../../../Control/c_datosInst.php');

    $datosInst = new datosInst();
    $obteniendoData = $datosInst->obtenerDataInst();

    // Verificar que los datos se hayan obtenido correctamente
    if (!$obteniendoData || !is_array($obteniendoData)) {
        return "<p>Error al obtener los datos de la institución.</p>";
    }

    // Asignar los valores del array a variables
    $rif = $obteniendoData['rif'] ?? '';
    $direccion = $obteniendoData['direccion'] ?? '';
    $telefono = $obteniendoData['telefono'] ?? '';
    $nombreInst = $obteniendoData['nombre_institucion'] ?? '';
    $codigo = $obteniendoData['codigo_plantel'] ?? '';

    date_default_timezone_set('America/Caracas'); //ESTABLECIENDO LA ZONA HORARIA A Venezuela
    // Obtener la fecha y hora actuales
    $fechaHoraActual = date("d/m/Y, h:i:s a");

    // Definir el contenido HTML del footer
    $htmlFooter = [
         "rifFooter"=> "Rif:".$rif,
         "nombreInstFooter"=> $nombreInst,
         "codigoFooter"=> $codigo,
        "direccion" => "Dirección: ".$direccion,
        "telefono" => " Telefóno: ".$telefono,
        "fechaHoraActual" => " ".$fechaHoraActual
    ];


    return $htmlFooter;
}
?>