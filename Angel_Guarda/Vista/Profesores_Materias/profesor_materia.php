<?php
session_start();
include_once("../../control/profesor_materia_tabla.php");
if ($_SESSION["sesion"] != "admin") {
    header("Location: ../../../index.php");
}

$title = 'PEMSUN';
include_once('../v_Sidebar/v_Sidebar.php');
?>

<!--Aqui se el css se toma del Padre que es Sidebar-->

<div class="main-content">
    <div class="flex flex-row justify-end items-center md:space-x-2 p-4 md:p-0">
        <h1 class="text-xl font-semibold mb-2 md:mb-0">Asignar Materias</h1>

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
                    <td>Nombre y Apellido</td>
                    <td class='no_style'><a href="profesor_pdf.php"><button class='table_button'>PDF</button></a></td>
                </tr>
            </thead>
            <tbody>
                <?php


                include_once("../v_paginado/v_paginadoConsulta.php");
                $asignaturas = $objeto->ListAsignaturas();
                $profesores = $objeto->ProfesoresMaterias();

             
                if (is_array($resultado) && count($resultado) > 0) {
                    foreach ($resultado as $row) {
               
                ?>
                        <tr>
                            <td class="border px-4 py-2"><?php echo $row["cedula"]; ?></td>
                            <td class="border px-4 py-2"><?php echo $row["primer_nombre"] . " " . $row["primer_apellido"]; ?></td>
                          
                    
                            <td>
                                <button onclick='Eliminar(`<?php echo $row["cedula"]; ?>`)' class='table_button'>Eliminar</button>
                                <button onclick='enviarRequest(`<?php echo $row["cedula"] . "`,`" . $row["primer_nombre"] . "`,`" . $row["segundo_nombre"] . "`,`" . $row["primer_apellido"] . "`,`" . $row["segundo_apellido"]; ?>`)' class='table_button'>Modificar</button>
                            </td>
                        </tr>
                <?php
                    }
                } 
                ?>
            </tbody>
        </table>

         <!-- Mostrando El total de Paginas -->
         <?php 
        include_once("../v_paginado/v_PaginadoTotal.php");
         ?>
    </div>
    <br>



    <div class="boton2" style="display: none;" id="boton2"></div>
    <!-- <script type="text/javascript" src="../Js/profesor_materia.js"></script> -->
    <div class="formulario">
        <form id="form" style="display: none;" name="pantalla" class='pantalla' method="POST" action="../../Control/profesor_materia.php">
            <input type='text' id="add" name="add" hidden>
            <input type='text' id="origin" name="origin" hidden>
            <br>

            <label for="">Profesor:</label>
            <input type="text" id='datos' style='display:none;' class="formulario__input" disabled>
            <select name="profesor" id="profesor">
                <option value="">Seleccione el profesor</option>
                <?php
                if ($profesores) {
                    foreach ($profesores as $profesor) {
                        echo "<option value='" . $profesor["cedula"] . "'>" . $profesor["primer_nombre"] . " " . $profesor["segundo_nombre"] . " " . $profesor["primer_apellido"] . " " . $profesor["segundo_apellido"] . "</option>";
                    }
                }
                ?>
            </select>

            <br><br>

            <label for="fecI">Materias</label><br>
            <div class='materias_container'>
                <?php
                if ($asignaturas) {
                    foreach ($asignaturas as $asignatura) {
                        echo "<span id='" . $asignatura["codigo"] . "' class='lista'>" . $asignatura["nombre"] . "</span>";
                    }
                }
                ?>
            </div>
            <button type='button' style='cursor:pointer;text-align:center;' onclick="Add()">Añadir</button>
            <br><br>

            <label for="fecF">Materias Añadidas: </label><br>
            <div class='materias_container'></div>
            <button type='button' style='cursor:pointer;text-align:center;' onclick="Del()">Quitar</button>
            <br><br>

            <button type="button" id="btn3" onclick="Enviar()" class="table_button">Incluir</button>
            <input type="button" id="btn2" onclick="Mostrar()" value="Cerrar" class="table_button">
        </form>
    </div>
</div>

<script type="text/javascript" src="../../../javascript/horario/profesor_materia.js"></script>
</body>
</html>
