<div id="" class="flex justify-end  items-end ">
            <!-- Botón de Cerrar en la parte superior derecha -->
            <div class=" w-10  bg-red-500 rounded-full cursor-pointer p-2" id="closeModalPagos">
                <img src="../../../images/icons/error.svg" class="filtro-blanco" alt="Cerrar" title="Cerrar">
            </div>
        </div>
<div id="contenedorListaPagos">


        <div class="flex flex-col sm:flex-row justify-end items-center md:space-x-2 p-4 md:py-2">
            <h1 class="text-xl font-semibold mb-2 md:mb-0">Ver Pagos</h1>


            <!-- FORMULARIO BUSQUEDA -->
            <form method="GET" action="" class="flex items-center space-x-2">
                <select name="campo" class='capitalize border-solid border-2  border-black' id="selectPagos" name="listar" p class="border rounded px-2 py-1 w-auto">
                    <option value="">--Seleccionar Filtro--</option>
                </select>

                <input type="text" id="inputTextoPagos" name="listar" placeholder="Buscar..." class="border rounded px-2 py-1 mb-2 md:mb-0">

                <button id='botonBuscarPagos' type="button" class="bg-gray-100 rounded-full">
                    <img src="../../../images/icons/buscar.svg" class=" w-20 filtro-verde" alt="Buscar" title="Buscar">
                </button>
            </form>

            <!-- Botón para limpiar los filtros -->

        </div>
        <div class="table-wrapper min-w-full">
            <table class="fl-table">

                <thead id="theadPagos">
                </thead>

                <tbody id="tbodyPagos">
                </tbody>
                <input type="hidden" id="paginadoVerPagos" value="">
            </table>

    
            <!--MOSTRANDO EL TOTAL DE PAGINAS-->
            <div class="paginacion" id="paginacionContainer"></div>
        </div>
</div>
