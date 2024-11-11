<?php


function generarMembreteHTML() {
    // Cargar la imagen y convertirla a base64
    $imagePath = __DIR__ . '/../../../../images/LogoTransp.png';
    if (!file_exists($imagePath)) {
        throw new Exception("La imagen del logo no se encuentra en la ruta especificada: $imagePath");
    }
    
    $image = file_get_contents($imagePath);
    $base64Image = 'data:image/png;base64,' . base64_encode($image);

    // Definir el HTML del membrete como un string
    $html = '
    <style>
        .header-container {
            text-align: center;
            margin-bottom: 20px;
            position: relative;
        }
        img {
            position: absolute;
            left: 0;
            top: 0;
            max-width: 100px;
            height: auto;
        }
        h3, h4 {
            margin: 5px 0;
        }
    </style>

    <div class="header-container">
        <img src="' . $base64Image . '" alt="Logo">
        <h3>REPÚBLICA BOLIVARIANA DE VENEZUELA</h3>
        <h3>MINISTERIO DEL PODER POPULAR PARA LA EDUCACIÓN</h3>
        <h3>U.E.C "VICENTE EMILIO SOJO"</h3>
        <h4>CODIGO PD00511808</h4>
    </div>
    ';

    return $html;
}
?>