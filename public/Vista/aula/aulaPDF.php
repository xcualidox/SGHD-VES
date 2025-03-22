<?php
include_once("../../../libraries/vendor/autoload.php"); 
include_once("../../Control/c_aula.php");

use Dompdf\Dompdf;

$query = new query();
$aula = $query->obtenerAula();
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

<h1>Lista de Aulas</h1>
<table>
    <thead>
        <tr>
            <th>Codigo</th>
            <th>Nombre de Aulas</th>
        </tr>
    </thead>
    <tbody>';

foreach ($aula as $aluas) {
    $html .= '
        <tr class="highlight">
            <td>' . $aluas['codigo'] . '</td>
            <td>' . $aluas['nombre']  . '</td>
        
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