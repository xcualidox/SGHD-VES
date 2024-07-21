<?php
session_start();
include_once("../../control/intervalo_tabla.php");
if ($_SESSION["sesion"]!="admin") {
    header("Location: ../../../index.php");
}
$title='Intervalo de Clase';
include_once('../v_Sidebar/v_Sidebar.php');
?>


<script type="text/javascript" src="../../../javascript/horario/intervalo.js"></script>

<div class="main-content">
<div class="flex flex-row justify-end items-center md:space-x-2 p-4 md:p-0">
<h1 class="text-xl font-semibold mb-2 md:mb-0">Intervalos Entre Horarios</h1>

   
   

        <!-- Este DIV es para ocultar la tabla -->
        <div class="boton2" style="display: none;" id="boton2"></div>
        <img src="../../../images/icons/añadir.svg" class="w-10 bg-green-500 hover:bg-green-400  rounded-full cursor-pointer" alt="Añadir" id="boton1" onclick="Mostrar()">
     
       
       
    </div>
  
    <div class="table-wrapper min-w-full">
        <table class="fl-table">
        <thead>
                <tr>
                    <td>Intervalo</td>
                    <td></td>
                </tr>
              
            </thead>
            <tbody>
            <?php
                include_once("../v_paginado/v_paginadoConsulta.php");
                //Variable de la Consulta del Paginado
             
             
            foreach ($resultado as $fila) {
            ?>
                <tr>
                    <td><?php echo $fila["intervalo"]; ?> Minutos</td>
                    <td>
                        <button onclick='Eliminar(`<?php echo $fila["intervalo"]; ?>`)' class='table_button'>Eliminar</button>
                        <button onclick='Modificar(`<?php echo $fila["intervalo"]; ?>`,`<?php echo $fila["estado"]; ?>`)' class='table_button'>Modificar</button>
                        <?php if ($fila["estado"] == 1) { ?>
                            <button type='button' class='desactivar' onclick='Disponibilidad(`Desactivar`,`<?php echo $fila["id"]; ?>`)'>Desactivar</button>
                        <?php } else { ?>
                            <button type='button' class='activar' onclick='Disponibilidad(`Activar`,`<?php echo $fila["id"]; ?>`)'>Activar</button>
                        <?php } ?>
                    </td>
                </tr>
            <?php
            }
            ?>
            </tbody>
        </table>
    </div>
   <!-- Mostrando El total de Paginas -->
   <?php 
        include_once("../v_paginado/v_PaginadoTotal.php");
         ?>
   
    <div class="boton2" style="display: none;" id="boton2"></div>
    <div class="formulario">
        <form id="form" style="display: none;" name="pantalla" class='pantalla' method="POST" action="../../Control/intervalo.php">
            <label for="nom">Tiempo de Intervalo: </label><br>
            <input type="text" id="nom" name="nom" maxlength="3" placeholder="Intervalo de tiempo para el Horario" class="formulario__input"> 
            <input type="hidden" name="ope" id='ope'>
            <input type="hidden" name="origin" id='origin'>
            <input type="button" id="btn3" onclick="Enviar(this.value)" value="Incluir" class="table_button">
            <input type="button" id="btn2" onclick="Mostrar()" value="Cerrar" class="table_button">
        </form>
    </div>
</div>
</body>
</html>
