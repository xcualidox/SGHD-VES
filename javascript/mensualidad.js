//Cargar los años escolares al abrir la pagina
window.onload= function () {
    pedirAnosEscolares(
        function(anos_escolares)
        {
            select_anos=document.getElementById('AnoEscolarMensualidad');

            for (let i = 0; i < anos_escolares.length; i++) {
                nueva_option=document.createElement('option');

                //Obtener solo los valores del diccionario
                valores = Object.values(anos_escolares[i]);

                nueva_option.value=valores[0];
                nueva_option.innerHTML=valores[1];

                //ano activo:
                nueva_option.setAttribute('data-info',valores[2]);

                select_anos.appendChild(nueva_option);
            }
        });
}

openModalMensualidad.addEventListener('click', () => {
    modalMensualidad.showModal(); // Abrir el modal
    let ano_escolar=document.getElementById('AnoEscolarMensualidad').value;
    recargarTablaMensualidad('tbody_mensualidad',ano_escolar);
});

closeModalMensualidad.addEventListener('click', () => {
    modalMensualidad.close(); // Cerrar el modal
});


AnoEscolarMensualidad.addEventListener('change', () => {
    let ano_escolar=document.getElementById('AnoEscolarMensualidad').value;
    recargarTablaMensualidad('tbody_mensualidad',ano_escolar);
});

mes = document.getElementById('mes');
mes.addEventListener('click', (event) => {
    event.stopPropagation();
});

//Ejemplo de uso de esta funcion:
//
//  crearSelect( ['opcion1','opcion2'], 1,  [ {'value': 1, 'id':'select'}, {'value':2, 'name':'XD'} ], )


//"seleccionado" funciona como Indice

//no se pa q hice esto mano help X'''''d se me fue como una hora en esta pendejada, ahi la dejo por si sirve x'''''d

function crearSelect(options = [], seleccionado, parametros_option = [{}], parametros_select = {}) {
    const nuevo_select = document.createElement('select');

    for (let i = 0; i < options.length; i++) {
        //se crea la opcion
        const nuevo_option = document.createElement('option');
        
        if (seleccionado == options[i]) {
            nuevo_option.selected = true;
        }

        //Aplicar los parametros de option
        if (parametros_option.length != 0){

            for (const key in parametros_option) {
                
                nuevo_option.setAttribute(key, parametros_option[key])
                
            }
        }

        nuevo_select.appendChild(nuevo_option);
    }

    //Aplica los parametros del select
    if(parametros_select.length != 0){

        for(const key in parametros_select){
            nuevo_select.setAttribute(key,parametros_select[key])
        }

    }

    return nuevo_select;
}

function eliminarMensualidad(id, callback) {    
    $.ajax({
    url: '../../Control/c_mensualidad.php', 
    type: 'POST',
    data: { id_mensualidad: id },
    dataType: 'json',  // Esperamos una respuesta JSON
    success: function(response) {
        // Manejar la respuesta del servidor
        if (response.success) {
            showToast('Eliminado correctamente', true);
            callback(response.success);
        } else {
            showToast('Error al eliminar, verifique que la mensualidad no esté en uso', false);
            console.log(response);
            callback(null)
        }
    },
    error: function(jqXHR, textStatus, errorThrown) {
        console.error('Error en la solicitud AJAX:', textStatus, errorThrown);
        console.log('Respuesta del servidor:', jqXHR.responseText);
        // Aquí puedes agregar más depuración si la respuesta no es JSON válido
        showToast('Error en la comunicación con el servidor.', false);
        callback(null)
    }
});   
    
}

