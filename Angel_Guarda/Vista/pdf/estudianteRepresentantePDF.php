<?php
include("../../../libraries/vendor/autoload.php");
include("membrete/membrete.php");
use Dompdf\Dompdf;


    $headerHTML = generarMembreteHTML();

// Agregar contenido adicional al HTML del PDF
$html = $headerHTML . '
<p>Contenido adicional del PDF aquí.</p>
';

// Configuración de DomPDF
$dompdf = new Dompdf();
$dompdf->loadHtml($html);
$dompdf->setPaper('A4', 'landscape');
$dompdf->render();
$dompdf->stream("documento.pdf", array("Attachment" => false));
?>