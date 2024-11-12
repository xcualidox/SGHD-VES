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

    // Obtener la fecha y hora actuales
    $fechaHoraActual = date("d/m/Y, g:i:s a");

    // Definir el contenido HTML del footer
    $htmlFooter = "
   
 
        <p><strong>CODIGO:</strong> $codigo  <strong>RIF:</strong> $rif</p>
        <p><strong>NOMBRE INSTITUCIÓN:</strong> $nombreInst</p>
        <p><strong>DIRECCIÓN:</strong> $direccion</p>
        <p><strong>TELÉFONO:</strong> $telefono <br> $fechaHoraActual</p>
    </div>";

    return $htmlFooter;
}
?>