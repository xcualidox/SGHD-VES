<?php
session_start();
include_once("../../control/profesor_tabla.php");
if ($_SESSION["sesion"]!="admin") {
    header("Location: ../../../index.php");
}

$title = 'Profesor';
include_once('../v_Sidebar/v_Sidebar.php');
?>
<!--Aqui se el css se toma del Padre que es Sidebar-->
<script type="text/javascript" src="../Js/profesor.js"></script>

    <div class="main-content">
        <div class="container">
            <h1>Profesores</h1>
        </div>
        <a href="profesor_pdf.php"><button class='table_button' style='margin-left:20px;'>PDF</button></a>
        <div class="tabla"> 
            <table>
                <thead>
    				<td align="center">Cedula</td>
    				<td align="center">Primer Nombre</td>
                    <td align="center">Segundo Nombre</td>
    				<td align="center">Primer Apellido</td>
                    <td align="center">Segundo Apellido</td>
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
    			    <td class="limitado1"><?php echo $resultado[$i]["cedula"]?></td>
    			    <td class="limitado2"><?php echo $resultado[$i]["primer_nombre"]?></td>
                    <td class="limitado2"><?php echo $resultado[$i]["segundo_nombre"]?></td>
                    <td class="limitado2"><?php echo $resultado[$i]["primer_apellido"]?></td>
                    <td class="limitado2"><?php echo $resultado[$i]["segundo_apellido"]?></td>
                    <td class="no_style">
                        <button onclick='Eliminar(`<?php echo $resultado[$i]["cedula"]; ?>`)' class='table_button'>Eliminar</button>
                        <button onclick='Modificar(`<?php echo $resultado[$i]["cedula"]; ?>`,`<?php echo $resultado[$i]["primer_nombre"];?>`,`<?php echo $resultado[$i]["segundo_nombre"];?>`,`<?php echo $resultado[$i]["primer_apellido"];?>`,`<?php echo $resultado[$i]["segundo_apellido"];?>`)' class='table_button'>Modificar</button>
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
            <form id="form" style="display: none;" name="pantalla" class='pantalla' method="POST" action="../../Control/profesor.php">
                <br>

                <label for="cedula">Cedula: </label><br>
                <input type="text" id="cedula" name="cedula" placeholder="Cedula del Profesor" class="formulario__input" maxlength="25"> 
    
                <br><br>

                <label for="primer_nombre">Primer Nombre: </label><br>
                <input type="input" name="primer_nombre" id="primer_nombre" placeholder= "Primer Nombre" class="formulario__input" maxlength="30">

                <br><br>

                <label for="segundo_nombre">Segundo Nombre: </label><br>
                <input type="input" name="segundo_nombre" id="segundo_nombre" placeholder="Segundo Nombre" class="formulario__input" maxlength="30">

                <br><br>
                <label for="primer_apellido">Primer Apellido: </label><br>
                <input type="input" name="primer_apellido" id="primer_apellido" class="formulario__input" placeholder="Primer Apellido" maxlength="30">

                <br><br>

                <label for="segundo_apellido">Segundo Apellido: </label><br>
                <input type="input" name="segundo_apellido" id="segundo_apellido" placeholder="Segundo Apellido" class="formulario__input" maxlength="30">

                <br><br>

                <input type="hidden" name="ope" id='ope'>
                <input type="hidden" name="origin" id='origin'>
                <input type="button" id="btn3" onclick="Enviar(this.value)" value="Incluir" class="table_button">
                <input type="button" id="btn2" onclick="Mostrar()" value="Cerrar" class="table_button">
            </form>
        </div>
    </div>

</body>


</html>