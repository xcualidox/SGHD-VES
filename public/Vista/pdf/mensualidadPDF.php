<?php
include("../../../libraries/vendor/autoload.php");
include("membrete/membrete.php");
include("membrete/footer.php");
require_once(__DIR__ . '../../../Control/c_mensualidad.php');

use Dompdf\Dompdf;

if (isset($_GET['anoEscolar'])) {
    $anoescolar = $_GET['anoEscolar'];
}

$mensualidad = new mensualidad();

// Crear el objeto Dompdf
$dompdf = new Dompdf();

// Generar el encabezado y pie de página
$headerHTML = generarMembreteHTML();
$footerHTML = generarFooter();

// Obtener los datos de la mensualidad
$anoescolarPDF = $mensualidad->obtenerMensualidad($anoescolar);

$tituloMes = isset($anoescolarPDF[0]['nombre']) ? ucfirst(htmlspecialchars($anoescolarPDF[0]['nombre'])) : 'Mes Desconocido';


// CSS para el PDF
$css = '<style>
        body {
            font-family: Arial, sans-serif;
            font-size: 12px;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
            font-size: 12px;
        }

        table, th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
            font-weight: bold;
        }
</style>';

// Construcción del contenido del PDF
$html = $headerHTML . $css . '
    <h2>Mensualidad - Año Escolar ' .  $tituloMes. '</h2>
    <table>
        <tr>
            <th>Mes</th>
            <th>Monto Divisas</th>
        </tr>';

foreach ($anoescolarPDF as $mensualidad) {
    $html .= '<tr>
                <td>' . ucfirst(htmlspecialchars($mensualidad['mes'])) . '</td>
                <td>' . number_format((float) $mensualidad['monto'], 2, '.', ',') . '</td>
              </tr>';
}

$html .= '</table> <p style="font-size: 12px;"><strong>Fecha de Impresión PDF:</strong> ' .$footerHTML['fechaHoraActual'].'</p>';

// Configuración de DomPDF
$dompdf->loadHtml($html);
$dompdf->setPaper('A4', 'portrait');

// Renderizar el PDF
$dompdf->render();

// Obtener el canvas para manipular el pie de página
$canvas = $dompdf->getCanvas();
$canvas->page_text(270, 770, 'Página {PAGE_NUM} de {PAGE_COUNT}', null, 10, array(0, 0, 0));

$footerText = $footerHTML['direccion'] . ' | ' . $footerHTML['telefono'] . ' | ' . $footerHTML['fechaHoraActual'];
$canvas->page_text(130, 785, $footerText, null, 8, array(0, 0, 0));

// Mostrar el PDF en el navegador sin descargar automáticamente
$dompdf->stream("Mensualidad_" . $anoescolar . ".pdf", array("Attachment" => false));
?>