<?php
include("../../../libraries/vendor/autoload.php");
include("membrete/membrete.php");
include("membrete/footer.php");


use Dompdf\Dompdf;

if (isset($_GET['cedula'])) {
    $nombre = $_GET['cedula'];
}

// Crear el objeto Dompdf
$dompdf = new Dompdf();

// Generar el HTML para el encabezado y pie de página
$headerHTML = generarMembreteHTML();
$footerHTML = generarFooter();  // No es necesario pasar el canvas aquí

// Agregar contenido adicional al HTML del PDF
$html =''.$headerHTML.'
<p>Contenido adicional del PDF aquí.
';



// Configuración de DomPDF
$dompdf->loadHtml($html);
$dompdf->setPaper('A4', 'portrait');

// Renderizar el PDF
$dompdf->render();

// Obtener el canvas para manipular el pie de página
$canvas = $dompdf->getCanvas();




// Agregar el número de página en el pie de página
$canvas->page_text(270, 770, 'Página {PAGE_NUM} de {PAGE_COUNT}', null, 10, array(0, 0, 0));

// Agregar el texto del footer debajo del número de página
$footerText = $footerHTML['direccion'] . ' | ' . $footerHTML['telefono'] . ' | ' . $footerHTML['fechaHoraActual'];

$canvas->page_text(130, 785, $footerText, null, 8, array(0, 0, 0)); // Ajusta la posición según sea necesario

// Generar y mostrar el PDF
$dompdf->stream("Estudiante_".$nombre.".pdf", array("Attachment" => false));
?>