function recargarTablaMensualidad(tbody_id, ano_escolar = undefined) {

    vaciarTabla(tbody_id);
    let resultados;
    
    //establece los parametros de insertarTr
    let parametros = [
        '<input disabled="" type="text" class=" formulario-extenso__input" value="?" readonly="">',
    
        `<select class="formMensu formulario-extenso__input month-select" value='?'>
                <option value="" selected disabled>Seleccionar mes...</option>
                <option value="inscripcion">Inscripción</option>
                <option value="enero">Enero</option>
                <option value="febrero">Febrero</option>
                <option value="marzo">Marzo</option>
                <option value="abril">Abril</option>
                <option value="mayo">Mayo</option>
                <option value="junio">Junio</option>
                <option value="julio">Julio</option>
                <option value="agosto">Agosto</option>
                <option value="septiembre">Septiembre</option>
                <option value="octubre">Octubre</option>
                <option value="noviembre">Noviembre</option>
                <option value="diciembre">Diciembre</option>
            </select>
            <p class="month-count text-xl font-bold  ml-4 mb-4">1</p>`,
        
            '<input type="number" class="formMensu formulario-extenso__input" maxlength="8" placeholder="Monto" value="?">',

            `<div class='flex justify-center items-center ' style='margin-top: 15px' id="quitarBotonMens">
                <img src='../../../images/icons/removeIcon.svg' class='w-10 h-8 filtro-rojo-SinScale cursor-pointer' alt='Borrar' title='Borrar' data-info='?' onclick='eliminarMensualidad("?", function(mensualidad){
            recargarTablaMensualidad("tbody_mensualidad");})'>
            </div>`
            
        
    ]

    //Pide la mensualidad del controlador y la almacena en la variable "resultados", es un callback
    pedirMensualidad(ano_escolar,
        function(mensualidad){
            if (mensualidad){

                let resultados = mensualidad;
                //Inserta el nuevo TR
                insertarTr(tbody_id, resultados, parametros);

                //Setea de nuevo los Select porque no quiere agarrarse el value='' al crear el elemento, sendo gei vale
                let tabla=document.querySelector('#mensualidadTable');
                let selects=tabla.querySelectorAll('select');

                for (let i = 0; i < selects.length; i++) {
                    selects[i].value=resultados[i]['mes'];
                }
            //Mostrar boton de guardar
                const select_ano_escolar = document.getElementById('AnoEscolarMensualidad');

                //Agarrar el nombre del select del año escolar en vez del id
                const selected = select_ano_escolar[select_ano_escolar.selectedIndex]
                const es_activo = selected.dataset.info;
                if(es_activo < 1){
                    desactivarGuardarButton();
                }
                else{
                    activarGuardarButton();
                }

                updateMonthCounts();
            }
        }
    );
}



function vaciarTabla(tbody_id) {
    tbody=document.getElementById(tbody_id);
    tbody.innerText='';
}
//esta funcion esta hecha para que sea universal y la podamos usar donde queramos

//Formato:
//insertarTr(id_del_tbody, td_de_la_tabla, parametro_extra)

//El parametro_extra funciona para reemplazar texto en varios strings similar a las funciones del modelo,
//en este caso esta configurado para reemplazar signos de interrogación '?'


//Ejemplo:
//insertarTr('tbodyid',['Rafael','Molina','27216803],['Nombre: ?','Apellido: ?', 'Cedula: ?'])

//El ejemplo insertaría una fila de la tabla así:
// Campo 1        | Campo 2          | Campo 3          |
// Nombre: Rafael | Apellido: Molina | Cedula: 27216803 |

//Está hecho así para poder insertar codigo html como inputs con variables

function insertarTr(tbody_id, array = [], extra_parametros = []) {

    if (array.length === 0){
        console.log('Array Vacía');
        return;
    }

    const tbody=document.getElementById(tbody_id);

    for (let i = 0; i < array.length; i++) {

        //Primer fase de Array
        let nueva_columna = document.createElement('tr');

        //Agarra solo los valores del diccionario
        let valores = Object.values(array[i]);

        for (let i2 = 0; i2 < valores.length; i2++) {
        
            //Campos especificos
            const nuevo_campo = document.createElement('td');

            //Eliminar si se va a reutilizar la funcion
            if(i2==1){
                nuevo_campo.setAttribute('class','flex items-center justify-center');
            }

            if (extra_parametros.length != 0) {

                let parametro = extra_parametros[i2];
                nuevo_campo.innerHTML = parametro.split('?').join(valores[i2])

            }else{
                nuevo_campo.innerHTML = valores[i2];
            }
            nueva_columna.appendChild(nuevo_campo);
        }
        
        tbody.appendChild(nueva_columna);
    }
    
}

function pedirMensualidad(ano_escolar = '%%', callback) {
    $.ajax({
        url: '../../Control/c_mensualidad.php', 
        type: 'POST',
        data: { anoescolar: ano_escolar },
        dataType: 'json',  // Esperamos una respuesta JSON
        success: function(response) {
            // Manejar la respuesta del servidor
            if (response.success) {
                //console.log(response.mensualidad) 
                callback(response.mensualidad); //response.mensualidad es lo mismo que usar response['mensualidad']
            } else {
                showToast('Error al obtener los datos de mensualidad', false);
                callback(null);
            }
        },
        error: function(jqXHR, textStatus, errorThrown) {
            console.error('Error en la solicitud AJAX:', textStatus, errorThrown);
            console.log('Respuesta del servidor:', jqXHR.responseText);
            // Aquí puedes agregar más depuración si la respuesta no es JSON válido
            showToast('Error en la comunicación con el servidor.', false);
            callback(null);
        }
    })   
}

