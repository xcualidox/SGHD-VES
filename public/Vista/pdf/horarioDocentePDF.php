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

// Encabezado y pie
$headerHTML = generarMembreteHTML();
$footerHTML = generarFooter();


// Obtener bloques ya generados (como en JS)
$bloques = $zonaModel->obtenerBloquesHorarioPDF(); // ["07:00-07:45", "07:45-08:30", ...]
$horarioData = $zonaModel->BloquesHorarioPDF($cedula, $anoEscolar); // trae 'intervalo', 'codigo_dia', etc.
$anoEscolar = $zonaModel->anoEscolarPDF();
$anoEscolarTexto = $anoEscolar[0][1];




$nombreProfesor = $horarioData[0]['nombreProfesor'];

// Días abreviados → nombres
$dias = [
    'L'  => 'Lunes',
    'M'  => 'Martes',
    'MM'  => 'Miércoles',
    'J'  => 'Jueves',
    'V'  => 'Viernes'
];

// echo '<pre>';
// var_dump($horarioData);
// echo '</pre>';

// exit();
// Inicializar el mapa: [bloque][dia] = contenido
$horarioMap = [];

// Rellenar el horarioMap con los datos
foreach ($horarioData as $fila) {
    // "B1L", "B2V", etc.
    $codigo = $fila['codigo_dia']; // ejemplo: B1L
    preg_match('/B(\d+)(MM|M|L|J|V)/', $codigo, $matches);

    if (!$matches) continue;

    $bloque = (int)$matches[1];
    $diaAbrev = $matches[2];

    // Asegurar que el día es válido
    if (!isset($dias[$diaAbrev])) continue;

    $contenido = htmlspecialchars($fila['asignatura']) . "<br>" .
                // htmlspecialchars($fila['aula']) . "<br>" .
                 htmlspecialchars($fila['seccion']);

    // Si ya hay contenido, concatenar
    if (isset($horarioMap[$bloque][$diaAbrev])) {
        $horarioMap[$bloque][$diaAbrev] .= "<hr>" . $contenido;
    } else {
        $horarioMap[$bloque][$diaAbrev] = $contenido;
    }
}

// ✅ CSS
$css = '<style>
    body {
        font-family: Arial, sans-serif;
        font-size: 12px;
    }
    h2 {
        text-align: center;
    
    }
   h3 {
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
 td {
        white-space: normal;         /* permite saltos de línea */
        word-wrap: break-word;       /* rompe palabras largas */
        max-width: 150px;            /* ancho máximo por celda */
    }
    th {
        background-color: #f2f2f2;
        font-weight: bold;
    }
</style>';

$html = $headerHTML . $css;

$html .= '<h3>AÑO ESCOLAR:'. htmlspecialchars($anoEscolarTexto) .' | PROFESOR: '. htmlspecialchars($nombreProfesor) .' </h3>

<table>
    <thead>
        <tr>
            <th>Hora</th>';
foreach ($dias as $d) {
    $html .= "<th>$d</th>";
}
$html .= '</tr>
    </thead>
    <tbody>';

// Recorrer bloques por índice
foreach ($bloques as $index => $rango) {
    $bloqueNumero = $index + 1;

    $html .= "<tr>";
    $html .= "<td>$rango</td>";

    foreach (array_keys($dias) as $diaAbrev) {
        $contenido = $horarioMap[$bloqueNumero][$diaAbrev] ?? '';
        $html .= "<td>$contenido</td>";
    }

    $html .= "</tr>";
}

$html .= '</tbody></table>';

$html .= '<p style="font-size: 12px;"><strong>Fecha de Impresión PDF:</strong> ' . $footerHTML['fechaHoraActual'] . '</p>';

// Configuración DomPDF
$dompdf->loadHtml($html);
$dompdf->setPaper('A4', 'landscape');
$dompdf->render();

// Pie de página
$canvas = $dompdf->getCanvas();
$canvas->page_text(380, 560, 'Página {PAGE_NUM} de {PAGE_COUNT}', null, 10, array(0, 0, 0));

$footerText = $footerHTML['direccion'] . ' | ' . $footerHTML['telefono'] . ' | ' . $footerHTML['fechaHoraActual'];
$canvas->page_text(200, 580, $footerText, null, 8, array(0, 0, 0));

// Mostrar PDF
$dompdf->stream("Horario_Docente_$nombreProfesor.pdf", array("Attachment" => false));
?>