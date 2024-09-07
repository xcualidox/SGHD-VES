<?php
session_start();
include_once("../../Control/c_escolar.php");
if ($_SESSION["sesion"] == "admin" || $_SESSION["sesion"] == "administrador") {
}
 else {
    header("Location: ../../../index.php");
}
$title='Año Escolar';
include_once('../v_Sidebar/v_Sidebar.php');
?>

   
<script type="text/javascript" src="../../../javascript/horario/mostrarModal.js"></script>
    <script type="text/javascript" src="../../../javascript/horario/a_escolar.js"></script>

    <div class="main-content">
        <?php
        include_once("../v_Buscar/v_BuscarHeader.php");
        ?>
        
        <div class="table-wrapper min-w-full">
            <table class="fl-table">
                <thead>
    				<td >Nombre</td>
    				<td >Fecha de Inicio</td>
                    <td >Fecha Final</td>
                    <td >
                        
                    <div class="flex justify-center ">
                        
                        <a href="a_escolar_pdf.php">
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
    			    <td class="border px-4 py-2"><?php echo $resultado[$i]["fecha_inicio"]?></td>
                    <td class="border px-4 py-2"><?php echo $resultado[$i]["fecha_fin"]?></td>
                    <td >

                    
                <div class=" flex justify-center">
                    <img src="../../../images/icons/papelera.svg"  class="w-10  mr-10 filtro-rojo" alt="Borrar" title="Borrar" id="boton1" 
                    onclick='Eliminar(`<?php echo $resultado[$i]["nombre"]; ?>`)'  >
                    <img src="../../../images/icons/modificar.svg"  class="w-10  filtro-azul " alt="Borrar" title="Modificar" id="boton1"
                    onclick='Modificar(`<?php echo $resultado[$i]["nombre"]; ?>`,`<?php echo $resultado[$i]["fecha_inicio"];?>`,`<?php echo $resultado[$i]["fecha_fin"];?>`)'  >
                </div>
                    
                      
                    </td>
    			</tr>
                <?php } ?>
            </tbody>
                </table>
                <?php 
                include_once("../v_paginado/v_PaginadoTotal.php");
                ?>
            </div>
     

       

            <form id="form" style="display: none;" name="pantalla" class='formulario' method="POST" action="../../Control/c_escolar.php">

            <div class=" flex justify-end ">
                <div class="  bg-red-500  w-10  rounded-full ">
                    <img src="../../../images/icons/error.svg" class=" filtro-blanco" alt="Añadir" title="Cerrar" id="boton1" onclick="Mostrar()">
                </div>
            </div>
    

                <label for="nom">Nombre: </label><br>
                <input type="text" id="nom" name="nom" placeholder="Nombre del año escolar" class="formulario__input"> 
    
                <br><br>

                <label for="fecI">Fecha de inicio de año: </label><br>
                <input type="date" name="fecI" id="fecI" class="formulario__input">

                <br><br>

                <label for="fecF">Fecha de fin de año: </label><br>
                <input type="date" name="fecF" id="fecF" placeholder="Fecha de fin del año" class="formulario__input">

                <br><br>

                <input type="hidden" name="ope" id='ope'>
                <input type="hidden" name="origin" id='origin'>
                <input type="button" id="btn3" onclick="Enviar(this.value)" value="Incluir" class="table_button w-full">
              
            </form>
      
    </div>

</body>

<script>
    let btn = document.querySelector('#btn');
    let sidebar = document.querySelector('.sidebar');

    btn.onclick = function (){
        sidebar.classList.toggle('active')
    };
</script>
</html>