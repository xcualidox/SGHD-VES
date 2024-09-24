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
        <div class="flex ">
        <h3 class=" font-semibold mb-2 md:mb-0">
            Dólar BCV:    <input type="text" class=" text-balance  w-28  border  font-normal  outline-none px-2 py-1 mb-2 md:mb-0" id="DolarBCV" maxlength="9" onblur="actualizarDolar()">
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
                    <td>Nombre,Apellidos </td>
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

        </table>
        <!-- Mostrando El total de Paginas -->

    </div>


    <!-- Ventanas de Pagos Modales -->
    <dialog id="modalAñadir" class="relative p-6">

        <div class="flex justify-end items-end">
            <!-- Botón de Cerrar en la parte superior derecha -->
            <div class="w-10 bg-red-500 rounded-full cursor-pointer p-2" id="closeModalAñadir">
                <img src="../../../images/icons/error.svg" class="filtro-blanco" alt="Cerrar" title="Cerrar">
            </div>
        </div>
        <!-- Contenido del Modal -->
        <h2 class="text-xl font-semibold mb-4">Registro Estudiante</h2>

        <form id="" class="space-y-4" method="POST" action="#">
            <!-- Contenedor principal con flex para dividir izquierda y derecha -->
            <div class="flex space-x-8">
                <!-- Columna Izquierda -->
                <div class="w-1/2">
                    <div class="formulario-extenso__row">
                        <div class="formulario-extenso__column">
                            <label for="cedulaEstudiante">Cédula Estudiante: </label>
                            <input type="text" id="cedulaEstudiante" name="cedulaEstudiante" placeholder="Cédula del Estudiante" class="formulario-extenso__input" maxlength="25">
                        </div>
                    </div>
                    <div class="formulario-extenso__row">
                        <div class="formulario-extenso__column">
                            <label for="nombres">Estudiante: </label>
                            <input type="input" name="nombres" id="nombres" placeholder="Nombres Estudiante" class="formulario-extenso__input" maxlength="70">
                        </div>
                        <div class="formulario-extenso__column">
                            <label for="apellidos">Estudiante: </label>
                            <input type="input" name="apellidos" id="apellidos" class="formulario-extenso__input" placeholder="Apellidos Estudiante" maxlength="70">
                        </div>
                    </div>
                    <div class="formulario-extenso__row">
                        <div class="formulario-extenso__column">
                            <label for="anoEscolar">Año Escolar: </label>
                            <select name="" id="" class="formulario-extenso__input">
                                <option value="">Año Escolar 1</option>
                                <option value="">Año Escolar 2</option>
                            </select>
                        </div>
                        <div class="formulario-extenso__column">
                            <label for="anoSeccion">Año Sección: </label>
                            <select name="" id="" class="formulario-extenso__input">
                                <option value="1">1ero</option>
                                <option value="2">2do</option>
                                <option value="3">3ro</option>
                                <option value="4">4to</option>
                                <option value="5">5to</option>
                            </select>
                        </div>
                    </div>
                </div>

                <!-- Columna Derecha -->
                <div class="w-1/2">
                    <div class="formulario-extenso__row">
                        <div class="formulario-extenso__column">
                            <label for="cedulaRepresentante">Cédula Representante: </label>
                            <input type="text" id="cedulaRepresentante" name="cedulaRepresentante" placeholder="Cédula del Representante" class="formulario-extenso__input" maxlength="25">
                        </div>
                    </div>
                    <div class="formulario-extenso__row">
                        <div class="formulario-extenso__column">
                            <label for="nombresRepresentante"> Representante: </label>
                            <input type="input" name="nombresRepresentante" id="nombresRepresentante" placeholder="Nombres del Representante" class="formulario-extenso__input" maxlength="70">
                        </div>
                        <div class="formulario-extenso__column">
                            <label for="apellidosRepresentante">Representante: </label>
                            <input type="input" name="apellidosRepresentante" id="apellidosRepresentante" class="formulario-extenso__input" placeholder="Apellidos Representante" maxlength="70">
                        </div>
                    </div>
                    <div class="formulario-extenso__row">
                        <div class="formulario-extenso__column">
                            <label for="telefono">Telefono: </label>
                            <input type="input" name="telefono" id="telefono" placeholder="Telefono" class="formulario-extenso__input" maxlength="70">
                        </div>
                        <div class="formulario-extenso__column">
                            <label for="telefonoDomicilio">telefono Domicilio: </label>
                            <input type="input" name="telefonoDomicilio" id="telefonoDomicilio" class="formulario-extenso__input" placeholder="telefono Domicilio:" maxlength="70">
                        </div>
                    </div>
                </div>


            </div>
            <div class="formulario-extenso__row">
                <div class="formulario-extenso__column">
                    <label for="direccion">Dirección: </label>
                    <input type="text" id="direccion" name="direccion" placeholder="Direccion del Estudiante" class="formulario-extenso__input" maxlength="255">
                </div>
                <div class="formulario-extenso__column">
                    <label for="correo">Correo: </label>
                    <input type="text" id="correo" name="correo" placeholder="Correo" class="formulario-extenso__input" maxlength="255">
                </div>
            </div>

            <input type="button" id="" value="Guardar" class="table_button w-full">
        </form>
    </dialog>


    <!-- AQUI TERMINA EL REGISTRO DE ESTUDIANTES -->


    <!-- MODAL VER PAGOS" -->
    <dialog id="modalPagos">
        <div class="flex justify-end  items-end ">
            <!-- Botón de Cerrar en la parte superior derecha -->
            <div class=" w-10  bg-red-500 rounded-full cursor-pointer p-2" id="closeModalPagos">
                <img src="../../../images/icons/error.svg" class="filtro-blanco" alt="Cerrar" title="Cerrar">
            </div>
        </div>

        <div class="flex flex-col sm:flex-row justify-end items-center md:space-x-2 p-4 md:py-2">
            <h1 class="text-xl font-semibold mb-2 md:mb-0">Ver Pagos</h1>


            <!-- FORMULARIO BUSQUEDA -->
            <form method="GET" action="" class="flex items-center space-x-2">
                <select name="campo" class='capitalize border-solid border-2  border-black' id="selectListar" name="listar" p class="border rounded px-2 py-1 w-auto">
                </select>

                <input type="text" id="listar" name="listar" placeholder="Buscar..." class="border rounded px-2 py-1 mb-2 md:mb-0">

                <button type="button" class="bg-gray-100 rounded-full">
                    <img src="../../../images/icons/buscar.svg" class=" w-20 filtro-verde" alt="Buscar" title="Buscar">
                </button>
            </form>

            <!-- Botón para limpiar los filtros -->

        </div>
        <div class="table-wrapper min-w-full">
            <table class="fl-table">
                <thead>
                    <tr>
                        <td>Año Escolar</td>
                        <td>Nombre y Apellido </td>
                        <td>Año Sección</td>
                        <td>Telefono Representante</td>
                        <td class='no_style'>
                            <div class="flex justify-center ">

                                <a href="#">
                                    <img src="../../../images/icons/pdf.svg" class="w-10  filtro-blanco " alt="Reporte" title="Reporte">
                                </a>

                            </div>
                        </td>
                        <td>Pago</td>
                    </tr>
                </thead>
                <tbody>



                    <tr>
                        <td class="border px-4 py-2"> Año Escolar</td>
                        <td class="border px-4 py-2">Nombre y Apellido </td>
                        <td class="border px-4 py-2">Año Sección</td>
                        <td class="border px-4 py-2">Telefono Representante</td>

                        <td class="border px-4 py-2 text-center">
                            <div class="flex justify-center items-center space-x-4">
                                <img src="../../../images/icons/pdf.svg" class="w-8 h-8 filtro-rojo cursor-pointer" alt="PDF" title="PDF">
                                <img src="../../../images/icons/modificar.svg" class="w-8 h-8 filtro-azul cursor-pointer" alt="Modificar" title="Modificar">

                            </div>
                        </td>
                        <td class="border px-4 py-2">1/12</td>
                    </tr>


                </tbody>
            </table>
            <!--MOSTRANDO EL TOTAL DE PAGINAS-->

        </div>

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
            <summary>Registrar Pago</summary>
            <div class="content__details">


                <form id="" class="space-y-4" method="POST" action="#">
                    <!-- Contenedor principal con flex para dividir izquierda y derecha -->
                    <div class="flex space-x-8">
                        <!-- Columna Izquierda -->
                        <div class=" w-full">
                            <div class="formulario-extenso__row">
                                <div class="formulario-extenso__column">
                                    <label for="anoEscolar">Año Escolar: </label>
                                    <select name="" id="" class="formulario-extenso__input">
                                        <option value="">Año Escolar 1</option>
                                        <option value="">Año Escolar 2</option>
                                    </select>
                                </div>
                                <div class="formulario-extenso__column">
                                    <label for="mesPagar">Meses a Pagar: </label>
                                    <input type="text" id="mesPagar" name="mesPagar" placeholder="Meses a pagar" class="formulario-extenso__input" maxlength="25">
                                </div>
                            </div>

                            <div class="formulario-extenso__row">
                                <div class="formulario-extenso__column">

                                    <label for="Pago">Descuento: </label>
                                    <div class="flex">
                                        <div class="custom-radio">
                                            <input type="radio" id="total" value="0" name="descuento">
                                            <label for="total">Total</label>
                                        </div>
                                        <div class="custom-radio">
                                            <input type="radio" id="descuento-10" value="10%" name="descuento">
                                            <label for="descuento-10">10%</label>
                                        </div>

                                        <div class="custom-radio">
                                            <input type="radio" id="descuento-20" value="20%" name="descuento">
                                            <label for="descuento-20">20%</label>
                                        </div>

                                        <div class="custom-radio">
                                            <input type="radio" id="descuento-50" value="50%" name="descuento">
                                            <label for="descuento-50">50%</label>
                                        </div>

                                        <div class="custom-radio">
                                            <input type="radio" id="descuento-becado" value="Becado" name="descuento">
                                            <label for="descuento-becado">Becado</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="formulario-extenso__row">
                                <div class="formulario-extenso__column">
                                    <label for="Pago">Forma de Pago: </label>
                                    <div class="flex">
                                        <div class="custom-radio">
                                            <input type="radio" id="divisas" value="divisas" name="FormaPago">
                                            <label for="divisas">Divisas</label>
                                        </div>
                                        <div class="custom-radio">
                                            <input type="radio" id="transferencia" value="transferencia" name="FormaPago">
                                            <label for="transferencia">Transferencia</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="formulario-extenso__column">

                                    <label for="referencia">Numero de Referencia: </label>
                                    <input type="text" id="referencia" name="referencia" placeholder="Referencia" class="formulario-extenso__input" maxlength="">

                                </div>
                            </div>
                            <div class="formulario-extenso__row">

                                <div class="formulario-extenso__column">

                                    <label for="monto">Monto a Pagar: </label>
                                    <input type="text" id="mesPagar" name="mesPagar" placeholder="Monto a Pagar" class="formulario-extenso__input" maxlength="">

                                </div>
                                <div class="formulario-extenso__column">

                                    <label for="monto">Descuento: </label>
                                    <input type="text" id="mesPagar" name="mesPagar" disabled placeholder="Descuento" class="formulario-extenso__input" maxlength="">

                                </div>
                            </div>
                            <div class="formulario-extenso__row">

                                <div class="formulario-extenso__column">

                                    <label for="monto">Monto Total: </label>
                                    <input type="text" id="mesPagar" name="mesPagar" placeholder="Monto a Pagar" class="formulario-extenso__input" maxlength="">

                                </div>

                            </div>
                        </div>

                        <!-- Columna Derecha -->



                    </div>


                    <input type="button" id="" value="Guardar" class="table_button w-full">
                </form>
            </div>
        </details>

        <details>
            <summary>Lista de Pagos</summary>
            <div class="content__details">
                <div class="flex flex-col sm:flex-row justify-end items-center md:space-x-2 p-4 md:py-2">

                    <div class="bg-gray-100 rounded-full cursor-pointer" id="openAñadirPago">
                        <img src="../../../images/icons/añadir.svg" class="w-10 filtro-verde" alt="openAñadirPago" title="openAñadirPago">
                    </div>
                    <!-- FORMULARIO BUSQUEDA-->
                    <form method="GET" action="" class="flex items-center space-x-2">
                        <select name="campo" class='capitalize border-solid border-2  border-black' id="selectListar" name="listar" p class="border rounded px-2 py-1 w-auto">
                        </select>

                        <input type="text" id="listar" name="listar" placeholder="Buscar..." class="border rounded px-2 py-1 mb-2 md:mb-0">

                        <button type="button" class="bg-gray-100 rounded-full">
                            <img src="../../../images/icons/buscar.svg" class=" w-20 filtro-verde" alt="Buscar" title="Buscar">
                        </button>
                    </form>

                    <!-- Botón para limpiar los filtros -->

                </div>
                <div class="table-wrapper min-w-full">
                    <table class="fl-table">
                        <thead>
                            <tr>
                                <td>ID</td>
                                <td>Forma de Pago</td>
                                <td>Total</td>
                                <td>fecha</td>
                                <td>Descuento</td>
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
                                <td class="border px-4 py-2"> Año Escolar</td>
                                <td class="border px-4 py-2">Nombre y Apellido </td>
                                <td class="border px-4 py-2">Año Sección</td>
                                <td class="border px-4 py-2">Telefono Representante</td>

                                <td class="border px-4 py-2 text-center">
                                    <div class="flex justify-center items-center space-x-4">
                                        <img src="../../../images/icons/pdf.svg" class="w-8 h-8 filtro-rojo cursor-pointer" alt="PDF" title="PDF">
                                        <img src="../../../images/icons/modificar.svg" class="w-8 h-8 filtro-azul cursor-pointer" alt="Modificar" title="Modificar">

                                    </div>
                                </td>
                                <td class="border px-4 py-2">1/12</td>
                            </tr>


                        </tbody>
                    </table>
                    <!-- Mostrando El total de Paginas -->

                </div>
            </div>
        </details>

    </dialog>







</div>

</body>
<!-- Llamado JavaScriptEstudiantes -->
<script type="text/javascript" src="../../../javascript/estudiantesPagos.js"></script>

</html>