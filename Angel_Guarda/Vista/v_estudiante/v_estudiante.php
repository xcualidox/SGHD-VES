<?php
session_start();
include_once("../../../libraries/vendor/autoload.php");


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
                    <td>Nombre,Apellidos </td>
                    <td>Nombre del Representante</td>
                    <td>Cedula Representante</td>
                    <td>Telefono</td>

                    <td class='no_style'>
                        <div class="flex justify-center ">

                            <a href="profesorPDF.php">
                                <img src="../../../images/icons/pdf.svg" class="w-10  filtro-blanco " alt="Reporte" title="Reporte">
                            </a>

                        </div>
                    </td>
                </tr>
            </thead>
            <tbody>

            <tbody>

                <tr>
                    <td class="border px-4 py-2"> Cedula</td>
                    <td class="border px-4 py-2">Nombre,Apellidos </td>
                    <td class="border px-4 py-2">Nombre del Representante</td>
                    <td class="border px-4 py-2">Cedula Representante</td>
                    <td class="border px-4 py-2">Telefono Representante</td>

                    <td class="border px-4 py-2 text-center">
                        <div class="flex justify-center items-center space-x-4">
                            <img src="../../../images/icons/papelera.svg" class="w-8 h-8 filtro-rojo cursor-pointer" alt="Borrar" title="Borrar">
                            <img src="../../../images/icons/modificar.svg" class="w-8 h-8 filtro-azul cursor-pointer" alt="Modificar" title="Modificar">
                            <img src="../../../images/icons/moreGrid.svg" class="w-8 h-8 filtro-negro  cursor-pointer" id="openMostrarMas" alt="Mostrar Más" title="Mostrar Más">
                            <img src="../../../images/icons/credit-card.svg" class="w-8 h-8 filtro-negro  cursor-pointer" id="openPagoEspecifico" alt="Pago Especifico" title="Pago Especifico">
                        </div>
                    </td>
                </tr>

            </tbody>
            </tbody>
        </table>
        <!-- Mostrando El total de Paginas -->

    </div>


    <!-- Ventanas de Pagos Modales -->
    <dialog id="modalAñadir" class="relative p-6">
        <div class="flex justify-end  items-end ">
            <!-- Botón de Cerrar en la parte superior derecha -->
            <div class=" w-10  bg-red-500 rounded-full cursor-pointer p-2" id="closeModalAñadir">
                <img src="../../../images/icons/error.svg" class="filtro-blanco" alt="Cerrar" title="Cerrar">
            </div>
        </div>
        <!-- Contenido del Modal -->
        <h2 class="text-xl font-semibold mb-4">Añadir</h2>
        <p>Este es el contenido del modal para añadir.</p>

    </dialog>
    <!-- Modal para "Ver Pagos" -->
    <dialog id="modalPagos">
        <div class="flex justify-end  items-end ">
            <!-- Botón de Cerrar en la parte superior derecha -->
            <div class=" w-10  bg-red-500 rounded-full cursor-pointer p-2" id="closeModalPagos">
                <img src="../../../images/icons/error.svg" class="filtro-blanco" alt="Cerrar" title="Cerrar">
            </div>
        </div>
        <h2 class="text-xl font-semibold mb-4">Ver Pagos</h2>
        <p>Este es el contenido del modal para ver pagos.</p>

    </dialog>
    <!-- Mostrar Mas -->
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
    <!-- Modal Pago Especifico -->

<dialog id="modalPagosEspecificos">
    <div class="flex justify-end items-end ">
        <!-- Botón de Cerrar en la parte superior derecha -->
        <div class="w-10 bg-red-500 rounded-full cursor-pointer p-2" id="closePagosEspecificos">
            <img src="../../../images/icons/error.svg" class="filtro-blanco" alt="Cerrar" title="Cerrar">
        </div>
    </div>
    <h2 class="text-xl font-semibold mb-4">Pago Específico</h2>
    <p>Este es el contenido del modal para ver pagos específicos.</p>
</dialog>







</div>

</body>
<script type="text/javascript" src="../../../javascript//estudiantesPagos.js"></script>

</html>