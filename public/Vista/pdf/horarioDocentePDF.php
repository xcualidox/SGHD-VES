<?php
include("../../../libraries/vendor/autoload.php");
include("membrete/membrete.php");
include("membrete/footer.php");
require_once('../../Modelo/horario.php');

use Dompdf\Dompdf;

$cedula = isset($_GET['cedula']) ? $_GET['cedula'] : null;
$anoEscolar = isset($_GET['anoEscolar']) ? $_GET['anoEscolar'] : null;

$zonaModel = new zona();

// Crear el objeto Dompdf
$dompdf = new Dompdf();

// Generar el encabezado y pie de página
$headerHTML = generarMembreteHTML();
$footerHTML = generarFooter();

$bloques = $zonaModel->obtenerBloquesHorarioPDF(); // ["07:00-07:45", "07:45-08:30", ...]
$horarioData = $zonaModel->BloquesHorarioPDF($cedula, $anoEscolar);

// Mapeo [bloque][dia] => datos
$horarioMap = [];

foreach ($horarioData as $fila) {
    $intervalo = $fila['intervalo'];
    $dia = $fila['codigo_dia'];

    $contenido = $fila['asignatura'] . "<br>" . $fila['aula'] . "<br>" . $fila['seccion'];
    $horarioMap[$intervalo][$dia] = $contenido;
}

// Días en orden
$dias = [
    1 => "Lunes",
    2 => "Martes",
    3 => "Miércoles",
    4 => "Jueves",
    5 => "Viernes"
];

// ✅ CSS + contenido HTML inicializado correctamente
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
            text-align: center;
            vertical-align: middle;
        }

        th {
            background-color: #f2f2f2;
            font-weight: bold;
        }
</style>';

$html = $headerHTML . $css;

$html .= '<h2>Horario del Docente</h2>
<table>
    <thead>
        <tr>
            <th>Bloque</th>';

foreach ($dias as $d) {
    $html .= "<th>$d</th>";
}

$html .= '</tr>
    </thead>
    <tbody>';

foreach ($bloques as $index => $rango) {
    $html .= "<tr>";
    $html .= "<td>$rango</td>";

    foreach (array_keys($dias) as $dia) {
        $contenido = $horarioMap[$index][$dia] ?? '';
        $html .= "<td>$contenido</td>";
    }

    $html .= "</tr>";
}

$html .= '</tbody></table>';
$html .= '<p style="font-size: 12px;"><strong>Fecha de Impresión PDF:</strong> ' . $footerHTML['fechaHoraActual'] . '</p>';

// Configuración de DomPDF
$dompdf->loadHtml($html);
$dompdf->setPaper('A4', 'landscape');
$dompdf->render();

// Pie de página
$canvas = $dompdf->getCanvas();
$canvas->page_text(380, 560, 'Página {PAGE_NUM} de {PAGE_COUNT}', null, 10, array(0, 0, 0));

$footerText = $footerHTML['direccion'] . ' | ' . $footerHTML['telefono'] . ' | ' . $footerHTML['fechaHoraActual'];
$canvas->page_text(200, 580, $footerText, null, 8, array(0, 0, 0));

// Mostrar el PDF en el navegador
$dompdf->stream("Horario_Docente.pdf", array("Attachment" => false));
?>