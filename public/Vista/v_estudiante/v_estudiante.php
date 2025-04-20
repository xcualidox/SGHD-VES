<?php
session_start();

include_once("../../../libraries/vendor/autoload.php");

include_once("../../Control/c_estudiantes.php");



if ($_SESSION["sesion"] == "admin" || $_SESSION["sesion"] == "administrador" || $_SESSION["sesion"] == "secretario" ) {
} else {
    header("Location: ../../../index.php");
}

$title = 'Estudiante';
include_once('../v_Sidebar/v_Sidebar.php');
?>
<!--Aqui se el css se toma del Padre que es Sidebar-->






<div class="main-content">
    <div class="modal__Oscuro"> </div>
    <div class="flex absolute mt-3 justify-between items-center w-full px-4">
   
    </div>
    <div class="flex flex-col sm:flex-row justify-end items-center md:space-x-2 p-4 md:py-2">
    <h3 class="font-semibold">
             <button onclick="sincronizarConBCV()" class="ml-3  bg-green-700 hover:bg-green-600 text-white px-3 py-1 rounded">
                Sincronizar 
            </button>
            Dólar BCV: 
            <input type="text" class="text-balance w-28 border font-normal outline-none px-2 py-1 mb-2 md:mb-0" id="DolarBCV" maxlength="9" onblur="actualizarDolar()">
    
        </h3>
    
        <h1 class="text-xl font-semibold mb-2 md:mb-0"><?php echo $title; ?></h1>

        <!-- Primer botón que abre el modal de "Añadir" -->
        <div class="bg-gray-100 rounded-full cursor-pointer" id="openModalAñadir">
            <img src="../../../images/icons/añadir.svg" class="w-10 filtro-verde" alt="Añadir" title="Añadir">
        </div>
        <?php 
            //Declaro las Variables Aca, para que sean mas faciles de modificar
         $mensualidadBoton = '<div class="bg-gray-100 rounded-full cursor-pointer" id="openModalMensualidad">
            <img src="../../../images/icons/calendario.svg" class="w-10 filtro-verde" alt="openModalMensualidad" title="Mensualidad">
        </div>';
          if ($_SESSION["sesion"] == "admin") {

            
            echo $mensualidadBoton;
          
            } 
        
        ?>
   
        <div class="bg-gray-100 rounded-full cursor-pointer" id="openModalMesesPS">
            <img src="../../../images/icons/portapapeles.svg" class="w-10 filtro-verde" alt="openModalMesesPS" title="Modal Meses PS">
        </div>

        <!-- Segundo botón que abre el modal de "Ver Pagos" -->
        <div class="bg-gray-100 rounded-full cursor-pointer" id="openModalPagos">
            <img src="../../../images/icons/payment.svg" class="w-10 filtro-verde" alt="Ver Pagos" title="Ver Pagos">
        </div>
        <!-- Formulario de búsqueda -->
        <form method="GET" action="" class="flex items-center space-x-2">
            <select name="campo" class='capitalize border-solid border-2 border-black' id="selectCampo">
                <option value="cedula_estudiante">Cédula Estudiante</option>
                <option value="nombre_estudiante">Nombre Estudiante</option>
                <option value="cedula_representante">Cédula Representante</option>
                <option value="nombre_representante">Nombre Representante</option>
            </select>

            <input type="text" id="buscar" name="buscar" value="" placeholder="Buscar..." class="border rounded px-2 py-1 mb-2 md:mb-0">

            <button type="submit" class="bg-gray-100 rounded-full">
                <img src="../../../images/icons/buscar.svg" class="w-20 filtro-verde" alt="Buscar" title="Buscar">
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
                    <td>Cédula Estudiante</td>
                    <td>Nombre y Apellidos Estudiante </td>
                    <td>Nombre y Apellido del Representante</td>
                    <td>Cédula Representante</td>
                    <td>Télefono</td>

                    <td class='no_style'>
                        Acciones
                        <!-- <div class="flex justify-center ">

                            <a href="#">
                                <img src="../../../images/icons/pdf.svg" class="w-10  filtro-blanco " alt="Reporte" title="Reporte">
                            </a>

                        </div> -->
                    </td>
                </tr>
            </thead>
            <tbody id="tablaEstudiante">




                <?php


                echo $tablaHTML;
                ?>



            </tbody>

        </table>
        <!-- Mostrando El total de Paginas -->

    </div>


    <!-- Ventanas de Pagos Modales -->

    <div class='modal__Nuevo' id="modalAñadir">

        <?php

        include_once("v_modalAñadir.php");
        ?>

    </div>



    <!-- AQUI TERMINA EL REGISTRO DE ESTUDIANTES -->


    <!-- MODAL VER PAGOS" -->
    <div class="modal__Nuevo" id="modalPagos">
        <?php

        include_once("v_modalPagos.php");
        ?>

    </div>
    <!-- MOSTRAR MAS-->
    <div class="modal__Nuevo"  id="modalMostrarMas">

        <div class="flex justify-end items-end">
            <div class="w-10 bg-red-500 rounded-full cursor-pointer p-2" id="closeMostrarMas">
                <img src="../../../images/icons/error.svg" class="filtro-blanco" alt="Cerrar" title="Cerrar">
            </div>
        </div>
        <h2 class="text-xl font-semibold mb-4" id="nombreEstudianteMostrar"></h2>
        

        <details class="border border-teal-600 rounded-lg p-4 bg-teal-50 mt-4">
        <summary class="font-semibold cursor-pointer text-teal-700">Datos Estudiante</summary>
            <p id="DatosCompletosMostrarMas" class="mt-2 p-4 rounded-lg bg-white text-gray-800 shadow-inner"></p>
        </details>
        <!-- <details >
        <summary>Meses Saldados Estudiante</summary>
            <?php 
    //Se usa Include para que se cargue en ambos sitios
        // include("v_mesesSaldados.php");
            ?>
        </details> -->
        <!-- Imprimiendo Datos Para Mostrar -->

    </div>
    <!-- MODAL PAGO ESPECIFICO -->



    <div class="modal__Nuevo" id="modalPagosEspecificos">

        <div class="flex justify-between">
            <!-- Título y descripción -->
            <div class="flex flex-col">
                <h1 class="text-xl font-semibold">Pago de Estudiante</h1>
                <div class="flex  flex-wrap mb-1">
                    <span class="font-bold mr-2">Nombre Estudiante:</span>
                    <!-- NOMBRE ESTUDIANTE REGISTRO PAGO -->
                    <p id="nombresEstudianteRegistroPago" class="font-semibold"></p>

                </div>
                <div class="flex  flex-wrap mb-1">
                    <!-- CEDULA ESTUDIANTE REGISTRO PAGO -->
                    <span class="font-bold mr-2">Cédula Estudiante:</span>
                    <span id="cedulaEstudianteRegistroPago" class="font-semibold"></span>

                </div>
                <div class="flex  flex-wrap mb-1">
                    <!-- CEDULA REPRESENTANTE REGISTRO PAGO -->
                    <span class="font-bold mr-1">Cédula Representante:</span>
                    <span id="cedulaRepresentanteRegistroPago" class="font-semibold"></span>

                </div>
                <div class="flex  flex-wrap mb-1">
                    <!-- NOMBRE REPRESENTANTE REGISTRO PAGO -->
                    <span class="font-bold mr-1">Nombre Representante:</span>
                    <span id="nombresRepresentanteRegistroPago" class="font-semibold"></span>

                </div>
        

            </div>

            <!-- Botón de cerrar en la parte superior derecha -->
            <div class="w-10 h-10 bg-red-500 rounded-full cursor-pointer p-2" id="closePagosEspecificos">
                <img src="../../../images/icons/error.svg" class="filtro-blanco w-full h-full" alt="Cerrar" title="Cerrar">
            </div>
        </div>

        <details open>
            <?php

            include_once("v_registrarPago.php");
            ?>

        </details>

        <details id="listaPagos">
            <summary>Lista de Pagos</summary>
        </details>



    </div>
    <!-- MODAL PAGO ESPECIFICO -->


      <!-- Meses Pagos y Saldados -->

    <div class="modal__Nuevo" id="modalMesesPS">

        <div class="flex justify-end items-end">
            <div class="w-10 bg-red-500 rounded-full cursor-pointer p-2" id="closeMesesPS">
                <img src="../../../images/icons/error.svg" class="filtro-blanco" alt="Cerrar" title="Cerrar">
            </div>
        </div>
        <details open>
            <?php

            include_once("v_mesesPagos.php");
            ?>

        </details>

        <details>
            <summary>Meses Saldados</summary>
            <?php

            include("v_mesesSaldados.php");
            ?>
        </details>



    </div>
<!-- INICIO MENSUALIDAD -->

    <div class="modal__Nuevo" id="modalMensualidad">


        <div class="flex justify-end items-end">
            <div class="w-10 bg-red-500 rounded-full cursor-pointer p-2" id="closeModalMensualidad">
                <img src="../../../images/icons/error.svg" class="filtro-blanco" alt="Cerrar" title="Cerrar">
            </div>
        </div>


        <?php

        include_once('v_mensualidad.php');
        ?>


    </div>
      
    <!-- FINAL MENSUALIDAD -->




</div>

</body>
<script type="text/javascript" src="../../../javascript/horario/mostrarModal.js"></script>
<!-- Llamado JavaScriptEstudiantes -->
<script type="text/javascript" src="../../../javascript/estudiantesPagos.js"></script>
<script type="text/javascript" src="../../../javascript/mensualidad.js"></script>
<script type="text/javascript" src="../../../javascript/pagos.js"></script>
<script src="../../../javascript/jquery-3.7.1.min.js"></script>

</html>