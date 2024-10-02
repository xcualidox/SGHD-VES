// Modal Añadir
const modalAñadir = document.querySelector('#modalAñadir');
const openModalAñadir = document.querySelector('#openModalAñadir');
const closeModalAñadir = document.querySelector('#closeModalAñadir');

// Modal Pagos
const modalPagos = document.querySelector('#modalPagos');
const openModalPagos = document.querySelector('#openModalPagos');
const closeModalPagos = document.querySelector('#closeModalPagos');

// Modal Mostrar Más
const modalMostrarMas = document.querySelector('#modalMostrarMas');
const openModalMostrarMas = document.querySelector('#openMostrarMas');
const closeModalMostrarMas = document.querySelector('#closeMostrarMas');

// Modal Pago Específico
const modalPagoEspecifico = document.querySelector('#modalPagosEspecificos');
const openModalPagoEspecifico = document.querySelector('#openPagoEspecifico');
const closeModalPagoEspecifico = document.querySelector('#closePagosEspecificos');

// Eventos para abrir y cerrar los modales
openModalAñadir.addEventListener('click', () => {
    modalAñadir.showModal(); // Abrir el modal
});

closeModalAñadir.addEventListener('click', () => {
    modalAñadir.close(); // Cerrar el modal
});

openModalPagos.addEventListener('click', () => {
    modalPagos.showModal(); // Abrir el modal
});

closeModalPagos.addEventListener('click', () => {
    modalPagos.close(); // Cerrar el modal
});

openModalMostrarMas.addEventListener('click', () => {
    modalMostrarMas.showModal(); // Abrir el modal
});

closeModalMostrarMas.addEventListener('click', () => {
    modalMostrarMas.close(); // Cerrar el modal
});

openModalPagoEspecifico.addEventListener('click', () => {
    modalPagoEspecifico.showModal(); // Abrir el modal
});

closeModalPagoEspecifico.addEventListener('click', () => {
    modalPagoEspecifico.close(); // Cerrar el modal
});

function cargarDolar() {
    $.ajax({
        url: '../../Control/c_dolar.php', // Ruta al controlador PHP
        method: 'GET',                   // Método GET para consultar
        dataType: 'json',                // Esperamos una respuesta en formato JSON
        success: function (data) {
            // Establece el valor del input con el valor del dólar desde la respuesta del controlador
            if (data.DolarBCV) {
                $('#DolarBCV').val(data.DolarBCV);
            } else {
                console.error('Error en los datos recibidos:', data);
            }
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.error('Error al cargar los datos del dólar:', textStatus, errorThrown);
        }
    });
}

// Función para actualizar el valor del dólar al hacer onblur en el input
function actualizarDolar() {
    const input = document.getElementById('DolarBCV').value;
    const convertidor = parseFloat(input);

    if (convertidor > 0) {
        $.ajax({
            url: '../../Control/c_dolar.php', // Ruta al controlador PHP
            method: 'POST',
            dataType: 'json', // Tipo de datos esperado
            contentType: 'application/json', // Tipo de contenido que se envía
            data: JSON.stringify({ DolarBCV: convertidor }), // Datos enviados al servidor en formato JSON
            success: function (data) {
                if (data.success) {
                    console.log('Respuesta del servidor:', data);
                    cargarDolar(); // Recargar el valor actualizado
                } else {
                    console.error('Error en la actualización:', data.error);
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.error('Error al actualizar el valor:', textStatus, errorThrown);
            }
        });
    } else {
        console.error("El valor debe ser mayor a 0");
        cargarDolar();
    }
}


// Llamar a la función cargarDolar cuando se cargue la página
window.onload = cargarDolar();

function calcular() {
    const test = document.getElementById("DolarBCV").value;
    return test;
}

//FORMULARIO DE REGISTRO ESTUDIANTE

function registrarFormularioEstudiante() {


    const cedulaEstudiante = document.querySelector('#cedulaEstudiante').value;
    const cedulaRepresentante = document.querySelector('#cedulaRepresentante').value;
    const nombres = document.querySelector('#nombres').value
    const apellidos = document.querySelector('#apellidos').value

    const nombreRepresentante = document.querySelector('#nombresRepresentante').value
    const apellidosRepresentantes = document.querySelector('#apellidosRepresentante').value
    const telefono = document.querySelector('#telefono').value
    const direccion = document.querySelector('#direccion').value
    const correo = document.querySelector('#correo').value
    const anoSeccion = document.querySelector('#anoSeccion').value
    const anoEscolar = document.querySelector('#anoEscolar').value
    const telefonoDomicilio=document.querySelector('#telefonoDomicilio').value

    const campos = [
        cedulaEstudiante,
        nombres,
        apellidos,
        cedulaRepresentante,
        nombreRepresentante,
        apellidosRepresentantes,
        telefono,
        direccion,
        correo,
        anoSeccion,
        anoEscolar
    ];

    let formularioValido = true;

    campos.forEach(function (campo) {
        if (campo.trim() === '') {
            formularioValido = false;
        }
    });


    // Si alguna cédula no es un número, retorna falso
    if (isNaN(cedulaEstudiante) || isNaN(cedulaRepresentante)) {
        formularioValido = false;

    }



    if (formularioValido) {
        // Obtener los datos de los formularios
        const datosRepresentantes = {
            cedulaRepresentante: cedulaRepresentante,
            nombresRepresentante: nombreRepresentante,
            apellidosRepresentante: apellidosRepresentantes,
            telefono: telefono,
            telefonoDomicilio: telefonoDomicilio,
            direccion: direccion,
            correo: correo
        };

        const datosEstudiantes = {
            cedulaEstudiante: cedulaEstudiante,
            nombres:  nombres,
            apellidos: apellidos,
            anoSeccion: anoSeccion,
            anoEscolar: anoEscolar
        };

        // Realizar la solicitud AJAX
        $.ajax({
            url: '../../Control/c_estudiantes.php',
            type: 'POST',
            data: {
                datosRepresentantes: datosRepresentantes,
                datosEstudiantes: datosEstudiantes
            },
            success: function (response) {
                console.log('Respuesta del servidor:', response);
                showToast("Formulario enviado correctamente", true);
            },
            error: function (error) {
                console.error('Error al enviar los datos:', error);
                showToast("Hubo un error al enviar los datos", false);
            }
        });
    }
    else if (isNaN(cedulaEstudiante) || isNaN(cedulaRepresentante)) {
        showToast('Los Campos de Cedulas deben Ser Numeros', false);

    }

    else {
        showToast('Por favor, llena todos los campos.', false);
    }
}
