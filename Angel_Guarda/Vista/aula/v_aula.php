<?php
session_start();
include_once("../../control/c_aula.php");
if ($_SESSION["sesion"] == "admin" || $_SESSION["sesion"] == "administrador") {
}
 else {
    header("Location: ../../../index.php");
}
$title="Aulas";
include_once('../v_Sidebar/v_Sidebar.php')
?>


<script type="text/javascript" src="../../../javascript/horario/mostrarModal.js"></script>

    <div class="main-content">
    <?php
    include_once("../v_Buscar/v_BuscarHeader.php");
    ?>
    <div class="table-wrapper min-w-full">
    <table class="fl-table">
            <thead>
    			<td align="center">Nombre</td>
    			<td align="center">Descripcion</td>
                <td class='no_style'>
                <div class="flex justify-center ">
                        
                        <a href="aulaPDF.php">
                            <img src="../../../images/icons/pdf.svg" class="w-10  filtro-blanco "  alt="Reporte" title="Reporte" id="boton1" >
                        </a>
                  
                    </div>
                </td>
    		</thead>

           
            <tbody>
            <?php
            include_once("../v_paginado/v_paginadoConsulta.php");
            //Variable de la Consulta del Paginado
            for ($i = 0; $i < count($resultado); $i++) {
            ?>

            <tr>
    			<td class="border px-4 py-2"><?php echo $resultado[$i]["nombre"]?></td>
                <td class="border px-4 py-2"><?php echo $resultado[$i]["descripcion"]?></td>
                <td class="">

                <div class=" flex justify-center">
                    <img src="../../../images/icons/papelera.svg"  class="w-10  mr-10 filtro-rojo" alt="Borrar" title="Borrar" id="boton1" onclick='Eliminar(`<?php echo $resultado[$i]["nombre"]; ?>`)'>
                    <img src="../../../images/icons/modificar.svg"  class="w-10 mr-10  filtro-azul " alt="Borrar" title="Modificar" id="boton1"onclick='Modificar(`<?php echo $resultado[$i]["nombre"]; ?>`,`<?php echo $resultado[$i]["descripcion"];?>`)'  >
             
                    <?php 
                    if ($resultado[$i]["disponibilidad"]==1) {

                        echo"";
                        echo '<img src="../../../images/icons/check.svg" class="w-10 mr-10  filtro-verde" alt="Borrar" title="Desactivar" id="boton1" onclick="Disponibilidad(\'Desactivar\', \'' . $resultado[$i]["nombre"] . '\')">';


                     
                    }
                    else {
                        
                        echo '<img src="../../../images/icons/checkbox.svg" class="w-10 mr-10 filtro-gris" alt="Borrar" title="Activar" id="boton1" onclick="Disponibilidad(\'Activar\', \'' . $resultado[$i]["nombre"] . '\')">';
                    }
                    ?>
                    </td>
                    </div>    
                </tr>
                <?php } ?>
            </tbody>
        </table>

                        
        <?php 
        include_once("../v_paginado/v_PaginadoTotal.php");
         ?>
       
        </div>

    


            <form id="form" style="display: none;"  name="pantalla" class='formulario' method="POST" action="../../Control/c_aula.php">
            <div class=" flex justify-end ">
                <div class="  bg-red-500  w-10  rounded-full ">
                    <img src="../../../images/icons/error.svg" class=" filtro-blanco" alt="Añadir" title="Cerrar" id="boton1" onclick="Mostrar()">
                </div>
            </div>
                <br>

                <label for="nom">Nombre: </label>
                <input type="text" id="nom" name="nom" maxlength="25" placeholder="Nombre del aula" class="formulario__input"> 
    
                <br><br>
                <label for="des">Descripcion: </label>
                <textarea name="des" id="des" rows="4" class="input" maxlength="150" placeholder="Actividad a Desarrollar en el Aula"></textarea>

                <input type="hidden" name="dis">
                <br><br>

                <input type="hidden" name="ope" id='ope'>
                <input type="hidden" name="origin" id='origin'>
                <input type="button" id="btn3" onclick="Enviar(this.value)" value="Incluir" class="table_button w-full">
        
            </form>
     
    </div>

    
    </div>
</body>
<script type="text/javascript" src="../../../javascript/horario/aula.js"></script>


</html>