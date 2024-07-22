<?php
session_start();
include_once("../../control/a_seccion_tabla.php");
if ($_SESSION["sesion"]!="admin") {
    header("Location: ../../../index.php");
}
$title='Año y Seccion';
include_once('../v_Sidebar/v_Sidebar.php');
?>





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
                        <button onclick='Eliminar(`<?php echo $resultado[$i]["ano"]; ?>`,`<?php echo $resultado[$i]["seccion"];?>`)' class='table_button'>Eliminar</button>
                        <button onclick='Modificar(`<?php echo $resultado[$i]["ano"]; ?>`,`<?php echo $resultado[$i]["seccion"];?>`)' class='table_button'>Modificar</button>
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

      

        <div class="formulario">
            <br>

            <form id="form" style="display: none;" name="pantalla" class='pantalla' method="POST" action="../../Control/a_seccion.php">
                <br>

                <label for="a">Año: </label><br>
                <select name="a" id="a" class="">
                    <option value="" hidden selected>Año del salon</option>
                    <option value="1ero">1er Año</option>
                    <option value="2do">2do Año</option>
                    <option value="3ero">3er Año</option>
                    <option value="4to">4to Año</option>
                    <option value="5to">5to Año</option>
                </select>
    
            

                <label for="sec">Seccion: </label><br>
                <select name="sec" id="sec" class="t">
                    <option value="" hidden selected>Seccion del salon</option>
                    <option value="A">A</option>
                    <option value="B">B</option>
                    <option value="C">C</option>
                    <option value="D">D</option>
                    </select>

             

                <input type="hidden" name="ope" id='ope'>
                <input type="hidden" name="origin" id='origin'>
                <input type="hidden" name="origin2" id='origin2'>
                <input type="button" id="btn3" onclick="Enviar(this.value)" value="Incluir" class="table_button">
                <input type="button" id="btn2" onclick="Mostrar()" value="Cerrar" class="table_button">
            </form>
        </div>
    </div>
</body>
</html>