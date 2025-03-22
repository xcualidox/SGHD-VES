<?php
include("../../../libraries/vendor/autoload.php");
include("membrete/membrete.php");
include("membrete/footer.php");
include("../../Control/c_estudiantes.php");

use Dompdf\Dompdf;

if (isset($_GET['cedula'])) {
    $cedula = $_GET['cedula'];
}

// Crear el objeto Dompdf
$dompdf = new Dompdf();

// Generar el HTML para el encabezado y pie de página
$headerHTML = generarMembreteHTML();
$footerHTML = generarFooter(); 

// Obtener datos del estudiante
$estudiantePDF = $estudiante->consultarEstudianteRepresentante($cedula, null, null, null, $resultados_por_pagina, $offset);

// Construir el HTML del contenido del PDF con los datos del estudiante

$css= '<style>
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
            font-size: 12px;
        }

        table td {
            padding: 8px;
            border: 1px solid #ddd;
        }

        .header, .representative {
            background-color: #f2f2f2;
            font-weight: bold;
            padding: 8px;
        }
</style>';
$html = $headerHTML . $css.'


    <h2>Planilla de Inscripción del Estudiante</h2>
    <table>
        <tr>
            <td class="header" colspan="2">Datos del Estudiante</td>
        </tr>
        <tr>
            <td>Cédula del Estudiante</td>
                //ESTO ES PARA FORMATEAR LA CEDULA QUE SALGA EN PUNTOS
            <td>' . number_format(htmlspecialchars($estudiantePDF[0]['cedula_estudiante']), 0, '', '.'). '</td>
        </tr>
        <tr>
            <td>Nombres del Estudiante</td>
            <td>' . htmlspecialchars($estudiantePDF[0]['nombres_estudiante']) . '</td>
        </tr>
        <tr>
            <td>Apellidos del Estudiante</td>
            <td>' . htmlspecialchars($estudiantePDF[0]['apellidos_estudiante']) . '</td>
        </tr>
        <tr>
            <td>Año Escolar</td>
            <td>' . htmlspecialchars($estudiantePDF[0]['ano']) . '</td>
        </tr>
        <tr>
            <td>Sección</td>
            <td>' . htmlspecialchars($estudiantePDF[0]['seccion']) . '</td>
        </tr>
        <tr>
            <td>Activo</td>
            <td>' . ($estudiantePDF[0]['activo'] ? 'Sí' : 'No') . '</td>
        </tr>
        <tr>
            <td class="representative" colspan="2">Datos del Representante</td>
        </tr>
        <tr>
            <td>Cédula del Representante</td>
                  //ESTO ES PARA FORMATEAR LA CEDULA QUE SALGA EN PUNTOS
            <td>' . number_format(htmlspecialchars($estudiantePDF[0]['cedula_representante']), 0, '', '.'). '</td>
        </tr>
        <tr>
            <td>Nombres del Representante</td>
            <td>' . htmlspecialchars($estudiantePDF[0]['nombres_representante']) . '</td>
        </tr>
        <tr>
            <td>Apellidos del Representante</td>
            <td>' . htmlspecialchars($estudiantePDF[0]['apellidos_representante']) . '</td>
        </tr>
        <tr>
            <td>Correo del Representante</td>
            <td>' . htmlspecialchars($estudiantePDF[0]['correo']) . '</td>
        </tr>
        <tr>
            <td>Dirección</td>
            <td>' . htmlspecialchars($estudiantePDF[0]['direccion']) . '</td>
        </tr>
        <tr>
            <td>Teléfono</td>
            <td>' . htmlspecialchars($estudiantePDF[0]['telefono']) . '</td>
        </tr>
        <tr>
            <td>Teléfono Alternativo</td>
            <td>' . htmlspecialchars($estudiantePDF[0]['telefono_2']) . '</td>
        </tr>
    </table>
' ;

// Configuración de DomPDF
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

// Generar y mostrar el PDF
$dompdf->stream("Es_" . $cedula ."_".$estudiantePDF[0]['apellidos_estudiante']."_".$estudiantePDF[0]['nombres_estudiante']. ".pdf", array("Attachment" => false));
?>
