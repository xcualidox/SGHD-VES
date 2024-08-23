<?php
include_once("../../../libraries/vendor/autoload.php"); 
include_once("../../Control/c_asignatura.php");

use Dompdf\Dompdf;

$query = new query();
$asignatura = $query->obtenerDatosAsignaturas();
$espacio = " ";

$html = '
<style>
    body {
        font-family: Arial, sans-serif;
      
    }
    h1 {
        color: #black;
        text-align: center;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        background-color: #ffffff;
    }
    th {
        background-color: #00796b;
        color: #ffffff;
        padding: 8px;
        text-align: left;
        text-align: center;
    }
    td {
        border: 1px solid #058671;
         max-width: 100px; 
        color: black;
        padding: 8px;
        text:center;
    }
    .email {
        max-width: 150px; /* Limita el ancho */
        word-wrap: break-word;
    }
  
    .secondary {
   
        max-width: 150px; /* Limita el ancho  */
        word-wrap: break-word;
    }
</style>

<h1>Lista de Materias</h1>
<table>
    <thead>
        <tr>
            <th>Codigo</th>
            <th>AREAS   DE FORMACION</th>
        </tr>
    </thead>
    <tbody>';

foreach ($asignatura as $asignaturas) {
    $html .= '
        <tr class="highlight">
            <td>' . $asignaturas['codigo'] . '</td>
            <td>' . $asignaturas['nombre']  . '</td>
        
        </tr>';
}

$html .= '
    </tbody>
</table>';

$dompdf = new Dompdf();
$dompdf->loadHtml($html);
$dompdf->setPaper('A4', 'landscape');
$dompdf->render();
$dompdf->stream("lista_profesores.pdf", array("Attachment" => false));
?>