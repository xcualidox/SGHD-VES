<?php 
require("../../Modelo/horario.php");
ob_start();
$objeto = new zona();

//Imagen para el PDF
$image = file_get_contents('../../../images/LogoTransp.png');
$base64Image = 'data:image/jpg;base64,' . base64_encode($image);

// Obtener el receso desde el parámetro GET
$receso = $_GET['receso'];


$fecha_inicio = new DateTime('07:00:00');
$fecha_receso_inicio = new DateTime($receso . ':00');
$fecha_receso_fin = clone $fecha_receso_inicio;
$fecha_receso_fin->add(new DateInterval('PT30M'));
$fecha_fin = new DateTime('17:00:00');
$intervalo1 = new DateInterval('PT' . $_GET["intervalo"] . 'M');
$fecha_actual = $fecha_inicio;
$contador = 1;
$dias = ["L", "M", "MM", "J", "V"];
?>

<style>
    /* Estilo para centrar la imagen y el texto */
    .header-container {
 text-align: center;
    margin-bottom: 20px;
    position: relative;
}
 img {
    position: absolute;
    left: 0;
    top: 0;
    max-width: 100px;
    height: auto;
}
.header-text {
    flex-grow: 1;
    text-align: center;
}
    
    img {
        max-width: 100px;
        height: auto;
        margin-bottom: 10px;
    }

    h3, h4 {
        margin: 5px 0;
    }

    /* Estilos para la tabla */
    table {
        width: 100%;
        border-collapse: collapse;
        text-align: center;
    }

    th {
        border: 1px solid black;
        font-size: 23px;
        background-color: #00796b;
        color: white;
    }

    td.header {
        font-weight: bold;
        border: 1px solid black;
        font-size: 18px;
        width: 30px;
    }

    td.hour {
        border: 1px solid black;
        font-size: 15px;
        height: 30px;
    }
    td.block {
        text-align: left;
        border: 1px solid black;
        font-size: 12px;
       
    }

    td.recess {
        font-size: 22px;
        font-weight: bold;
        background-color: #f0f0f0;
        color: #333;
    }

    @media print {
        th {
            font-size: 20px;
        }

        td {
            font-size: 10px;
        }
    }
</style>


 <!-- Contendor de Imagen y Texto -->
 <img src="<?php echo $base64Image; ?>" alt="No Carga la Imagen"> 
<div class="header-container">

    <h3>REPÚBLICA BOLIVARIANA DE VENEZUELA</h3>
    <h3>MINISTERIO DEL PODER POPULAR PARA LA EDUCACIÓN</h3>
    <h3>U.E.C "VICENTE EMILIO SOJO"</h3>
    <h4>CODIGO PD00511808</h4>
</div>


<table>
    <tr>
        <th colspan="6">
            HORARIO <?php echo $_GET["ano"]." '".$_GET["seccion"]."'       AÑO ".$_GET["nombre"]?>
        </th>
    </tr>
    <tr>
        <td class="header">HORA</td>
        <td class="header">LUNES</td>
        <td class="header">MARTES</td>
        <td class="header">MIERCOLES</td>
        <td class="header">JUEVES</td>
        <td class="header">VIERNES</td>
    </tr>

    <?php 
    while ($fecha_actual <= $fecha_fin) {
        if ($fecha_actual >= $fecha_fin) {
            break;
        }

        $hora = $fecha_actual->format('H:i');
        $hora2 = $fecha_actual->add($intervalo1)->format('H:i');
        $tiempo = $hora . ' - ' . $hora2;

        if ($fecha_actual >= $fecha_receso_inicio && $fecha_actual < $fecha_receso_fin) {
            echo "<tr>";
            echo "<td class='hour'>$hora - $hora2</td>";
            for ($i = 0; $i < 5; $i++) {
                $bloque = "B" . $contador . $dias[$i];
                $array = $objeto->BloquesHorarioPDF($_GET["codigo_escolar"], $_GET["codigo_seccion"], $bloque);
                if (count($array) > 0 && !empty($array[0][5])) {
               
                    $resultado = "<b>GRUPO " . $array[0][5] . "</b><br><b>AULA:</b> " . $array[0][1] . "<br><b>MATERIA:</b> " . $array[0][3]."<br><b>PROF:</b> " . $array[0][7] . " ".  $array[0][8];
                    if (isset($array[1][5]) && !empty($array[1][5])) {
                        $resultado .= "<br><b>GRUPO " . $array[1][5] . "</b><br><b>AULA:</b> " . $array[1][1] . "<br><b>MATERIA:</b> " . $array[1][3]."<br><b>PROF:</b> " . $array[1][7] . " ".  $array[1][8];
                    }
                } else {
                    $resultado = "";
                }

                echo "<td class='block'>$resultado</td>";
            }
            echo "</tr>";

            echo "<tr>";
            echo "<td class='hour'>{$fecha_receso_inicio->format('H:i')} - {$fecha_receso_fin->format('H:i')}</td>";
            echo "<td class='recess' colspan=5>RECESO</td>";
            $fecha_actual = clone $fecha_receso_fin;
            echo "</tr>";
        } else {
            echo "<tr>";
            echo "<td class='hour'>$tiempo</td>";
            for ($i = 0; $i < 5; $i++) {
                $bloque = "B" . $contador . $dias[$i];
                $array = $objeto->BloquesHorarioPDF($_GET["codigo_escolar"], $_GET["codigo_seccion"], $bloque);

                if (count($array) == 0) {
                    $resultado = "";
                } else if (count($array) > 1 && $array[0][5] != "") {
             
                    $resultado = "<b>GRUPO:</b> " . $array[0][5] . "<br><b>AULA:</b> " . $array[0][1] . "<br><b>MATERIA:</b> " . $array[0][3] ."<br><b>PROF:</b> " . $array[0][7] . " ".  $array[0][8].
                                 "<br><b>GRUPO:</b> " . $array[1][5] . "<br><b>AULA:</b> " . $array[1][1] . "<br><b>MATERIA:</b> " . $array[1][3] ."<br><b>PROF:</b> " . $array[1][7] . " ".  $array[1][8];
                } else {
                    $resultado = "<b>AULA:</b> " . $array[0][1] . "<br><b>MATERIA:</b> " . $array[0][3] . "<br><b>PROF:</b> " . $array[0][7] . " " . $array[0][8];
                }
               

                echo "<td class='block'>$resultado</td>";
            }
            echo "</tr>";
        }

        $contador++;
    }
    ?>
</table>

<?php
include_once("../../../libraries/vendor/autoload.php");
use Dompdf\Dompdf;
$dompdf = new Dompdf();
$html = ob_get_clean();
$option = $dompdf->getOptions();
$option->set(array('isRemoteEnabled' => true));
$dompdf->set_option('dpi', 100);
$dompdf->setOptions($option);
$dompdf->loadHtml($html);
$dompdf->setPaper("A4", "landscape");
$dompdf->render();
$dompdf->stream("horario_" . $_GET["ano"] . "_" . $_GET["seccion"] . "_LAPSO_" . $_GET["nombre"] . ".pdf", array('Attachment' => false)); 

?>
