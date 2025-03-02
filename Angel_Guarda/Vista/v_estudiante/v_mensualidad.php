

    
    <div class="table-wrapper min-w-full   ">
        <div class="flex flex-col sm:flex-row justify-end items-center md:space-x-2 md:py-2">
            <h1 class="text-xl font-semibold">Mensualidad</h1>
            <!-- Botón para añadir -->
            <div class="bg-gray-100 rounded-full cursor-pointer" id="addRowBtn">
                <img src="../../../images/icons/addIcon.svg" class="w-10 filtro-verde-SinScale" alt="Añadir" title="Añadir">
            </div>
            
            <!-- Formulario de selección del año escolar -->
            <div class="mt-4">
                <select name="AnoEscolarMensualidad" id="AnoEscolarMensualidad" class="formulario-extenso__input">
                    <option value="" disabled> ---Año Escolar---</option>
                </select>
            </div>
        </div>
        <div class=" overflow-y-auto     max-h-[400px]">
        <table class="fl-table w-full" id="mensualidadTable">
            <thead>
                <tr>
                    <td>Año Escolar</td>
                    <td>Mes</td>
                    <td>Monto</td>
                    <td class=''>
                        <div class="flex justify-center">
                            <a onclick="redirigirMensualidadPdf()">
                                <img src="../../../images/icons/pdf.svg" class="w-10 filtro-blanco" alt="Reporte" title="Reporte">
                            </a>
                        </div>
                    </td>
                </tr>
            </thead>
            <tbody id="tbody_mensualidad">
                <!-- Filas generadas dinámicamente -->
            </tbody>
        </table>
        </div>
  

<!-- el onclick es un callback, por eso es asi de largo -->
<input type="button" id="guardarBtnMensualidad" value="Guardar" class="table_button w-full"onclick="guardarMensualidad(function(valor){ano_escolar=document.getElementById('AnoEscolarMensualidad').value ; recargarTablaMensualidad('tbody_mensualidad',ano_escolar);})">