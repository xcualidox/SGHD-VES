<?php
include_once("../../../libraries/vendor/autoload.php"); 
include_once("../../Control/c_asignatura.php");

use Dompdf\Dompdf;

$query = new query();
$asignatura = $query->obtenerDatosAsignaturas();

$html = '
<style>
    body {
        font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
        font-size: 12px;
        color: #333333;
        margin: 20px;
    }
    h1 {
        color: #00796b;
        text-align: center;
        margin-bottom: 20px;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        background-color: #ffffff;
        box-shadow: 0 2px 5px rgba(0,0,0,0.1);
    }
    th, td {
        border: 1px solid #00796b;
        padding: 10px;
        text-align: center;
        vertical-align: middle;
    }
    th {
        background-color: #00796b;
        color: #ffffff;
        font-weight: bold;
    }
    tr:nth-child(even) {
        background-color: #f2f2f2;
    }
    tr:hover {
        background-color: #d9f2f2;
    }
    .email, .secondary {
        max-width: 180px;
        word-wrap: break-word;
    }
</style>

<h1>Lista de Materias</h1>
<table>
    <thead>
        <tr>
            <th>Código</th>
            <th>Área de Formación</th>
        </tr>
    </thead>
    <tbody>';

foreach ($asignatura as $asignaturas) {
    $html .= '
        <tr>
            <td>' . htmlspecialchars($asignaturas['codigo']) . '</td>
            <td>' . htmlspecialchars($asignaturas['nombre']) . '</td>
        </tr>';
}

$html .= '
    </tbody>
</table>';

$dompdf = new Dompdf();
$dompdf->loadHtml($html);
$dompdf->setPaper('A4', 'landscape');
$dompdf->render();
$dompdf->stream("lista_materias.pdf", array("Attachment" => false));
?>
