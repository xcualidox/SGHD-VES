// Función que agrega una fila vacía con los inputs
function addEmptyRow() {
    const selectedAnoEscolar = getSelectedAnoEscolar();
    if (!selectedAnoEscolar) {
        showToast("Por favor selecciona un año escolar.", false);
        return;
    }

    const tableBody = document.querySelector('#mensualidadTable tbody');
    const nuevaFila = createEmptyRow(selectedAnoEscolar);
    tableBody.appendChild(nuevaFila);
    attachRemoveEvent(nuevaFila);
    attachMonthChangeEvent(nuevaFila);  // Añadir la verificación de duplicados al seleccionar un mes

    toggleGuardarButton(); // Verificar si mostrar el botón de guardar
}

// Función que obtiene el año escolar seleccionado
function getSelectedAnoEscolar() {
    return document.getElementById('AnoEscolarMensualidad').value;
}




// Función que crea una nueva fila vacía con inputs
function createEmptyRow(selectedAnoEscolar) {
    const nuevaFila = document.createElement('tr');
    nuevaFila.innerHTML = `
        <td><input disabled type="text" class=" formulario-extenso__input" value="${selectedAnoEscolar}" readonly></td>
        <td class="flex items-center justify-center">
            <select class="formMensu formulario-extenso__input month-select">
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
            <p class="month-count text-xl font-bold  ml-4 mb-4">1</p>
        </td>
        <td><input type="number" class="formMensu formulario-extenso__input" maxlength="8" placeholder="Monto"></td>
        <td>
            <div class='flex justify-center items-center ' style='margin-top: 15px' id="quitarBotonMens">
                <img src='../../../images/icons/removeIcon.svg' class='w-10 h-8 filtro-rojo-SinScale cursor-pointer' alt='Borrar' title='Borrar'>
            </div>
        </td>
    `;
    return nuevaFila;
}

function guardarMensualidad() {
    const dataToSend = [];

    // Recorrer todas las filas de la tabla
    const tableBody = document.querySelector('#mensualidadTable tbody');
    const rows = tableBody.querySelectorAll('tr');
    let allFieldsFilled = true;

    rows.forEach(function(row) {
        // Capturar el mes seleccionado
        const selectedMonth = row.querySelector('.month-select').value;
        // Capturar el monto ingresado
        const amount = row.querySelector('input[type="number"]').value;

        if (!selectedMonth || !amount) {
            allFieldsFilled = false;  // Si algún campo está vacío, cambia la variable a falso
        }

        // Si hay un mes y un monto, agregar los datos al array
        if (selectedMonth && amount) {
            dataToSend.push({
                mes: selectedMonth,
                monto: amount
            });
        }
    });

    
    // Verifica que haya datos para enviar
    if (!allFieldsFilled) {
        // Mostrar mensaje de error si algún campo está vacío
        showToast("Por favor completa todos los campos antes de guardar.", false);
        return;
    }
 
    if (dataToSend.length > 0) {
        // Enviar los datos mediante AJAX usando jQuery
        $.ajax({
            url: '../../Control/c_mensualidad.php',  // Cambia esto a la URL de tu backend
            type: 'POST',
            data: { mensualidades: JSON.stringify(dataToSend) },
            dataType: 'json',  // Esperamos una respuesta JSON
            success: function(response) {
                // Manejar la respuesta del servidor
                if (response.success) {
                    showToast('Datos guardados exitosamente', true);
                    console.log(response);
               
                    
                } else {
                    showToast('Error al guardar los datos', false);
                }
            },
            error: function(jqXHR, textStatus, errorThrown) {
                console.error('Error en la solicitud AJAX:', textStatus, errorThrown);
                console.log('Respuesta del servidor:', jqXHR.responseText);
                // Aquí puedes agregar más depuración si la respuesta no es JSON válido
                showToast('Error en la comunicación con el servidor.', false);
            }
        });
    }
}

function toggleGuardarButton() {
    const tableBody = document.querySelector('#mensualidadTable tbody');
    const guardarBtn = document.getElementById('guardarBtnMensualidad');
    
    // Si hay filas en el tbody, mostrar el botón; de lo contrario, ocultarlo
    if (tableBody.querySelectorAll('tr').length > 0) {
        guardarBtn.style.display = 'block'; // Muestra el botón
    } else {
        guardarBtn.style.display = 'none'; // Oculta el botón
    }
}

   


// Función que añade la funcionalidad de remover una fila
function attachRemoveEvent(fila) {
    const quitarBotonMens = fila.querySelector('#quitarBotonMens');
    quitarBotonMens.addEventListener('click', function() {
        fila.remove();
        updateMonthCounts(); // Actualiza los contadores después de eliminar una fila
        toggleGuardarButton();
    });
}

// Función para adjuntar el evento de cambio en los selects
function attachMonthChangeEvent(fila) {
    const selectElement = fila.querySelector('.month-select');
    selectElement.addEventListener('change', function() {
        updateMonthCounts();  // Actualizar los contadores cada vez que se seleccione un mes
    });
}

// Función para actualizar los contadores de los meses seleccionados
function updateMonthCounts() {
    const selects = document.querySelectorAll('.month-select');
    const counts = {}; // Para almacenar cuántas veces se ha seleccionado cada mes

    // Contar cuántas veces se selecciona cada mes y asignar un número a cada select
    selects.forEach(select => {
        const selectedValue = select.value;
        if (selectedValue) {
            counts[selectedValue] = (counts[selectedValue] || 0) + 1;  // Incrementa el contador del mes
            const parentTd = select.closest('td');
            const countElement = parentTd.querySelector('.month-count');
            countElement.textContent = counts[selectedValue]; // Asigna el número correspondiente a cada fila
        }
    });
}


toggleGuardarButton();

// Evento de clic para añadir la fila vacía
document.getElementById('addRowBtn').addEventListener('click', addEmptyRow);