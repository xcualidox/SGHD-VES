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
    <?php
    include_once("../v_Buscar/v_BuscarHeader.php");
    ?>

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
            include_once("../v_paginado/v_paginadoConsulta.php");
            //Variable de la Consulta del Paginado
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
        <!-- Mostrando El total de Paginas -->
        <?php 
        include_once("../v_paginado/v_PaginadoTotal.php");
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
