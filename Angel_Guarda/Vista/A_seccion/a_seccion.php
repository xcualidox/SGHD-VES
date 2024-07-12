<?php
session_start();
include_once("../../control/a_seccion_tabla.php");
if ($_SESSION["sesion"]!="admin") {
    header("Location: ../../../index.php");
}
$title='Año y Seccion';
include_once('../v_Sidebar/v_Sidebar.php');
?>





    <script type="text/javascript" src="../Js/a_seccion.js"></script>

    <div class="main-content">
      
    <div class="flex flex-row  justify-end items-center md:space-x-2 p-4 md:p-0">
        <h1 class="text-xl font-semibold mb-2 md:mb-0">Año y Sección</h1>

        <!-- Este DIV es para ocultar la tabla -->
        <div class="boton2" style="display: none;" id="boton2"></div>
        <img src="../../../images/icons/añadir.svg" class="w-10 bg-green-500 hover:bg-green-400  rounded-full cursor-pointer" alt="Añadir" id="boton1" onclick="Mostrar()">
        <input type="text" id="listar" name="listar" placeholder="Buscar..." class="border rounded px-2 py-1 mb-2 md:mb-0">
        <select name="selectListar" id="selectListar" class="border rounded px-2 py-1 w-auto">
            <option value="">Todos</option>
            <option value="1">DatoxD</option>
            <option value="0">Prueba</option>
        </select>
       
    </div>

    <div class="table-wrapper min-w-full">

       
        <div class="fl-table"> 
            <table class="fl-table">
                <thead>
    				<td >Año</td>
    				<td >Seccion</td>
                    <td class=''> <a href="a_seccion_pdf.php"><button class='table_button' style='margin-left:20px;'>PDF</button></a></td>
    			</thead>
                <tbody>

                <?php
                // Determina la página actual
                if (!isset($_GET["pag_asig"])) {
                    $paginaActual = 1; // Página predeterminada es la primera
                } else {
                    $paginaActual = $_GET["pag_asig"]; // Página actual obtenida de la URL
                }

                $limit = $paginaActual * 5; // Límite de registros por página
                $offset = $limit - 5; // Offset para la consulta SQL
                $objeto = new query();
                $resultado = $objeto->GenerarTabla($offset, $limit); // Obtener los registros de la página actual
                $numFilas = $objeto->TotalPaginas(); // Obtener el número total de registros

                // Iterar sobre los resultados y mostrarlos en la tabla
                for ($i = 0; $i < count($resultado); $i++) {
                ?>

                <tr>
    			    <td class="border px-4 py-2"><?php echo $resultado[$i]["ano"]?></td>
    			    <td class="border px-4 py-2"><?php echo $resultado[$i]["seccion"]?></td>
                    <td class="">
                        <button onclick='Eliminar(`<?php echo $resultado[$i]["ano"]; ?>`,`<?php echo $resultado[$i]["seccion"];?>`)' class='table_button'>Eliminar</button>
                        <button onclick='Modificar(`<?php echo $resultado[$i]["ano"]; ?>`,`<?php echo $resultado[$i]["seccion"];?>`)' class='table_button'>Modificar</button>
                    </td>
                    </tr>
                <?php } ?>
            </tbody>
        </table>
                
        <?php
        // Calcular el total de páginas
        $totalpag = ceil($numFilas / 5);
        echo "<div class='paginacion'>";

        // Si el total de páginas es menor o igual a 10, mostrar todas las páginas
        if ($totalpag <= 10) {
            for ($i = 1; $i < $totalpag + 1; $i++) {
                if ($paginaActual == $i) {
                    echo "<a href=?pag_asig=" . $i . " class='seleccionado'>" . $i . "</a>";
                } else {
                    echo "<a href=?pag_asig=" . $i . ">" . $i . "</a>";
                }
            }
        } else {
            // Mostrar un rango de páginas alrededor de la página actual
            for ($i = $paginaActual - 4; $i < $paginaActual + 7; $i++) {
                if ($i <= 0) {
                    $i = 1; // Asegurarse de no mostrar números negativos o cero
                }
                if ($i > $totalpag) {
                    break; // Romper el bucle si el índice supera el total de páginas
                }
                if ($paginaActual == $i) {
                    echo "<a href=?pag_asig=" . $i . " class='seleccionado'>" . $i . "</a>";
                } else {
                    echo "<a href=?pag_asig=" . $i . ">" . $i . "</a>";
                }
            }
            if ($paginaActual + 7 < $totalpag) {
                echo "...";
            }
        }
        echo "</div>";
        ?>
         </div>
    </div>

      

        <div class="formulario">
            <br>

            <form id="form" style="display: none;" name="pantalla" class='pantalla' method="POST" action="../../Control/a_seccion.php">
                <br>

                <label for="a">Año: </label><br>
                <select name="a" id="a" class="">
                    <option value="" hidden selected>Año del salon</option>
                    <option value="1ero">1er Año</option>
                    <option value="2do">2do Año</option>
                    <option value="3ero">3er Año</option>
                    <option value="4to">4to Año</option>
                    <option value="5to">5to Año</option>
                </select>
    
            

                <label for="sec">Seccion: </label><br>
                <select name="sec" id="sec" class="t">
                    <option value="" hidden selected>Seccion del salon</option>
                    <option value="A">A</option>
                    <option value="B">B</option>
                    <option value="C">C</option>
                    <option value="D">D</option>
                    </select>

             

                <input type="hidden" name="ope" id='ope'>
                <input type="hidden" name="origin" id='origin'>
                <input type="hidden" name="origin2" id='origin2'>
                <input type="button" id="btn3" onclick="Enviar(this.value)" value="Incluir" class="table_button">
                <input type="button" id="btn2" onclick="Mostrar()" value="Cerrar" class="table_button">
            </form>
        </div>
    </div>
</body>
</html>