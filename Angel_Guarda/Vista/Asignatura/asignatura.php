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

<script type="text/javascript" src="../../../javascript/horario/asignatura.js"></script>

    <div class="main-content">
    <div class="flex flex-row justify-end items-center md:space-x-2 p-4 md:p-0">
        <h1 class="text-xl font-semibold mb-2 md:mb-0">Asignaturas</h1>

        <!-- Este DIV es para ocultar la tabla -->
        <div class="boton2" style="display: none;" id="boton2"></div>
        <img src="../../../images/icons/añadir.svg" class="w-10 bg-green-500 hover:bg-green-400 rounded-full cursor-pointer" alt="Añadir" id="boton1" onclick="Mostrar()">
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
                        <button onclick='Eliminar(`<?php echo $resultado[$i]["codigo"]; ?>`)' class='table_button'>Eliminar</button>
                        <button onclick='Modificar(`<?php echo $resultado[$i]["codigo"]; ?>`,`<?php echo $resultado[$i]["nombre"];?>`)' class='table_button'>Modificar</button>
                    </td>
                    <?php } ?>
                    </tbody>
            
                </table>
                
                  <!-- Mostrando El total de Paginas -->
        <?php 
        include_once("../v_paginado/v_PaginadoTotal.php");
         ?>
        </div>

        <br>
  

      
        <div class="formulario">
            

            <br>

            <form id="form" style="display: none;" name="pantalla" class='pantalla' method="POST" action="../../Control/asignatura.php">
                <br>

                <label for="cod">Codigo: </label><br>
                <input type="text" id="cod" name="cod" placeholder="Codigo de asignatura" class="formulario__input"> 
    
                <br><br>
                <label for="nom">Nombre: </label><br>
                <input type="text" id="nom" name="nom" placeholder="Nombre de asignatura" class="formulario__input">

                <br><br>

                <input type="hidden" name="ope" id='ope'>
                <input type="hidden" name="origin" id='origin'>
                <input type="button" id="btn3" onclick="Enviar(this.value)" value="Incluir" class="table_button">
                <input type="button" id="btn2" onclick="Mostrar()" value="Cerrar" class="table_button">
            </form>
        </div>
    </div>

</body>


</html>