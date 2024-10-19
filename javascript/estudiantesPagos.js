//Regex solo numeros enteros sin .
const regexSoloNumeros = /^\d+$/;
const minimoNumeros=/^\d{11,}$/;
// Modal Añadir

// Modal Pagos

// Modal Mostrar Más



// Modal Pago Específico

// Eventos para abrir y cerrar los modales
//MODAL DE REGISTRO ESTUDIANTE REPRESENTANTE
openModalAñadir.addEventListener('click', () => {
    modalAñadir.showModal(); // Abrir el modal
});

closeModalAñadir.addEventListener('click', () => {
    document.getElementById("formRegistroEstudiante").reset();
    modalAñadir.close(); // Cerrar el modal
});
openModalMensualidad.addEventListener('click', () => {
    modalMensualidad.showModal(); // Abrir el modal
});

closeModalMensualidad.addEventListener('click', () => {
    modalMensualidad.close(); // Cerrar el modal
});


openModalPagos.addEventListener('click', () => {
    modalPagos.showModal(); // Abrir el modal
});

closeModalPagos.addEventListener('click', () => {
    modalPagos.close(); // Cerrar el modal
});





document.getElementById('closePagosEspecificos').addEventListener('click', () => {
    const modal = document.getElementById('modalPagosEspecificos');
    modal.close();
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
                    showToast(data.success);
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

//Parametro para buscar la pagina para que lo recargue ahi
function getQueryParam(param) {
    const urlParams = new URLSearchParams(window.location.search);
    return urlParams.get(param);
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
    const cedulaEstudianteActual=document.querySelector('#cedulaEstudianteActual').value



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
      if (!regexSoloNumeros.test(cedulaEstudiante) || !regexSoloNumeros.test(cedulaRepresentante) && !regexSoloNumeros.test(telefono))  {
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
            cedulaEstudianteActual:cedulaEstudianteActual,
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
                datosEstudiantes: datosEstudiantes,
                pagina_actual: getQueryParam('pagina') || 1 
            },
            success: function (response) {
                try {
                    const data = JSON.parse(response);
                    
                    if (data.status === 'success') {
                        // Mostrar el toast de éxito
                        showToast("Formulario enviado correctamente", true);
            
                        // Actualizar el contenido de la tabla con el nuevo HTML
                        document.getElementById('tablaEstudiante').innerHTML = data.html;
                        
                      
                        //Funciones de Formatear en Carpeta horario y mostrarModal.js
                        formatearCedulas();
                        formatearNumerosCelular();
                        
               
                        // Recargar la página manteniendo el parámetro de página actual
                 
                    } else {
                        // Mostrar mensaje de error del servidor
                        showToast("Error fas: " + data.message, false);
                    }
                } catch (mensageError) {
                    // Capturar errores de JSON.parse o formato inválido
                    console.error('Error al procesar la respuesta:', mensageError);
                    showToast("Estudiante ya Registrado", false);
                }
            },
            error: function (error) {
                console.error('Error al enviar los datos:', error);
                showToast("Hubo un error al enviar los datos", false);
            }
        });
    }
    //Hago otro Else if para que pueda mostrar el mensaje de que deben de ser solo numeros
    else if (!regexSoloNumeros.test(cedulaEstudiante) || !regexSoloNumeros.test(cedulaRepresentante))  {
        showToast('Los Campos de Cedulas deben Ser Numeros', false);

    }

    else {
        showToast('Por favor, llena todos los campos.', false);
    }
}

// Función para actualizar la tabla



