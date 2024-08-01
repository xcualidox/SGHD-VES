<?php
session_start();
include_once("../../control/asignatura_tabla.php");


if ($_SESSION["sesion"]!="admin") {
    header("Location: ../../../index.php");
}
$title = 'Asignatura';
include_once('../v_Sidebar/v_Sidebar.php');

?>
<!-- Hereda del Padre Sidebar -->

<script type="text/javascript" src="../../../javascript/horario/mostrarModal.js"></script>
<script type="text/javascript" src="../../../javascript/horario/asignatura.js"></script>

    <div class="main-content">
    <?php
    include_once("../v_Buscar/v_BuscarHeader.php");
    ?>
        
        <div class="table-wrapper min-w-full"> 
            <table class="fl-table">
                <thead>
    				<td align="center">Codigo</td>
    				<td align="center">Nombre</td>
                    <td class=''><a href="asignatura_pdf.php"><button class='table_button' >PDF</button></a></td>
    			</thead>
                <tbody>
                <?php
                include_once("../v_paginado/v_paginadoConsulta.php");
                //Variable de la Consulta del Paginado
                for ($i = 0; $i < count($resultado); $i++) {
                ?>
                <tr>
    			    <td class="limitado1"><?php echo $resultado[$i]["codigo"]?></td>
    			    <td class="limitado2"><?php echo $resultado[$i]["nombre"]?></td>
                    <td class="no_style">

                  
             
            </div>
                <div class=" flex justify-center">
                    <img src="../../../images/icons/papelera.svg"  class="w-10  mr-10 filtro-rojo" alt="Borrar" title="Borrar" id="boton1" onclick='Eliminar(`<?php echo $resultado[$i]["codigo"]; ?>`)' >
                    <img src="../../../images/icons/modificar.svg"  class="w-10  filtro-azul " alt="Borrar" title="Modificar" id="boton1"onclick='Modificar(`<?php echo $resultado[$i]["codigo"]; ?>`,`<?php echo $resultado[$i]["nombre"];?>`)' >
                </div>
             
                   
                  
                    </td>
                    <?php } ?>
                    </tbody>
            
                </table>
                
                  <!-- Mostrando El total de Paginas -->
        <?php 
        include_once("../v_paginado/v_PaginadoTotal.php");
         ?>
        </div>

 
      
    
                    <div>
                        
            <form id="form" style="display: none;" class="formulario" name="pantalla" class='pantalla' method="POST" action="../../Control/asignatura.php">

            <div class=" flex justify-end ">
                <div class="  bg-red-500  w-10  rounded-full ">
                    <img src="../../../images/icons/error.svg" class=" filtro-blanco" alt="Añadir" title="Cerrar" id="boton1" onclick="Mostrar()">
                </div>
            </div>
          

                <label for="cod">Codigo: </label><br>
                <input type="text" id="cod" name="cod" placeholder="Codigo de asignatura" class="formulario__input"> 
    
                <label for="nom">Nombre: </label><br>
                <input type="text" id="nom" name="nom" placeholder="Nombre de asignatura" class="formulario__input">

                <br><br>

                <input type="hidden" name="ope" id='ope'>
                <input type="hidden" name="origin" id='origin'>
                <input type="button" id="btn3" onclick="Enviar(this.value)" value="Incluir" class="table_button w-full">
               
            </form>

                    </div>
    
    </div>

</body>


</html>