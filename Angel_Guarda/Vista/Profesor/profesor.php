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
<script type="text/javascript" src="../../../javascript/horario/mostrarModal.js"></script>
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
                    <td class='no_style'>   
                        <div class="flex justify-center ">
                        
                            <a href="profesor.pdf.php">
                                <img src="../../../images/icons/pdf.svg" class="w-10  filtro-blanco "  alt="Reporte" title="Reporte" id="boton1" >
                            </a>
                  
                        </div>
                </td>
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

            <div class=" flex justify-center">
                    <img src="../../../images/icons/papelera.svg"  class="w-10  mr-10 filtro-rojo" alt="Borrar" title="Borrar" id="boton1" onclick='Eliminar(`<?php echo $resultado[$i]["cedula"]; ?>`)' >
                    <img src="../../../images/icons/modificar.svg"  class="w-10  filtro-azul " alt="Borrar" title="Modificar" id="boton1"onclick='Modificar(`<?php echo $resultado[$i]["cedula"]; ?>`,`<?php echo $resultado[$i]["primer_nombre"]; ?>`,`<?php echo $resultado[$i]["segundo_nombre"]; ?>`,`<?php echo $resultado[$i]["primer_apellido"]; ?>`,`<?php echo $resultado[$i]["segundo_apellido"]; ?>`)' >
                </div>
             
              
            
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


   
   

         
        <form id="form" style="display: none;" class="formulario" name="pantalla" class='pantalla' method="POST" action="../../Control/profesor.php">
        <div class=" flex justify-end ">
                <div class="  bg-red-500  w-10  rounded-full ">
                    <img src="../../../images/icons/error.svg" class=" filtro-blanco" alt="Añadir" title="Cerrar" id="boton1" onclick="Mostrar()">
                </div>
            </div>

            <label for="cedula">Cedula: </label>
            <input type="text" id="cedula" name="cedula" placeholder="Cedula del Profesor" class="formulario__input" maxlength="25">
            <br>

            <label for="primer_nombre">Primer Nombre: </label>
            <input type="input" name="primer_nombre" id="primer_nombre" placeholder="Primer Nombre" class="formulario__input" maxlength="30">
            <br><br>

            <label for="segundo_nombre">Segundo Nombre: </label>
            <input type="input" name="segundo_nombre" id="segundo_nombre" placeholder="Segundo Nombre" class="formulario__input" maxlength="30">
            <br><br>
            <label for="primer_apellido">Primer Apellido: </label>
            <input type="input" name="primer_apellido" id="primer_apellido" class="formulario__input" placeholder="Primer Apellido" maxlength="30">
            <br><br>

            <label for="segundo_apellido">Segundo Apellido: </label>
            <input type="input" name="segundo_apellido" id="segundo_apellido" placeholder="Segundo Apellido" class="formulario__input" maxlength="30">
            <br><br>

            <input type="hidden" name="ope" id='ope'>
            <input type="hidden" name="origin" id='origin'>
            <input type="button" id="btn3" onclick="Enviar(this.value)" value="Incluir" class="table_button w-full">
          
        </form>
 
</div>

</body>
</html>
