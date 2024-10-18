function addEmptyRow() {
    const selectedAnoEscolar = getSelectedAnoEscolar();
    if (!selectedAnoEscolar) {
        showToast("Por favor selecciona un año escolar.",false);
        return;
    }

    const tableBody = document.querySelector('#mensualidadTable tbody');
    const nuevaFila = createEmptyRow(selectedAnoEscolar);
    tableBody.appendChild(nuevaFila);
    attachRemoveEvent(nuevaFila);
}

// Función que obtiene el año escolar seleccionado
function getSelectedAnoEscolar() {
    return document.getElementById('AnoEscolarMensualidad').value;
}

// Función que crea una nueva fila vacía con inputs
function createEmptyRow(selectedAnoEscolar) {
    const nuevaFila = document.createElement('tr');
    nuevaFila.innerHTML = `
        <td><input disabled type="text" class="formulario-extenso__input" value="${selectedAnoEscolar}" readonly></td>
        <td>
    <select class="formulario-extenso__input">
                    <option value="" disabled selected>Seleccionar mes...</option>
                    <option value="Inscripción">Inscripción</option>
                    <option value="Enero">Enero</option>
                    <option value="Febrero">Febrero</option>
                    <option value="Marzo">Marzo</option>
                    <option value="Abril">Abril</option>
                    <option value="Mayo">Mayo</option>
                    <option value="Junio">Junio</option>
                    <option value="Julio">Julio</option>
                    <option value="Agosto">Agosto</option>
                    <option value="Septiembre">Septiembre</option>
                    <option value="Octubre">Octubre</option>
                    <option value="Noviembre">Noviembre</option>
                    <option value="Diciembre">Diciembre</option>
                </select>
        </td>
        <td><input type="number" class="formulario-extenso__input" maxlength="8" placeholder="Monto"></td>
        <td>
         <div class='flex justify-center items-center ' id="quitarBotonMens">
                    <img src='../../../images/icons/removeIcon.svg' class='w-8 h-8 filtro-rojo cursor-pointer' alt='Borrar' title='Borrar'>
        </div>
  
    `;
    return nuevaFila;
}

// Función que añade la funcionalidad de remover una fila
function attachRemoveEvent(fila) {
    const quitarBotonMens = fila.querySelector('#quitarBotonMens');
    quitarBotonMens.addEventListener('click', function() {
        fila.remove();
    });
}

// Evento de clic para añadir la fila vacía
document.getElementById('addRowBtn').addEventListener('click', addEmptyRow);