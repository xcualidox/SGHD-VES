<summary>Meses Pagos</summary>
            <div class="content__details">
                <div class="flex flex-col sm:flex-row justify-end items-center md:space-x-2 p-4 md:py-2">

                    <div class="bg-gray-100 rounded-full cursor-pointer" id="openAñadirPago">
                        <img src="../../../images/icons/añadir.svg" class="w-10 filtro-verde" alt="openAñadirPago" title="openAñadirPago">
                    </div>
                    <!-- FORMULARIO BUSQUEDA-->
                    <form method="GET" action="" class="flex items-center space-x-2">
                        <select name="campo" class='capitalize border-solid border-2  border-black' id="selectMesesPagos" name="listar" p class="border rounded px-2 py-1 w-auto">
                        </select>

                        <input id="inputTextoMesesPagos" type="text" name="listar" placeholder="Buscar..." class="border rounded px-2 py-1 mb-2 md:mb-0">

                        <button id='botonBuscarMesesPagos' type="button" class="bg-gray-100 rounded-full">
                            <img src="../../../images/icons/buscar.svg" class=" w-20 filtro-verde" alt="Buscar" title="Buscar">
                        </button>
                    </form>

                    <!-- Botón para limpiar los filtros -->

                </div>
                <div class="table-wrapper min-w-full">
                    <table class="fl-table">
                        <thead id="theadMesesPagos">
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
                        <!-- CUERPO MESES PAGOS -->
                        <tbody id="tbodyMesesPagos">

             
                        </tbody>
                    </table>
                    <!-- Mostrando El total de Paginas -->

                      <div class="paginacion" id="paginacionContainerMesesPagos"></div>

                </div>
            </div>