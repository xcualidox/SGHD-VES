<?php
session_start();
include_once("../../../libraries/vendor/autoload.php");
include_once("../../Control/c_profesor.php");

if ($_SESSION["sesion"] == "admin" || $_SESSION["sesion"] == "administrador") {
} else {
    header("Location: ../../../index.php");
}

$title = 'Profesor';
include_once('../v_Sidebar/v_Sidebar.php');
?>
<!--Aqui se el css se toma del Padre que es Sidebar-->
<script type="text/javascript" src="../../../javascript/horario/mostrarModal.js"></script>
<script type="text/javascript" src="../../../javascript/horario/profesor.js"></script>




<div class="main-content">
<div class="flex flex-col sm:flex-row justify-end items-center md:space-x-2 p-4 md:py-2">
    <h1 class="text-xl font-semibold mb-2 md:mb-0"><?php echo $title; ?></h1>

    <!-- Botón para añadir -->
    <div class="bg-gray-100 rounded-full">
        <img src="../../../images/icons/añadir.svg" class="w-10 filtro-verde" alt="Añadir" title="Añadir" id="boton1" onclick="Mostrar()">
    </div>

    <!-- Formulario de búsqueda -->
    <form method="GET" action="" class="flex items-center space-x-2">
        <select name="campo" class='capitalize border-solid border-2  border-black' id="selectListar" class="border rounded px-2 py-1 w-auto">
            <?php
                foreach ($soloNombresColumnas as $nombreColumna) {
                    echo "<option class='capitalize' value='{$nombreColumna}'" . ($campo == $nombreColumna ? " selected" : "") . ">{$nombreColumna}</option>";
                }
            ?>
        </select>

        <input type="text" id="listar" name="listar" placeholder="Buscar..." class="border rounded px-2 py-1 mb-2 md:mb-0" value="<?php echo htmlspecialchars($buscar ?? ''); ?>">

        <button type="submit" class="bg-gray-100 rounded-full">
            <img src="../../../images/icons/buscar.svg" class=" w-20 filtro-verde" alt="Buscar" title="Buscar">
        </button>
    </form>

    <!-- Botón para limpiar los filtros -->
    <form method="GET" action="" class="ml-4">

    <button type="submit" class="bg-gray-100 rounded-full">
            <img src="../../../images/icons/reload.svg" class="   w-6 filtro-verde" alt="Buscar" title="Buscar">
        </button>
    </form>
</div>



    <div class="table-wrapper min-w-full">
        <table class="fl-table">
            <thead>
                <tr>
                    <td>Cedula</td>
                    <td>Nombres</td>
                    <td>Apellidos</td>
                    <td>Direccion</td>
                    <td>Telefono</td>
                    <td>Correo</td>
                    <td class='no_style'>
                        <div class="flex justify-center ">

                            <a href="profesorPDF.php">
                                <img src="../../../images/icons/pdf.svg" class="w-10  filtro-blanco " alt="Reporte" title="Reporte" id="boton1">
                            </a>

                        </div>
                    </td>
                </tr>
            </thead>
            <tbody>

            <tbody>
                <?php foreach ($tablaDatos as $fila) { ?>
                    <tr>
                        <td class="border px-4 py-2"><?php echo $fila['cedula']; ?></td>
                        <td class="border px-4 py-2"><?php echo $fila['nombres']; ?></td>
                        <td class="border px-4 py-2"><?php echo $fila['apellidos']; ?></td>
                        <td class="border px-4 py-2"><?php echo $fila['direccion']; ?></td>
                        <td class="border px-4 py-2"><?php echo $fila['telefono']; ?></td>
                        <td class="border px-4 py-2"><?php echo $fila['correo']; ?></td>
                        <td class="border px-4 py-2 text-center">
                            <div class="flex justify-center items-center space-x-4">
                                <img src="../../../images/icons/papelera.svg" class="w-8 h-8 filtro-rojo cursor-pointer" alt="Borrar" title="Borrar" id="boton1" onclick='Eliminar(`<?php echo $fila["cedula"]; ?>`)'>
                                <img src="../../../images/icons/modificar.svg" class="w-8 h-8 filtro-azul cursor-pointer" alt="Modificar" title="Modificar" id="boton2" onclick='Modificar(`<?php echo $fila["cedula"]; ?>`, `<?php echo $fila["nombres"]; ?>`, `<?php echo $fila["apellidos"]; ?>`, `<?php echo $fila["direccion"]; ?>`, `<?php echo $fila["telefono"]; ?>`, `<?php echo $fila["correo"]; ?>`)'>
                            </div>
                        </td>
                    </tr>
                <?php } ?>
            </tbody>
            </tbody>
        </table>
        <!-- Mostrando El total de Paginas -->
        <?php
        echo $paginacionHTML;
        ?>
    </div>






    <form id="form" style="display: none;" class="formulario-extenso" name="pantalla" method="POST" action="../../Control/c_profesor.php">
        <div class="flex justify-end">
            <div class="bg-red-500 w-10 rounded-full">
                <img src="../../../images/icons/error.svg" class="filtro-blanco" alt="Cerrar" title="Cerrar" id="boton1" onclick="Mostrar()">
            </div>
        </div>

        <div class="formulario-extenso__row">
            <div class="formulario-extenso__column">
                <label for="cedula">Cedula: </label>
                <input type="text" id="cedula" name="cedula" placeholder="Cedula del Profesor" class="formulario-extenso__input" maxlength="25">
            </div>

        </div>

        <div class="formulario-extenso__row">

            <div class="formulario-extenso__column">
                <label for="nombres">Nombres: </label>
                <input type="input" name="nombres" id="nombres" placeholder="Nombres" class="formulario-extenso__input" maxlength="30">
            </div>
            <div class="formulario-extenso__column">
                <label for="apellidos">Apellidos: </label>
                <input type="input" name="apellidos" id="apellidos" class="formulario-extenso__input" placeholder="Apellidos" maxlength="30">
            </div>
        </div>

        <div class="formulario-extenso__row">

            <div class="formulario-extenso__column">
                <label for="direccion">Dirección: </label>
                <input type="input" name="direccion" id="direccion" placeholder="Direccion" class="formulario-extenso__input" maxlength="150">
            </div>
        </div>

        <div class="formulario-extenso__row">
            <div class="formulario-extenso__column">
                <label for="telefono">Telefono: </label>
                <input type="input" name="telefono" id="telefono" placeholder="Telefono" class="formulario-extenso__input" maxlength="14">
            </div>
            <div class="formulario-extenso__column">
                <label for="correo">Correo: </label>
                <input type="input" name="correo" id="correo" placeholder="Correo" class="formulario-extenso__input" maxlength="255">
            </div>
        </div>
        <div class="formulario-extenso__row">
            <div class="formulario-extenso__column">
                <label for="profesorRol">Rol: </label>
                <select name="rol" id="profesorRol">

                    <option value="coordinador">Coordinador</option>
                    <option value="administrador">Administrador</option>
                    <option value="profesor" selected>Profesor</option>
                </select>
            </div>
        </div>

        <input type="hidden" name="ope" id='ope'>
        <input type="hidden" name="origin" id='origin'>
        <input type="button" id="btn3" onclick="Enviar(this.value)" value="Incluir" class="table_button w-full">
    </form>



</div>

</body>

</html>