// Función para llenar el formulario y abrir el modal al modificar
function llenarFormulario(element) {
    // Obtener los datos del atributo 'data-datos'
    const datos = JSON.parse(element.getAttribute('data-datos'));
    console.log(datos);
    

    // Rellenar los campos del formulario con los datos recibidos
    document.querySelector('#cedulaEstudiante').value = datos.cedula_estudiante || '';
    document.querySelector('#cedulaRepresentante').value = datos.cedula_representante || '';
    document.querySelector('#nombres').value = datos.nombres_estudiante || '';
    document.querySelector('#apellidos').value = datos.apellidos_estudiante || '';
    document.querySelector('#nombresRepresentante').value = datos.nombres_representante || '';
    document.querySelector('#apellidosRepresentante').value = datos.apellidos_representante || '';
    document.querySelector('#telefono').value = datos.telefono || '';
    document.querySelector('#telefonoDomicilio').value = datos.telefono_2 || '';
    document.querySelector('#direccion').value = datos.direccion || '';
    document.querySelector('#correo').value = datos.correo || '';
      // Llenar los select de año y sección (asegurándote de que los valores coincidan)
      const anoEscolar = document.querySelector('#anoEscolar');
      const anoSeccion = document.querySelector('#anoSeccion');
  
     // Verificar si el valor existe en las opciones del select, si no, dejar la opción por defecto
      if (anoEscolar.querySelector(`option[value="${datos.ano}"]`)) {
        anoEscolar.value = datos.ano;
    } else {
        anoEscolar.value = ''; // Opción predeterminada
    }

    if (anoSeccion.querySelector(`option[value="${datos.seccion}"]`)) {
        anoSeccion.value = datos.seccion;
    } else {
        anoSeccion.value = ''; // Opción predeterminada
    }

    const cedulaEstudianteActual = datos.cedula_estudiante || '';
    const cedulaEstudianteNuevo = document.querySelector('#cedulaEstudiante').value; 

    document.querySelector('#cedulaEstudianteActual').value = cedulaEstudianteActual;

    // Abrir el modal
    modalAñadir.showModal();
}


//MODAL PAGO ESPECIFICO
//AL agregar los pagos de este registor no olvidar los ATRIBUTOS
function openPagoEspecificoModal(cedulaEstudiante, nombresEstudiante, apellidosEstudiante, cedulaRepresentante,nombres_representante,apellidos_representante) {
    const modal = document.getElementById('modalPagosEspecificos');
    
    // Actualizar los elementos dentro del modal con los valores recibidos

    //AQUI SE ESTABLENCE LAS VARIABLES QUE SE MOSTRARAN EN EL MODAL PAGO REPRESENTANTE
    document.getElementById('nombresEstudianteRegistroPago').textContent = `${nombresEstudiante} ${apellidosEstudiante}`;
    //CEDULA ESTUDIANTE REGISTRO PAGO
    document.getElementById('cedulaEstudianteRegistroPago').textContent = ` ${cedulaEstudiante}`;
    //NOMBRE REPRESENTANTE REGISTRO PAGO
    document.getElementById('nombresRepresentanteRegistroPago').textContent = `${nombres_representante}  ${apellidos_representante}`;
     //CEDULA ESTUDIANTE REPRESENTANTE
    document.getElementById('cedulaRepresentanteRegistroPago').textContent = ` ${cedulaRepresentante}`;
    
    // Mostrar el modal
    modal.showModal();
}

// Función para abrir el modal y mostrar los datos
function openModalMostrarMasDatos(event) {
    const datos = JSON.parse(event.target.getAttribute('data-datos')); // Obtén los datos del atributo data-datos
    console.log(datos); // Muestra los datos en consola

    // Aquí puedes usar los datos para mostrar en el modal
    document.getElementById('DatosCompletosMostrarMas').textContent = `
        Cédula Estudiante: ${datos.cedula_estudiante}
        Nombres Estudiante: ${datos.nombres_estudiante}
        Apellidos Estudiante: ${datos.apellidos_estudiante}
        Nombres Representante: ${datos.nombres_representante}
        Apellidos Representante: ${datos.apellidos_representante}
        Teléfono: ${datos.telefono}
    `;

    modalMostrarMas.showModal(); // Abre el modal
}

// Obtener el modal y el botón de cerrar por su ID

const closeBtn = document.getElementById('closeMostrarMas');

// Cerrar el modal al hacer clic en el botón de cerrar (X)
closeBtn.addEventListener('click', () => {
    modalMostrarMas.close(); // Cierra el modal
});



document.querySelectorAll('.numeroMax').forEach(function(input) {
    input.addEventListener('input', function(e) {
        const maxLength = e.target.getAttribute('maxlength');
        const value = e.target.value;
        
        if (value.length > maxLength) {
            e.target.value = value.slice(0, maxLength);
        }
    });
});