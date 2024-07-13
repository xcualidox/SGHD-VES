<?php
session_start();
include_once("../../control/profesor_tabla.php");
if ($_SESSION["sesion"] != "admin") {
    header("Location: ../../../index.php");
}

$title = 'Profesor';
include_once('../v_Sidebar/v_Sidebar.php');
?>
<!--Aqui se el css se toma del Padre que es Sidebar-->
<script type="text/javascript" src="../../../javascript/horario/profesor.js"></script>

<div class="main-content">
    <div class="flex flex-row justify-end items-center md:space-x-2 p-4 md:p-0">
        <h1 class="text-xl font-semibold mb-2 md:mb-0">Profesores</h1>

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
        <table class="fl-table">
            <thead>
                <tr>
                    <td>Cedula</td>
                    <td>Primer Nombre</td>
                    <td >Segundo Nombre</td>
                    <td>Primer Apellido</td>
                    <td >Segundo Apellido</td>
                    <td class='no_style'><a href="profesor_pdf.php"><button class='table_button'>PDF</button></a></td>
                </tr>
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
                    <td class="border px-4 py-2"><?php echo $resultado[$i]["cedula"] ?></td>
                    <td class="border px-4 py-2"><?php echo $resultado[$i]["primer_nombre"] ?></td>
                    <td class="border px-4 py-2"><?php echo $resultado[$i]["segundo_nombre"] ?></td>
                    <td class="border px-4 py-2"><?php echo $resultado[$i]["primer_apellido"] ?></td>
                    <td class="border px-4 py-2"><?php echo $resultado[$i]["segundo_apellido"] ?></td>
                    <td class="border px-4 py-2 text-center">
                        <button onclick='Eliminar(`<?php echo $resultado[$i]["cedula"]; ?>`)' class='table_button'>Eliminar</button>
                        <button onclick='Modificar(`<?php echo $resultado[$i]["cedula"]; ?>`,`<?php echo $resultado[$i]["primer_nombre"]; ?>`,`<?php echo $resultado[$i]["segundo_nombre"]; ?>`,`<?php echo $resultado[$i]["primer_apellido"]; ?>`,`<?php echo $resultado[$i]["segundo_apellido"]; ?>`)' class='table_button'>Modificar</button>
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

   
   

    <div class="formulario">
        <form id="form" style="display: none;" name="pantalla" class='pantalla' method="POST" action="../../Control/profesor.php">
            <br>

            <label for="cedula">Cedula: </label><br>
            <input type="text" id="cedula" name="cedula" placeholder="Cedula del Profesor" class="formulario__input" maxlength="25">
            <br><br>

            <label for="primer_nombre">Primer Nombre: </label><br>
            <input type="input" name="primer_nombre" id="primer_nombre" placeholder="Primer Nombre" class="formulario__input" maxlength="30">
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
