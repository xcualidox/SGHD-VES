<?php


function generarMembreteHTML()
{

    require_once(__DIR__ . '/../../../Control/c_datosInst.php');

    $datosInst = new datosInst();
    $obteniendoData = $datosInst->obtenerDataInst();
    $imagePath = __DIR__ . '/../../../../images/imgPDF/LogoTransp.png';
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
    // Cargar la imagen y convertirla a base64

    if (!file_exists($imagePath)) {
        throw new Exception("La imagen del logo no se encuentra en la ruta especificada: $imagePath");
    }

  
    $base64Image = base64_encode(file_get_contents($imagePath));

    // Definir el HTML del membrete como un string
    $html = '
    <head>
  <style>
@page {
    margin: 70px 40px 60px 40px;
}

body {
    font-family: Arial, sans-serif;
    margin-top: 60px;
}

header {
    text-align: center;
    position: fixed;
    top: -40px;
    width: 100%;
}

img {
    position: absolute;
    left: 0;
    top: -10;
    max-width: 80px;
    height: auto;
}

footer {
    text-align: center;
    position: fixed;
    bottom: -20px;
    width: 100%;
    font-size: 9px;
}

.header-container h3 {
    margin: 0;
    font-size: 14px;
}

.header-container h4 {
    margin: 0;
    font-size: 11px;
}
</style>
  </head>
    <body>
        <header>
            <img src="data:image/jpeg;base64,' . $base64Image . '"alt="Header">
                <div class="header-container">
        
                <h3>REPÚBLICA BOLIVARIANA DE VENEZUELA 
                <br> MINISTERIO DEL PODER POPULAR PARA LA EDUCACIÓN
                <br>' . $nombreInst . '
                </h3>
                <h4>CODIGO Plantel: ' . $codigo . '<br>   Rif:' . $rif . '</h4>
            
            </div>
        </header>




    ';

    return $html;
}
