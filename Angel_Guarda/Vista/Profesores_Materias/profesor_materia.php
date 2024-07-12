<?php
session_start();
include_once("../../control/profesor_materia_tabla.php");
if ($_SESSION["sesion"]!="admin") {
    header("Location: ../../../index.php");
}

$title = 'PEMSUN';
include_once('../v_Sidebar/v_Sidebar.php');
?>

<!--Aqui se el css se toma del Padre que es Sidebar-->



    <div class="main-content">
        <div class="container">
            <h1>Clases Dadas por Profesores</h1>
        </div>

        <div class="tabla"> 
            <table>
                <thead>
    				<td align="center">Cedula</td>
    				<td align="center">Nombre y Apellido</td>
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
                $asignaturas=$objeto->ListAsignaturas();
                $profesores=$objeto->ProfesoresMaterias();
                // print_r($profesores);
                // var_dump(count($resultado));
                for ($i=0; $i < count($resultado); $i++) { 
                ?>
            
                <tr>
    			    <td class="limitado1"><?php echo $resultado[$i]["cedula"]?></td>
    			    <td class="limitado2"><?php echo $resultado[$i]["primer_nombre"]." ".$resultado[$i]["primer_apellido"]?></td>
                    <td class="no_style">
                        <button onclick='Eliminar(`<?php echo $resultado[$i]["cedula"]; ?>`)' class='table_button'>Eliminar</button>
                        <button onclick='enviarRequest(`<?php echo $resultado[$i]["cedula"]."`,`".$resultado[$i]["primer_nombre"]."`,`".$resultado[$i]["segundo_nombre"]."`,`".$resultado[$i]["primer_apellido"]."`,`".$resultado[$i]["segundo_apellido"]; ?>`)' class='table_button'>Modificar</button>
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
            <form id="form" style="display: none;" name="pantalla" class='pantalla' method="POST" action="../../Control/profesor_materia.php">
                <input type='text' id="add" name="add" hidden>
                <input type='text' id="origin" name="origin" hidden>
                <br>
                
                <label for="">Profesor:</label>
                <input type="text" id='datos' style='display:none;' class="formulario__input" disabled>
                <select name="profesor" id="profesor">
                    <option value="">Selecione el profesor</option>
                    <?php
                    if($profesores)
                    {

                        for ($i=0; $i < count($profesores); $i++) { 
                            echo "<option value='".$profesores[$i]["cedula"]."'>".$profesores[$i]["primer_nombre"]." ".$profesores[$i]["segundo_nombre"]." ".$profesores[$i]["primer_apellido"]." ".$profesores[$i]["segundo_apellido"]."</option>";
                         }
                    } 
                    ?>
                </select>
    
                <br><br>

                <label for="fecI">Materias</label><br>
                <div class='materias_container'>
                    <?php 
                    for ($i=0; $i < count($asignaturas); $i++) { 
                        echo "<span id='".$asignaturas[$i]["codigo"]."' class='lista'>".$asignaturas[$i]["nombre"]."</span>";
                    }
                    ?>
                </div>
                <button type='button' style='cursor:pointer;text-align:center;' onclick="Add()">Añadir</button>
                <br><br>

                <label for="fecF">Materias Añadidas: </label><br>
               <div class='materias_container'>

               </div>
               <button type='button' style='cursor:pointer;text-align:center;' onclick="Del()">Quitar</button>
                <br><br>

                <button type="button" id="btn3" onclick="Enviar()" class="table_button">Incluir</button>
                <input type="button" id="btn2" onclick="Mostrar()" value="Cerrar" class="table_button">
            </form>
        </div>
    </div>

</body>


<script type="text/javascript" src="../../../javascript/horario/profesor_materia.js"></script>

</html>