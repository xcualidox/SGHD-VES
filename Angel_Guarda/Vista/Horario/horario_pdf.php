<?php 
require("../../Modelo/horario.php");
ob_start();
$objeto = new zona();

$fecha_inicio = new DateTime('07:00:00');
$fecha_comparar = new DateTime('09:00:00');
$fecha_comparar2 = new DateTime('09:40:00');
$fecha_fin = new DateTime('17:00:00');
$intervalo1 = new DateInterval('PT'.$_GET["intervalo"].'M');
$fecha_actual = $fecha_inicio;
$contador=1;
$dias= ["L","M","MM","J","V"];
?>
<table style='
        width:100%;border-collapse: collapse;
        text-align: center;'>
    <tr>
        <th style='border:1px solid black;font-size:23px;background-color:dodgerblue;color:white;' colspan=6>Horario <?php echo $_GET["ano"]." ".$_GET["seccion"]."       LAPSO ".$_GET["nombre"]?></th>
    </tr>
    <tr>
        <td style='border:1px solid black;font-size:18px;width:30px;'>HORA</td>
        <td style='border:1px solid black;font-size:18px;width:30px;'>LUNES</td>
        <td style='border:1px solid black;font-size:18px;width:30px;'>MARTES</td>
        <td style='border:1px solid black;font-size:18px;width:30px;'>MIERCOLES</td>
        <td style='border:1px solid black;font-size:18px;width:30px;'>JUEVES</td>
        <td style='border:1px solid black;font-size:18px;width:30px;'>VIERNES</td>
    </tr>
    <?php 
    while ($fecha_actual <= $fecha_fin) {
        if ($fecha_actual >= $fecha_fin) {
            break;
        }
        $hora=$fecha_actual->format('H:i');
        $hora2=$fecha_actual->add($intervalo1)->format('H:i');
        $tiempo=$hora. ' - ' . $hora2;
        if ($fecha_actual >= $fecha_comparar && $fecha_actual < $fecha_comparar2) {
            $tiempo=$hora . ' - 9:00';
            echo "<tr>";
            echo "<td style='height:80px;border:1px solid black;font-size:18px;width:30px;'>".$tiempo."</td>";
            for ($i=0; $i < 5; $i++) {
                $bloque="B".$contador.$dias[$i];
                $array= $objeto->BloquesHorarioPDF($_GET["codigo_escolar"],$_GET["codigo_seccion"],$bloque);
                if (count($array)==0) {
                    $resultado="";
                }
                else if(count($array)>0 && $array[0][5]!="") {
                    $resultado="<b>GRUPO ".$array[0][5]."</b><br><b>AULA:</b> ".$array[0][1]."<br><b>MATERIA:</b>".$array[0][3]."<br><b>GRUPO ".$array[1][5]."</b><br><b>AULA:</b> ".$array[1][1]."<br><b>MATERIA:</b> ".$array[1][3]."<br>";
                }
                else if (count($array)>0) {
                    $resultado="<b>AULA:</b> ".$array[0][1]."<br><b>MATERIA:</b> ".$array[0][3]."<br><b>PROF:</b> ".$array[0][7]." ".$array[0][9];
                }
                echo "<td style='height:80px;border:1px solid black;font-size:14px;width:30px;'>".$resultado."</td>";
            }
            echo "</tr>";
            echo "<tr>";
            echo "<td style='height:80px;border:1px solid black;width:30px;'>9:00 - 9:30</td>";
            echo"<td style='height:80px;border:1px solid black;font-size:22px;' colspan=5>RECREO</td>";
            $fecha_actual = new DateTime('09:30:00');
            echo "</tr>";
        }
        else {
            echo "<tr>";
            echo "<td style='height:80px;border:1px solid black;font-size:18px;width:30px;'>".$tiempo."</td>";
            for ($i=0; $i < 5; $i++) {
                $bloque="B".$contador.$dias[$i];
                $array= $objeto->BloquesHorarioPDF($_GET["codigo_escolar"],$_GET["codigo_seccion"],$bloque);
                if (count($array)==0) {
                    $resultado="";
                }
                else if(count($array)>1 && $array[0][5]!="") {
                    $resultado="<b>GRUPO ".$array[0][5]."</b><br><b>AULA:</b> ".$array[0][1]."<br><b>MATERIA:</b> ".$array[0][3]."<br><b>GRUPO ".$array[1][5]."</b><br><b>AULA:</b> ".$array[1][1]."<br><b>MATERIA:</b> ".$array[1][3]."<br>";
                }
                else if (count($array)>0) {
                    $resultado="<b>AULA:</b> ".$array[0][1]."<br><b>MATERIA:</b> ".$array[0][3]."<br><b>PROF:</b> ".$array[0][7]." ".$array[0][8];
                }
                echo "<td style='height:80px;border:1px solid black;font-size:14px;width:30px;'>".$resultado."</td>";
            }
            echo "</tr>";
        }
        $contador=1+$contador;
        
    }
    ?>
</table>
<?php
include_once("../dompdf/autoload.inc.php");
use Dompdf\Dompdf;
$dompdf= new Dompdf();
$html=ob_get_clean();
$option = $dompdf->getOptions();
$option->set(array('isRemoteEnable' => true));
$dompdf->set_option('dpi', 100);
$dompdf->setOptions($option);
$dompdf->loadHtml($html);
$dompdf->setPaper("A4", "landscape");
$dompdf->render();
$dompdf->stream("horario_".$_GET["ano"]."_".$_GET["seccion"]."_LAPSO_".$_GET["nombre"].".pdf", array('Attachment' => false)); 

?>