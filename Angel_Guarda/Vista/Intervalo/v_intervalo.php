<?php
session_start();
include_once("../../control/c_intervalo.php");
if ($_SESSION["sesion"]!="admin") {
    header("Location: ../../../index.php");
}
$title='Intervalo de Clase';
include_once('../v_Sidebar/v_Sidebar.php');
?>


<script type="text/javascript" src="../../../javascript/horario/mostrarModal.js"></script>
<script type="text/javascript" src="../../../javascript/horario/intervalo.js"></script>

<div class="main-content">
<div class="flex flex-row justify-end items-center md:space-x-2 p-4 md:py-2">
    <h1 class="text-xl font-semibold mb-2 md:mb-0">Intervalos Entre Horarios</h1>

   
   

        <!-- Este DIV es para ocultar la tabla -->
        <div class="boton2" style="display: none;" id="boton2"></div>
        <div class="  bg-gray-100 rounded-full ">
            <img src="../../../images/icons/añadir.svg" class="w-10 filtro-verde" alt="Añadir" id="boton1" onclick="Mostrar()">
        </div>
     
       
       
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

                <div class=" flex justify-center">
                    <img src="../../../images/icons/papelera.svg"  class="w-10  mr-10 filtro-rojo" alt="Borrar" title="Borrar" id="boton1" 
                    onclick='Eliminar(`<?php echo $fila["intervalo"]; ?>`)' >
                    <img src="../../../images/icons/modificar.svg"  class="w-10  mr-10  filtro-azul " alt="Borrar" title="Modificar" id="boton1"
                    onclick='Modificar(`<?php echo $fila["intervalo"]; ?>`,`<?php echo $fila["estado"]; ?>`)'  >
            
                     <!-- 
                    
                      if ($resultado[$i]["disponibilidad"]==1) {

                        echo"";
                        echo '<img src="../../../images/icons/check.svg" class="w-10 mr-10  filtro-verde" alt="Borrar" title="Desactivar" id="boton1" onclick="Disponibilidad(\'Desactivar\', \'' . $resultado[$i]["nombre"] . '\')">';


                     
                    }
                    else {
                        
                        echo '<img src="../../../images/icons/checkbox.svg" class="w-10 mr-10 filtro-gris" alt="Borrar" title="Activar" id="boton1" onclick="Disponibilidad(\'Activar\', \'' . $resultado[$i]["nombre"] . '\')">';
                    } -->
                        <?php if ($fila["estado"] == 1) { ?>
                           
                            <img src="../../../images/icons/check.svg" class="w-10 mr-10  filtro-verde" alt="Borrar" title="Desactivar" id="boton1"  onclick='Disponibilidad(`Desactivar`,`<?php echo $fila["id"]; ?>`)'>
                        <?php } else { ?>
                            <img src="../../../images/icons/checkbox.svg" class="w-10 mr-10 filtro-gris" alt="Borrar" title="Activar" id="boton1" onclick='Disponibilidad(`Activar`,`<?php echo $fila["id"]; ?>`)'>
                        <?php } ?>
                    </td>
                    </div>
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
 
        <form id="form" style="display: none;"class="formulario" name="pantalla"  method="POST" action="../../Control/c_intervalo.php">

        <div class=" flex justify-end ">
                <div class="  bg-red-500  w-10  rounded-full ">
                    <img src="../../../images/icons/error.svg" class=" filtro-blanco" alt="Añadir" title="Cerrar" id="boton1" onclick="Mostrar()">
                </div>
            </div>
            <label for="nom">Tiempo de Intervalo: </label>
            <input type="text" id="nom" name="nom" maxlength="3" placeholder="Intervalo de tiempo para el Horario" class="formulario__input"> 
            <input type="hidden" name="ope" id='ope'>
            <input type="hidden" name="origin" id='origin'>
            <input type="button" id="btn3" onclick="Enviar(this.value)" value="Incluir" class="table_button w-full">
           
        </form>
 
</div>
</body>
</html>
