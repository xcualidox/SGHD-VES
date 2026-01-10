<?php
include_once("../../../libraries/vendor/autoload.php"); 
include_once("../../Control/c_profesor.php");
include("../pdf/membrete/membrete.php");
include("../pdf/membrete/footer.php");


use Dompdf\Dompdf;

$query = new query();
$profesores = $query->obtenerDatosProfesores();
$headerHTML = generarMembreteHTML();
$footerHTML = generarFooter(); 
$espacio = " ";

$html = $headerHTML . '
<style>
body {
    font-family: Arial, sans-serif;
    font-size: 11px;
    color: #000;
}

h1 {
    text-align: center;
    font-size: 18px;
    margin-bottom: 10px;
}

.table-container {
    margin-top: 10px;
}

table {
    width: 100%;
    border-collapse: collapse;
}

th {
    background-color: #2f5597;
    color: #ffffff;
    padding: 8px;
    text-align: center;
    font-size: 11px;
}

td {
    border: 1px solid #cfcfcf;
    padding: 7px;
    vertical-align: middle;
    text-align: center;
    font-size: 10px;
}

tbody tr:nth-child(even) {
    background-color: #f2f6fb;
}

tbody tr:nth-child(odd) {
    background-color: #ffffff;
}

.nombre {
    text-align: left;
}

.direccion {
    text-align: left;
    max-width: 160px;
    word-wrap: break-word;
}

.email {
    max-width: 180px;
    word-wrap: break-word;
    text-align: left;
}

.telefono {
    white-space: nowrap;
}
</style>

<h1>Listado General de Trabajadores</h1>

<div class="table-container">
<table>
    <thead>
        <tr>
            <th style="width:12%;">Cédula</th>
            <th style="width:20%;">Nombre Completo</th>
            <th style="width:28%;">Dirección</th>
            <th style="width:15%;">Teléfono</th>
            <th style="width:25%;">Correo Electrónico</th>
        </tr>
    </thead>
    <tbody>';
foreach ($profesores as $profesor) {
    $html .= '
    <tr>
        <td>' . $profesor['cedula'] . '</td>
        <td class="nombre">' . $profesor['nombres'] . ' ' . $profesor['apellidos'] . '</td>
        <td class="direccion">' . $profesor['direccion'] . '</td>
        <td class="telefono">' . $profesor['telefono'] . '</td>
        <td class="email">' . $profesor['correo'] . '</td>
    </tr>';
}

$html .= '
    </tbody>
</table>';

$dompdf = new Dompdf();
$dompdf->loadHtml($html);
$dompdf->setPaper('A4', 'portrait');

// Renderizar el PDF
$dompdf->render();

// Obtener el canvas para manipular el pie de página
$canvas = $dompdf->getCanvas();

// Agregar el número de página en el pie de página
$canvas->page_text(270, 770, 'Página {PAGE_NUM} de {PAGE_COUNT}', null, 10, array(0, 0, 0));

// Agregar el texto del footer
$footerText = $footerHTML['direccion'] . ' | ' . $footerHTML['telefono'] . ' | ' . $footerHTML['fechaHoraActual'];
$canvas->page_text(130, 785, $footerText, null, 8, array(0, 0, 0));
$dompdf->stream("lista_profesores.pdf", array("Attachment" => false));
?>