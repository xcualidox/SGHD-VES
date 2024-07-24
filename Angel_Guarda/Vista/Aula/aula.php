<?php
session_start();
include_once("../../control/aula_tabla.php");
if ($_SESSION["sesion"]!="admin") {
    header("Location: ../../../index.php");
}
$title="Aulas";
include_once('../v_Sidebar/v_Sidebar.php')
?>


<script type="text/javascript" src="../../../javascript/horario/mostrarModal.js"></script>
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <div class="main-content">
    <?php
    include_once("../v_Buscar/v_BuscarHeader.php");
    ?>
    <div class="table-wrapper min-w-full">
    <table class="fl-table">
            <thead>
    			<td align="center">Nombre</td>
    			<td align="center">Descripcion</td>
                <td class='no_style'></td>
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
                    <button onclick='Eliminar(`<?php echo $resultado[$i]["nombre"]; ?>`)' class='table_button'>Eliminar</button>
                    <button onclick='Modificar(`<?php echo $resultado[$i]["nombre"]; ?>`,`<?php echo $resultado[$i]["descripcion"];?>`)' class='table_button'>Modificar</button>
                    <?php 
                    if ($resultado[$i]["disponibilidad"]==1) {
                        echo "<button type='button' class='desactivar' onclick='Disponibilidad(`Desactivar`,`".$resultado[$i]["nombre"]."`)'>Desactivar</button>";
                    }
                    else {
                        echo "<button type='button' class='activar' onclick='Disponibilidad(`Activar`,`".$resultado[$i]["nombre"]."`)'>Activar</button>";
                    }
                    ?>
                    </td>
                </tr>
                <?php } ?>
            </tbody>
        </table>

                        
        <?php 
        include_once("../v_paginado/v_PaginadoTotal.php");
         ?>
       
        </div>

    


            <form id="form" style="display: none;"  name="pantalla" class='formulario' method="POST" action="../../Control/aula.php">
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
                <input type="button" id="btn3" onclick="Enviar(this.value)" value="Incluir" class="table_button">
                <input type="button" id="btn2" onclick="Mostrar()" value="Cerrar" class="table_button">
            </form>
     
    </div>

    
    </div>
</body>
<script type="text/javascript" src="../../../javascript/horario/aula.js"></script>


</html>