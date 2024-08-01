<?php
session_start();
include_once("../../control/a_seccion_tabla.php");
if ($_SESSION["sesion"]!="admin") {
    header("Location: ../../../index.php");
}
$title='Año y Seccion';
include_once('../v_Sidebar/v_Sidebar.php');
?>




<script type="text/javascript" src="../../../javascript/horario/mostrarModal.js"></script>
    <script type="text/javascript" src="../../../javascript/horario/a_seccion.js"></script>

    <div class="main-content">
      
    <?php
        include_once("../v_Buscar/v_BuscarHeader.php");
    ?>

    <div class="table-wrapper min-w-full">

       
        <div class="fl-table"> 
            <table class="fl-table">
                <thead>
    				<td >Año</td>
    				<td >Seccion</td>
                    <td class=''> <a href="a_seccion_pdf.php"><button class='table_button' style='margin-left:20px;'>PDF</button></a></td>
    			</thead>
                <tbody>

                <?php
            include_once("../v_paginado/v_paginadoConsulta.php");
            //Variable de la Consulta del Paginado
            for ($i = 0; $i < count($resultado); $i++) {
            ?>

                <tr>
    			    <td class="border px-4 py-2"><?php echo $resultado[$i]["ano"]?></td>
    			    <td class="border px-4 py-2"><?php echo $resultado[$i]["seccion"]?></td>
                    <td class="">


                    <div class=" flex justify-center">
                    <img src="../../../images/icons/papelera.svg"  class="w-10  mr-10 filtro-rojo" alt="Borrar" title="Borrar" id="boton1" 
                    onclick='Eliminar(`<?php echo $resultado[$i]["ano"]; ?>`,`<?php echo $resultado[$i]["seccion"];?>`)' >
                    <img src="../../../images/icons/modificar.svg"  class="w-10  filtro-azul " alt="Borrar" title="Modificar" id="boton1"
                    onclick='Modificar(`<?php echo $resultado[$i]["ano"]; ?>`,`<?php echo $resultado[$i]["seccion"];?>`)'  >
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
    </div>

      

            <form id="form" style="display: none;" name="pantalla" class='formulario pantalla' method="POST" action="../../Control/a_seccion.php">
            <div class=" flex justify-end ">
                <div class="  bg-red-500  w-10  rounded-full ">
                    <img src="../../../images/icons/error.svg" class=" filtro-blanco" alt="Añadir" title="Cerrar" id="boton1" onclick="Mostrar()">
                </div>
            </div>

                <label for="a">Año: </label>
                <br>
                <select name="a" id="a" class="">
                    <option value="" hidden selected>Año del salon</option>
                    <option value="1ero">1er Año</option>
                    <option value="2do">2do Año</option>
                    <option value="3ero">3er Año</option>
                    <option value="4to">4to Año</option>
                    <option value="5to">5to Año</option>
                </select>
    
            <br><br>

                <label for="sec">Seccion: </label>
                <br>
                <select name="sec" id="sec" class="t">
                    <option value="" hidden selected>Seccion del salon</option>
                    <option value="A">A</option>
                    <option value="B">B</option>
                    <option value="C">C</option>
                    <option value="D">D</option>
                    </select>
           
                    <br>
                    <br>
             

                <input type="hidden" name="ope" id='ope'>
                <input type="hidden" name="origin" id='origin'>
                <input type="hidden" name="origin2" id='origin2'>
              
                <input type="button" id="btn3" onclick="Enviar(this.value)" value="Incluir" class="table_button w-full">
              
            </form>
   
    </div>
</body>
</html>