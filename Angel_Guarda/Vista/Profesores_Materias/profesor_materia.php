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
        <?php
            include_once("../v_Buscar/v_BuscarHeader.php");
        ?>

    <div class="table-wrapper min-w-full">
        <table class="fl-table">
            <thead>
                <tr>
                    <td>Cedula</td>
                    <td>Nombre y Apellido</td>
                    <td class='no_style'>  
                        <!-- No tiene Reporte el Pemsun -->
                    <!-- <div class="flex justify-center ">
                        
                        <a href="profesor.pdf.php">
                            <img src="../../../images/icons/pdf.svg" class="w-10  filtro-blanco "  alt="Reporte" title="Reporte" id="boton1" >
                        </a>
              
                    </div> -->
                </td>
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

                                 <div class=" flex justify-center">
                    <img src="../../../images/icons/papelera.svg"  class="w-10  mr-10 filtro-rojo" alt="Borrar" title="Borrar" id="boton1" onclick='Eliminar(`<?php echo $row["cedula"]; ?>`)'  >
                    <img src="../../../images/icons/modificar.svg"  class="w-10  filtro-azul " alt="Borrar" title="Modificar" id="boton1" onclick='enviarRequest(`<?php echo $row["cedula"] . "`,`" . $row["primer_nombre"] . "`,`" . $row["segundo_nombre"] . "`,`" . $row["primer_apellido"] . "`,`" . $row["segundo_apellido"]; ?>`)'  >
                </div>
             
                               
                           
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
  
        <form id="form" style="display: none;" name="pantalla" class='formulario' method="POST" action="../../Control/profesor_materia.php">
        <div class=" flex justify-end ">
                <div class="  bg-red-500  w-10  rounded-full ">
                    <img src="../../../images/icons/error.svg" class=" filtro-blanco" alt="Añadir" title="Cerrar" id="boton1" onclick="Mostrar()">
                </div>
            </div>
        
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

            <button type="button" id="btn3" onclick="Enviar()" class="table_button w-full">Guardar</button>
          
        </form>
   
</div>
<script type="text/javascript" src="../../../javascript/horario/mostrarModal.js"></script>
<script type="text/javascript" src="../../../javascript/horario/profesor_materia.js"></script>
</body>
</html>
