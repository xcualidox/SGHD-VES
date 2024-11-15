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

$html = $headerHTML .'
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

<h1>Lista de Profesores</h1>
<table>
    <thead>
        <tr>
            <th>Cédula</th>
            <th>Nombre Completo</th>
            <th>Dirección</th>
            <th>Teléfono</th>
            <th>Correo</th>
        </tr>
    </thead>
    <tbody>';

foreach ($profesores as $profesor) {
    $html .= '
        <tr class="highlight">
            <td>' . $profesor['cedula'] . '</td>
            <td>' . $profesor['nombres']  . $espacio . $profesor['apellidos'] . '</td>
        
            <td class="secondary">' . $profesor['direccion'] . '</td>
            <td>' . $profesor['telefono'] . '</td>
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