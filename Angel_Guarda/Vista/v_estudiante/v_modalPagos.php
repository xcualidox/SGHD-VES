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