function pedirAnosEscolares(callback) {
    $.ajax({
        url: '../../Control/c_mensualidad.php', 
        type: 'POST',
        data: { agarrar_anos: true },
        dataType: 'json',  // Esperamos una respuesta JSON
        success: function(response) {
            // Manejar la respuesta del servidor
            if (response.success) {
                console.log(response) 
                callback(response.anos_escolares);
            } else {
                console.log(response);
                showToast('Error al obtener los Años Escolares', false);
                callback(null);
            }
        },
        error: function(jqXHR, textStatus, errorThrown) {
            console.error('Error en la solicitud AJAX:', textStatus, errorThrown);
            console.log('Respuesta del servidor:', jqXHR.responseText);
            // Aquí puedes agregar más depuración si la respuesta no es JSON válido
            showToast('Error en la comunicación con el servidor.', false);
            callback(null);
        }
    })   
}

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
    const select_ano_escolar = document.getElementById('AnoEscolarMensualidad');
    
    //Agarrar el nombre del select del año escolar en vez del id
    const selected = select_ano_escolar[select_ano_escolar.selectedIndex]
    const innertext_select = selected.innerText;
    return innertext_select;
}




// Función que crea una nueva fila vacía con inputs
function createEmptyRow(selectedAnoEscolar) {
    const nuevaFila = document.createElement('tr');
    nuevaFila.innerHTML = `
        <td><input disabled type="text" class=" formulario-extenso__input" value="${selectedAnoEscolar}" readonly></td>
        <td class="flex items-center justify-center">
            <select class="formMensu formulario-extenso__input month-select">
                <option value="" disabled selected>Seleccionar mes...</option>
                <option value="inscripcion">Inscripción</option>
                <option value="enero">Enero</option>
                <option value="febrero">Febrero</option>
                <option value="marzo">Marzo</option>
                <option value="abril">Abril</option>
                <option value="mayo">Mayo</option>
                <option value="junio">Junio</option>
                <option value="julio">Julio</option>
                <option value="agosto">Agosto</option>
                <option value="septiembre">Septiembre</option>
                <option value="octubre">Octubre</option>
                <option value="noviembre">Noviembre</option>
                <option value="diciembre">Diciembre</option>
            </select>
            <p class="month-count text-xl font-bold  ml-4 mb-4">1</p>
        </td>
        <td><input type="number" class="formMensu formulario-extenso__input" maxlength="8" placeholder="Monto"></td>
        <td>
            <div class='flex justify-center items-center ' style='margin-top: 15px' id="quitarBotonMens">
                <img src='../../../images/icons/removeIcon.svg' class='w-10 h-8 filtro-rojo-SinScale cursor-pointer' alt='Borrar' title='Borrar' data-info=''>
            </div>
        </td>
    `;
    return nuevaFila;
}

function guardarMensualidad(callback) {
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
        // Capturar el ID
        const id_mensualidad = row.querySelector('img').dataset.info;

        if (!selectedMonth || !amount) {
            allFieldsFilled = false;  // Si algún campo está vacío, cambia la variable a falso
        }

        // Si hay un mes y un monto, agregar los datos al array
        if (selectedMonth && amount) {
            dataToSend.push({
                mes: selectedMonth,
                monto: amount,
                id: id_mensualidad
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
        let anoescolar = document.getElementById('AnoEscolarMensualidad').value;
        // Enviar los datos mediante AJAX usando jQuery
        $.ajax({
            url: '../../Control/c_mensualidad.php',  // Cambia esto a la URL de tu backend
            type: 'POST',
            data: { mensualidades: JSON.stringify(dataToSend),  ano_escolar: anoescolar},
            dataType: 'json',  // Esperamos una respuesta JSON
            success: function(response) {
                // Manejar la respuesta del servidor
                let intentos = response.success.length;
                let exitos = 0;
                console.log(response);

                //Calcular los exitos
                for (let i = 0; i < response.success.length; i++) {

                    if(response.success[i]){
                        exitos++;
                    }
   
                }


                showToast(exitos + ' Éxitos de ' + intentos + ' intentos.', true);
                    callback(true)
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
    if (guardarBtn.style.display == 'none') {
        guardarBtn.style.display = 'block'; // Muestra el botón
    } else {
        guardarBtn.style.display = 'none'; // Oculta el botón
    }
}

function activarGuardarButton() {
    const guardarBtn = document.getElementById('guardarBtnMensualidad');
    guardarBtn.style.display = 'block'; // Muestra el botón
}

function desactivarGuardarButton() {
    const guardarBtn = document.getElementById('guardarBtnMensualidad');
    guardarBtn.style.display = 'none'; // Muestra el botón
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

// Evento de clic para añadir la fila vacía
document.getElementById('addRowBtn').addEventListener('click', addEmptyRow);