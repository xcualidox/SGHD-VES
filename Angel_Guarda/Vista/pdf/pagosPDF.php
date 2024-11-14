<?php
include("../../../libraries/vendor/autoload.php");
include("membrete/membrete.php");
include("membrete/footer.php");

require_once(__DIR__ . '../../../Control/c_pagos.php');
use Dompdf\Dompdf;

$consulta=3;
// Crear el objeto Dompdf
$dompdf = new Dompdf();

// Generar el HTML para el encabezado y pie de página
$headerHTML = generarMembreteHTML();
$footerHTML = generarFooter();  // No es necesario pasar el canvas aquí
$reciboPago=$obtenerPagosPDF;
// Agregar el texto del footer debajo del número de página
$footerText = $footerHTML['direccion'] . ' | ' . $footerHTML['telefono'] ;

if ($reciboPago[0]["tipo_pago"]=='bolivar') {
    $calculoDolar=  floatval($reciboPago[0]["dolarBCV"])*floatval($reciboPago[0]["monto"]) ;
    $reciboPago[0]["monto"] = ' Bs ' .number_format($calculoDolar, 2) ;
}
else{
    $reciboPago[0]["monto"]= '$ '. $reciboPago[0]["monto"];
}





// Agregar contenido adicional al HTML del PDF
$html =''.$headerHTML.'
<div style="width: 100%; max-width: 600px; margin: 0 auto; border: 1px solid #ddd; padding-left: 10px; font-family: Arial, sans-serif; font-size: 12px; color: #333;">

    <h2 style="text-align: center;">Recibo de Pago #' . $reciboPago[0]["idPago"] . '</h2>
 
   
    <p style="text-align: center;"><strong>Fecha de Registro:</strong> ' . $reciboPago[0]["fecha"] . '</p>
  
    <div style="display: flex; justify-content: space-between;">
        <!-- Detalles del Pago - Columna Izquierda -->
        <div style="width: 45%; float: left;">
         <h3>Datos del Representante</h3>
            <p><strong>Cédula del Representante:</strong> ' . $reciboPago[0]["cedula_representante"] . '</p>
            <p><strong>Nombre del Representante:</strong> ' . $reciboPago[0]["nombres_representante"] . '</p>
            <p><strong>Teléfono:</strong> ' . $reciboPago[0]["telefono"] . '</p>
            <p><strong>Dirección:</strong> ' . $reciboPago[0]["direccion"] . '</p>
              <h3>Datos del Estudiante</h3>
            <p><strong>Cédula del Estudiante:</strong> ' . $reciboPago[0]["cedula_estudiante"] . '</p>
            <p><strong>Nombre del Estudiante:</strong> ' . $reciboPago[0]["nombres_estudiante"] . '</p>
         

           
        </div>

        <!-- Datos del Estudiante y Representante - Columna Derecha -->
        <div style="width: 45%; float: right;">
          <h3>Detalles del Pago</h3>
          
           
 
            <p><strong>Tipo de Pago:</strong> ' . $reciboPago[0]["tipo_pago"] . '</p>
               <p><strong>Año Escolar:</strong> ' . $reciboPago[0]["ano_escolar"] . '</p>
                          <p><strong>Meses Pagados:</strong> ' . $reciboPago[0]["mes"] . '</p>
          
          
          
            <p><strong>Descuento:</strong> ' . floatval(1-$reciboPago[0]["descuento"])*100 . '%</p>
              <p><strong>Referencia:</strong> ' . $reciboPago[0]["referencia_id"] . '</p>
             <p><strong>Monto Pagado:</strong> ' . $reciboPago[0]["monto"]  . '</p>
               <p><strong>Nota de Pago:</strong> ' . $reciboPago[0]["detalles"] . '</p>
        </div>
        
    </div>
 

    <div style="clear: both;">  </div>
      
</div>
 <p style="font-size: 12px;"><strong>Fecha de Impresión PDF:</strong> '  .$footerHTML['fechaHoraActual'].'</p>
';



// Configuración de DomPDF
$dompdf->loadHtml($html);
$dompdf->setPaper('A4', 'portrait');

// Renderizar el PDF
$dompdf->render();

// Obtener el canvas para manipular el pie de página
$canvas = $dompdf->getCanvas();








// Generar y mostrar el PDF
$dompdf->stream("Pago_".$reciboPago[0]["fecha"]."_ID".$reciboPago[0]["idPago"].".pdf", array("Attachment" => false));
?>