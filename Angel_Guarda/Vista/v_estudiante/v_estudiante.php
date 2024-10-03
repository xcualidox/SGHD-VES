<?php
session_start();

include_once("../../../libraries/vendor/autoload.php");

include_once("../../Control/c_estudiantes.php");



if ($_SESSION["sesion"] == "admin" || $_SESSION["sesion"] == "administrador") {
} else {
    header("Location: ../../../index.php");
}

$title = 'Estudiante';
include_once('../v_Sidebar/v_Sidebar.php');
?>
<!--Aqui se el css se toma del Padre que es Sidebar-->
<script type="text/javascript" src="../../../javascript/horario/mostrarModal.js"></script>





<div class="main-content">
    <div class="flex flex-col sm:flex-row justify-end items-center md:space-x-2 p-4 md:py-2">
        <h1 class="text-xl font-semibold mb-2 md:mb-0"><?php echo $title; ?></h1>
        <div class="flex ">
            <h3 class=" font-semibold mb-2 md:mb-0">
                Dólar BCV: <input type="text" class=" text-balance  w-28  border  font-normal  outline-none px-2 py-1 mb-2 md:mb-0" id="DolarBCV" maxlength="9" onblur="actualizarDolar()">
            </h3>
        </div>

        <!-- Primer botón que abre el modal de "Añadir" -->
        <div class="bg-gray-100 rounded-full cursor-pointer" id="openModalAñadir">
            <img src="../../../images/icons/añadir.svg" class="w-10 filtro-verde" alt="Añadir" title="Añadir">
        </div>

        <!-- Segundo botón que abre el modal de "Ver Pagos" -->
        <div class="bg-gray-100 rounded-full cursor-pointer" id="openModalPagos">
            <img src="../../../images/icons/payment.svg" class="w-10 filtro-verde" alt="Ver Pagos" title="Ver Pagos">
        </div>
        <!-- Formulario de búsqueda -->
        <form method="GET" action="" class="flex items-center space-x-2">
            <select name="campo" class='capitalize border-solid border-2  border-black' id="selectListar" name="listar" p class="border rounded px-2 py-1 w-auto">
            </select>

            <input type="text" id="listar" name="listar" placeholder="Buscar..." class="border rounded px-2 py-1 mb-2 md:mb-0">

            <button type="submit" class="bg-gray-100 rounded-full">
                <img src="../../../images/icons/buscar.svg" class=" w-20 filtro-verde" alt="Buscar" title="Buscar">
            </button>
        </form>

        <!-- Botón para limpiar los filtros -->
        <form method="GET" action="" class="ml-4">

            <button type="submit" class="bg-gray-100 rounded-full">
                <img src="../../../images/icons/reload.svg" class="   w-6 filtro-verde" alt="Buscar" title="Buscar">
            </button>
        </form>
    </div>
    <div class="table-wrapper min-w-full">
        <table class="fl-table">
            <thead>
                <tr>
                    <td>Cedula Estudiante</td>
                    <td>Nombre y Apellidos Estudiante </td>
                    <td>Nombre del Representante</td>
                    <td>Cedula Representante</td>
                    <td>Telefono</td>

                    <td class='no_style'>
                        <div class="flex justify-center ">

                            <a href="#">
                                <img src="../../../images/icons/pdf.svg" class="w-10  filtro-blanco " alt="Reporte" title="Reporte">
                            </a>

                        </div>
                    </td>
                </tr>
            </thead>
            <tbody>



                <tr>
             <?php
       
               if (!empty($datos)) {
                foreach ($datos as $dato) {
                    // Imprimir cada fila de la tabla
                    echo "<tr>";
                    echo "<td class='border px-4 py-2'>" . htmlspecialchars($dato['cedula_estudiante']) . "</td>";
                    echo "<td class='border px-4 py-2'>" . htmlspecialchars($dato['nombres_estudiante']) . ", " . htmlspecialchars($dato['apellidos_estudiante']) . "</td>";
                    echo "<td class='border px-4 py-2'>" . htmlspecialchars($dato['nombres_representante']) . " " . htmlspecialchars($dato['apellidos_representante']) . "</td>";
                    echo "<td class='border px-4 py-2'>" . htmlspecialchars($dato['cedula_representante']) . "</td>";
                    echo "<td class='border px-4 py-2'>" . htmlspecialchars($dato['telefono']) . "</td>";
              
                }
            };
            
             
             ?>

               
                </tr>

                <td class="border px-4 py-2 text-center">
                        <div class="flex justify-center items-center space-x-4">
                            <img src="../../../images/icons/papelera.svg" class="w-8 h-8 filtro-rojo cursor-pointer" alt="Borrar" title="Borrar">
                            <img src="../../../images/icons/modificar.svg" class="w-8 h-8 filtro-azul cursor-pointer" alt="Modificar" title="Modificar">
                            <img src="../../../images/icons/moreGrid.svg" class="w-8 h-8 filtro-negro  cursor-pointer" id="openMostrarMas" alt="Mostrar Más" title="Mostrar Más">
                            <img src="../../../images/icons/credit-card.svg" class="w-8 h-8 filtro-negro  cursor-pointer" id="openPagoEspecifico" alt="Pago Especifico" title="Pago Especifico">
                        </div>
                    </td>

            </tbody>

        </table>
        <!-- Mostrando El total de Paginas -->

    </div>


    <!-- Ventanas de Pagos Modales -->
    <dialog id="modalAñadir" class="relative p-6">

        <?php

        include_once("v_modalAñadir.php");
        ?>

    </dialog>


    <!-- AQUI TERMINA EL REGISTRO DE ESTUDIANTES -->


    <!-- MODAL VER PAGOS" -->
    <dialog id="modalPagos">
        <?php

        include_once("v_modalPagos.php");
        ?>

    </dialog>
    <!-- MOSTRAR MAS-->
    <dialog id="modalMostrarMas">
        <div class="flex justify-end  items-end ">
            <!-- Botón de Cerrar en la parte superior derecha -->
            <div class=" w-10  bg-red-500 rounded-full cursor-pointer p-2" id="closeMostrarMas">
                <img src="../../../images/icons/error.svg" class="filtro-blanco" alt="Cerrar" title="Cerrar">
            </div>
        </div>
        <h2 class="text-xl font-semibold mb-4">Mostrar Más</h2>
        <p>fasdfasdfa.</p>

    </dialog>
    <!-- MODAL PAGO ESPECIFICO -->

    <dialog id="modalPagosEspecificos">

        <div class="flex justify-between">
            <!-- Título y descripción -->
            <div class="flex flex-col">
                <h1 class="text-xl font-semibold">Pago de Estudiante</h1>
                <h2 class=" font-semibold">"Nombre Nombre y Apellido Apellido"</h2>
                <h3 class=" font-semibold">Cedula Estudiante: 565656</h3>
                <h3 class=" font-semibold">Cedula Del Representante: 565656</h3>

            </div>

            <!-- Botón de cerrar en la parte superior derecha -->
            <div class="w-10 h-10 bg-red-500 rounded-full cursor-pointer p-2" id="closePagosEspecificos">
                <img src="../../../images/icons/error.svg" class="filtro-blanco w-full h-full" alt="Cerrar" title="Cerrar">
            </div>
        </div>
        <details>
            <?php

            include_once("v_registrarPago.php");
            ?>

        </details>

        <details>
            <?php

            include_once("v_listaPagos.php");
            ?>
        </details>

    </dialog>

</div>

</body>
<!-- Llamado JavaScriptEstudiantes -->
<script type="text/javascript" src="../../../javascript/estudiantesPagos.js"></script>
<script src="../../../javascript/libquery.js"></script>

</html>