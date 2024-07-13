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
            if (!isset($_GET["pag_asig"])) {
                $paginaActual = 1;
            } else {
                $paginaActual = $_GET["pag_asig"];
            }

            $limit = $paginaActual * 5;
            $offset = $limit - 5;
            $objeto = new query();
            $resultado = $objeto->GenerarTabla($offset, $limit);
            $numFilas = $objeto->TotalPaginas();
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
    <div class='paginacion'>
    <?php
        $totalpag = ceil($numFilas / 5);
        if ($totalpag <= 10) {
            for ($i = 1; $i <= $totalpag; $i++) {
                if ($paginaActual == $i) {
                    echo "<a href=?pag_asig=$i class='seleccionado'>$i</a>";
                } else {
                    echo "<a href=?pag_asig=$i>$i</a>";
                }
            }
        } else {
            for ($i = max(1, $paginaActual - 4); $i <= min($totalpag, $paginaActual + 6); $i++) {
                if ($paginaActual == $i) {
                    echo "<a href=?pag_asig=$i class='seleccionado'>$i</a>";
                } else {
                    echo "<a href=?pag_asig=$i>$i</a>";
                }
            }
            if ($paginaActual + 6 < $totalpag) {
                echo "...";
            }
        }
    ?>
    </div>
   
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
