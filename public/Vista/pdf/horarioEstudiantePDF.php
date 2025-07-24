<?php
include("../../../libraries/vendor/autoload.php");
include("membrete/membrete.php");
include("membrete/footer.php");
require_once('../../Modelo/horario.php');

use Dompdf\Dompdf;

$codigoSeccion = $_GET['codigoSeccion'] ?? null;
$recesoHora = $_GET['receso'] ?? null;

$zonaModel = new zona();
$dompdf = new Dompdf();

$headerHTML = generarMembreteHTML();
$footerHTML = generarFooter();

// Obtener bloques con hora dinámica
$bloques = $zonaModel->obtenerBloquesHorarioPDFEstudiante($recesoHora); // ["07:00-07:45", ...]
$horarioData = $zonaModel->BloquesHorarioEstudiantePDF($codigoSeccion); // trae 'codigo_dia', 'asignatura', etc.

$nombreSeccion = $horarioData[0]['seccion'] ?? '';

// Días abreviados → nombres
$dias = [
    'L' => 'Lunes',
    'M' => 'Martes',
    'MM' => 'Miércoles',
    'J' => 'Jueves',
    'V' => 'Viernes',
];

// Mapear bloques [bloque][dia] = contenido
$horarioMap = [];

foreach ($horarioData as $fila) {
    if (preg_match('/B(\d+)(MM|M|L|J|V)/', $fila['codigo_dia'], $matches)) {
        $bloque = (int)$matches[1];
        $diaAbrev = $matches[2];
        if (isset($dias[$diaAbrev])) {
            $contenido = htmlspecialchars($fila['asignatura']) . "<br>" . htmlspecialchars($fila['seccion']);
            if (isset($horarioMap[$bloque][$diaAbrev])) {
                $horarioMap[$bloque][$diaAbrev] .= "<hr>" . $contenido;
            } else {
                $horarioMap[$bloque][$diaAbrev] = $contenido;
            }
        }
    }
}

// Localizar el índice del receso (si aplica)
$recesoIndex = -1;
if ($recesoHora) {
    foreach ($bloques as $i => $rango) {
        [$inicio] = explode('-', $rango);
        if (trim($inicio) === trim($recesoHora)) {
            $recesoIndex = $i + 1;
            break;
        }
    }
}


// echo '<pre>';
// var_dump($bloques,$horarioData);
// echo '</pre>';
// exit();
// CSS limpio como en tu ejemplo anterior
$css = '<style>
    body {
        font-family: Arial, sans-serif;
        font-size: 12px;
    }
    h2 {
        text-align: center;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 10px;
        font-size: 10px;
    }
    table, th, td {
        border: 1px solid #ddd;
        padding: 5px;
        text-align: center;
        vertical-align: middle;
    }
    th {
        background-color: #f2f2f2;
        font-weight: bold;
    }
 .receso {
    background-color: #fff3cd;
    font-weight: bold;
    font-style: italic;
    text-align: center;
    vertical-align: middle;
    font-size: 14px;
}
</style>';

$html = $headerHTML . $css;
$html .= '<h2>Horario de  ' . htmlspecialchars($nombreSeccion) . '</h2>';

$html .= '<table>
    <thead>
        <tr>
            <th>Hora</th>';
foreach ($dias as $d) {
    $html .= "<th>$d</th>";
}
$html .= '</tr>
    </thead>
    <tbody>';

// Mostrar bloques e insertar receso si corresponde
foreach ($bloques as $index => $rango) {
    $bloqueNumero = $index + 1;

    $html .= "<tr>";
    $html .= "<td>$rango</td>";  // columna hora, muestra "07:00-07:45", o "RECESO: 08:20-09:05"

    // Detectar si este bloque es el receso por contenido, por ejemplo que el string contenga "RECESO"
    if (stripos($rango, 'RECESO') !== false) {
        // Si es receso, en todas las celdas de días poner "RECESO"
        foreach ($dias as $diaAbrev => $diaNombre) {
            $html .= '<td class="receso" style="font-weight:bold; font-style:italic; background:#fff3cd; text-align:center;">RECESO</td>';
        }
    } else {
        // No es receso, mostrar contenido normal
        foreach (array_keys($dias) as $diaAbrev) {
            $contenido = $horarioMap[$bloqueNumero][$diaAbrev] ?? '';
            $html .= "<td>$contenido</td>";
        }
    }

    $html .= "</tr>";
}

$html .= '</tbody></table>';

$html .= '<p style="font-size: 12px;"><strong>Fecha de Impresión PDF:</strong> ' . $footerHTML['fechaHoraActual'] . '</p>';

// Renderizar PDF
$dompdf->loadHtml($html);
$dompdf->setPaper('A4', 'landscape');
$dompdf->render();

// Pie de página
$canvas = $dompdf->getCanvas();
$canvas->page_text(380, 560, 'Página {PAGE_NUM} de {PAGE_COUNT}', null, 10, array(0, 0, 0));
$footerText = $footerHTML['direccion'] . ' | ' . $footerHTML['telefono'] . ' | ' . $footerHTML['fechaHoraActual'];
$canvas->page_text(200, 580, $footerText, null, 8, array(0, 0, 0));

// Mostrar PDF en navegador
$dompdf->stream("Horario_Seccion_$nombreSeccion.pdf", array("Attachment" => false));