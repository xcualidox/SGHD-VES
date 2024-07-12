<?php
session_start();
include_once("../../control/aula_tabla.php");
if ($_SESSION["sesion"]!="admin") {
    header("Location: ../../../index.php");
}
$title="Aulas";
include_once('../v_Sidebar/v_Sidebar.php')
?>


<link rel="stylesheet" href="../../../styles/aula.css">
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <div class="main-content">
        <div class="container">
            <h1>Aulas</h1>
        </div>
        <a href="aula_pdf.php"><button class='table_button' style='margin-left:20px;'>PDF</button></a>
        <div class="tabla"> 
        <table>
            <thead>
    			<td align="center">Nombre</td>
    			<td align="center">Descripcion</td>
                <td class='no_style'></td>
    		</thead>

            <?php
            if (isset($_GET["pag_asig"])==false) {
                $paginaActual=1;
            }
            else {
                $paginaActual=$_GET["pag_asig"];
            }

           
            $limit=$paginaActual*5;
            $offset=$limit-5;
            $objeto= new query();
            $resultado=$objeto->GenerarTabla($offset,$limit);
            $numFilas =$objeto->TotalPaginas();
            for ($i=0; $i < count($resultado); $i++) { 
            ?>

            <tr>
    			<td class="limitado1"><?php echo $resultado[$i]["nombre"]?></td>
                <td class="limitado2"><?php echo $resultado[$i]["descripcion"]?></td>
                <td class="no_style">
                    <button onclick='Eliminar(`<?php echo $resultado[$i]["nombre"]; ?>`)' class='table_button'>Eliminar</button>
                    <button onclick='Modificar(`<?php echo $resultado[$i]["nombre"]; ?>`,`<?php echo $resultado[$i]["descripcion"];?>`)' class='table_button'>Modificar</button>
                    <?php 
                    if ($resultado[$i]["disponibilidad"]==1) {
                        echo "<button type='button' class='desactivar' onclick='Disponibilidad(`Desactivar`,`".$resultado[$i]["nombre"]."`)'>Desactivar</button>";
                    }
                    else {
                        echo "<button type='button' class='activar' onclick='Disponibilidad(`Activar`,`".$resultado[$i]["nombre"]."`)'>Activar</button>";
                    }
                    ?>
                </td>
    		</tr>
                
            <?php 
    		}
                //se calcula el total de paginas diviendolo por la cantidad que quieres que se muestre en este caso que se muestre 6 elementos de la tabla 
            $totalpag=ceil($numFilas/5);
                //Si en tal caso hay un solo elemento igualmente se mostrara una pagina, esto es asi porque al redondear dividir 1 entre 6 siempre dara 0 asi por eso este if  
            echo "<br> <div class='paginacion'>";
                //Esto es tal caso la paginacion siga siendo menor a 10 sigue su curso normal mostrando del 1 al 10
            if ($totalpag<=10) {
                for ($i=1; $i < $totalpag+1; $i++) {
                    if ($paginaActual==$i) {
                        echo "<a href=?pag_asig=".$i." class='seleccionado' style='color:white;'>".$i."</a>";
                    }
                    else {
                        echo "<a href=?pag_asig=".$i.">".$i."</a>";
                    } 
                }
            }
            else {
                //en caso omiso se mostrara los numeros 4 menores al que antes de la pagina actual y 7 numeros mayores a la pagina actual
                for ($i=$paginaActual-4; $i < $paginaActual+7; $i++) {
                    //este if es en tal caso al seleccionar 1, 2, 3 o 4 no aparezcan numeros negativos o 0
                    if ($i<=0) {
                        $i=1;
                    }
                    //si el $i es mayor al total de paginas se rompe el for
                    if ($i>$totalpag) {
                        break;
                    }
                    if ($paginaActual==$i) {
                        echo "<a href=?pag_asig=".$i." class='seleccionado' style='color:white;'>".$i."</a>";
                    }
                    else {
                        echo "<a href=?pag_asig=".$i.">".$i."</a>";
                    } 
                }
                if ($paginaActual+7<$totalpag) {
                    echo "...";
                }
            }
                
            echo "</div>";
    		?>
            </table>
        </div>

        <br>
        <div class="boton1" id="boton1">
            <input type="button" id="btn" onclick="Mostrar()" value="Agregar" class="form">
        </div>

        <div class="boton2" style="display: none;" id="boton2">
       
        </div>

        <div class="formulario">
            <form id="form" style="display: none;" name="pantalla" class='pantalla' method="POST" action="../../Control/aula.php">
                <br>

                <label for="nom">Nombre: </label><br>
                <input type="text" id="nom" name="nom" maxlength="25" placeholder="Nombre del aula" class="formulario__input"> 
    
                <br><br>
                <label for="des">Descripcion: </label><br>
                <textarea name="des" id="des" cols="30" rows="10" class="input" maxlength="100" placeholder="Descripcion de la aula (nombre, donde se encuentra, etc)"></textarea>

                <input type="hidden" name="dis">
                <br><br>

                <input type="hidden" name="ope" id='ope'>
                <input type="hidden" name="origin" id='origin'>
                <input type="button" id="btn3" onclick="Enviar(this.value)" value="Incluir" class="table_button">
                <input type="button" id="btn2" onclick="Mostrar()" value="Cerrar" class="table_button">
            </form>
        </div>
    </div>

    
    </div>
</body>
<script type="text/javascript" src="../../../javascript/horario/aula.js"></script>


</html>