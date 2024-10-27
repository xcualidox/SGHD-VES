<div class="table-wrapper min-w-full">
    <div class="flex flex-col sm:flex-row justify-end items-center md:space-x-2 p-4 md:py-2">
        <h1 class="text-xl font-semibold">Mensualidad</h1>
        <!-- Botón para añadir -->
        <div class="bg-gray-100 rounded-full cursor-pointer" id="addRowBtn">
            <img src="../../../images/icons/addIcon.svg" class="w-10 filtro-verde-SinScale" alt="Añadir" title="Añadir">
        </div>
        
        <!-- Formulario de selección del año escolar -->
        <div class="mt-4">
            <select name="AnoEscolarMensualidad" id="AnoEscolarMensualidad" class="formulario-extenso__input">
                <option value="" disabled > ---Selecciona---</option>
                <?php foreach ($anosEscolares as $ano): ?>
                    <option value="<?php echo htmlspecialchars($ano); ?>"><?php echo htmlspecialchars($ano); ?></option>
                <?php endforeach; ?>
            </select>
        </div>
    </div>

    <table class="fl-table" id="mensualidadTable">
        <thead>
            <tr>
                <td>Año Escolar</td>
                <td>Mes</td>
                <td>Monto</td>
                <td class=''>
                    <div class="flex justify-center">
                        <a href="#">
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
<input type="button" id="guardarBtnMensualidad" value="Guardar" class="table_button w-full"  onclick="guardarMensualidad()">