//Regex solo numeros enteros sin .
const regexSoloNumeros = /^\d+$/;
const minimoNumeros=/^\d{11,}$/;
let globalDataEstudianteRepresentante={}
// Modal Añadir

// Modal Pagos

// Modal Mostrar Más



// Modal Pago Específico
const openModalAñadir = document.getElementById('openModalAñadir');
const closeModalAñadir = document.getElementById('closeModalAñadir');
const modalAñadir = document.getElementById('modalAñadir');




// Eventos para abrir y cerrar los modales
//MODAL DE REGISTRO ESTUDIANTE REPRESENTANTE
openModalAñadir.addEventListener('click', () => {
    modalAñadir.classList.add('show');// Abrir el modal
    document.querySelector(".modal__Oscuro").style.display = "block";
});

closeModalAñadir.addEventListener('click', () => {
    document.getElementById("formRegistroEstudiante").reset();
    modalAñadir.classList.remove('show'); // Cerrar el modal // Cerrar el modal
    document.querySelector(".modal__Oscuro").style.display = "none";
});

//MODALES SALDADOS Y PAGO

openModalMesesPS.addEventListener('click', () => {
    modalMesesPS.classList.add('show');// Abrir el modal
    document.querySelector(".modal__Oscuro").style.display = "block";
});
closeMesesPS.addEventListener('click', () => {

    modalMesesPS.classList.remove('show'); // Cerrar el modal 
    document.querySelector(".modal__Oscuro").style.display = "none";
});
//MODALES SALDADOS Y PAGO


openModalPagos.addEventListener('click', () => {
    modalPagos.showModal(); // Abrir el modal
});

closeModalPagos.addEventListener('click', () => {
    modalPagos.close(); // Cerrar el modal
});





document.getElementById('closePagosEspecificos').addEventListener('click', () => {
    const modal = document.getElementById('modalPagosEspecificos');
    modal.classList.remove('show');
    document.querySelector(".modal__Oscuro").style.display = "none";
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

// ESTO ES PARA COLOCAR S
 // Seleccionar elementos
 const nuevoInput = document.getElementById('nuevoRepresentante');
 const existenteInput = document.getElementById('existenteRepresentante');
 const cedulaInput = document.getElementById('cedulaRepresentante');
 const volverModificar=document.getElementById('volverModificacionRepresentante');
 const nuevoImg = nuevoInput.nextElementSibling;
 const existenteImg = existenteInput.nextElementSibling;
 const RepresentanteExistente= document.querySelectorAll('.modificacionRepresentante');
 const mostraRadioRepresentantes = document.querySelectorAll('.mostrarRadiosRepresentantes');
 // Imágenes alternas para los estados
 const imgSeleccionado = '../../../images/icons/checkRadius.svg';
 const imgNoSeleccionado = '../../../images/icons/noCheckRadius.svg';


 // Datos de representante
const datosRepresentantesConsultaData = {
    "653261516": {
        nombreRepresentante: "Juan",
        apellidosRepresentantes: "Pérez García",
        telefono: "5551234",
        direccion: "Calle Falsa 123",
        correo: "juan.perez@example.com",
        telefonoDomicilio: "555-5678"
    },
    "87654321": {
        nombreRepresentante: "María",
        apellidosRepresentantes: "Rodríguez López",
        telefono: "555-9876",
        direccion: "Avenida Siempreviva 742",
        correo: "maria.rodriguez@example.com",
        telefonoDomicilio: "5558765"
    },
    "87654325": {
        nombreRepresentante: "Carlos",
        apellidosRepresentantes: "Ramírez Sánchez",
        telefono: "5556543",
        direccion: "Boulevard Los Álamos 85",
        correo: "carlos.ramirez@example.com",
        telefonoDomicilio: "5554321"
    }
};
 // Función para cambiar el input a texto normal o datalist
 function cambiarInput(tipo) {
    //Tomo las Variables para añadirles el Dissable
 
    const nombreRepresentante = document.querySelector('#nombresRepresentante')
    const apellidosRepresentantes = document.querySelector('#apellidosRepresentante')
    const telefono = document.querySelector('#telefono')
    const direccion = document.querySelector('#direccion')
    const correo = document.querySelector('#correo')
    const telefonoDomicilio=document.querySelector('#telefonoDomicilio')

    const campoExistencia=[
     
        nombreRepresentante,
        apellidosRepresentantes,
        telefono,
        direccion,
        correo,
        telefonoDomicilio,
        
    ]
    if (tipo === 'Nuevo') {
      console.log('Presionaste: Nuevo');

      
      cedulaInput.setAttribute('type', 'text');
      cedulaInput.removeAttribute('list'); // Quitar datalist
      RepresentanteExistente.forEach(element => {
        element.classList.add('hidden');
        element.classList.remove('block');
      });
  
      mostraRadioRepresentantes.forEach(element => {
        element.classList.remove('hidden');
        element.classList.add('flex');
      });
      //Contador Del Array para agregarle el Dissable
      campoExistencia.forEach(campo => {
        campo.disabled = false;

    });
  
    } else if (tipo === 'Existente') {
        console.log('Presionaste: Existente');
        campoExistencia.forEach(campo => {
            campo.disabled = true;
        });

        cedulaInput.setAttribute('list', 'cedulaOptions'); // Agregar datalist

        RepresentanteExistente.forEach(element => {
            element.classList.remove('hidden');
            element.classList.add('block');
        });

        mostraRadioRepresentantes.forEach(element => {
            element.classList.add('hidden');
            element.classList.remove('flex');
        });

        // Crear el datalist si no existe ya
        if (!document.getElementById('cedulaOptions')) {
            const dataList = document.createElement('datalist');
            dataList.id = 'cedulaOptions';
            dataList.innerHTML = `
                <option value="653261516">Representante 1</option>
                <option value="87654321">Representante 2</option>
                <option value="87654325">Representante 3</option>
            `;
            cedulaInput.parentNode.appendChild(dataList);
        }

        // Evento oninput para autocompletar campos
        cedulaInput.oninput = function () {
            const valorCedula = cedulaInput.value.trim();

            // Verifica si el valor coincide con alguna clave en `datosRepresentantes`
            if (datosRepresentantesConsultaData[valorCedula]) {
                const datos = datosRepresentantesConsultaData[valorCedula];

                // Rellena los campos con los valores correspondientes
                nombreRepresentante.value = datos.nombreRepresentante;
                apellidosRepresentantes.value = datos.apellidosRepresentantes;
                telefono.value = datos.telefono;
                direccion.value = datos.direccion;
                correo.value = datos.correo;
                telefonoDomicilio.value = datos.telefonoDomicilio;
            }
            else{
                nombreRepresentante.value = "";
                apellidosRepresentantes.value = "";
                telefono.value = "";
                direccion.value = "";
                correo.value = "";
                telefonoDomicilio.value = "";
            }
        };
    }
    if (tipo === 'Regresar') {
        console.log('Presionaste: Regresar');
        cedulaInput.setAttribute('type', 'text');
        cedulaInput.removeAttribute('list');
      
        // Restablecer el estado inicial de las clases
        RepresentanteExistente.forEach(element => {
          element.classList.add('hidden');    // Ocultar
          element.classList.remove('block');  // Quitar 'block' si estaba
        });
      
        mostraRadioRepresentantes.forEach(element => {
          element.classList.remove('hidden'); // Asegurar que se muestren
          element.classList.add('flex');      // Asegurar que sean visibles como flex
        });
      
        // Llamar a la función para cambiar al estado "Nuevo"
        cambiarInput('Nuevo');
        nuevoImg.src = imgSeleccionado;
        existenteImg.src = imgNoSeleccionado;
      }
  }
 

 // Evento de cambio para las opciones de representante
 nuevoInput.addEventListener('click', () => {
    cambiarInput('Nuevo');
    nuevoImg.src = imgSeleccionado;
    existenteImg.src = imgNoSeleccionado;
  });
  
  existenteInput.addEventListener('click', () => {
    cambiarInput('Existente');
    existenteImg.src = imgSeleccionado;
    nuevoImg.src = imgNoSeleccionado;
  });
  volverModificar.addEventListener('click', () => {

    cambiarInput('Regresar');
    nuevoImg.src = imgSeleccionado;
    existenteImg.src = imgNoSeleccionado;
  });
  
//FINAL DE NUEVO Y EXISTENTE

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
                        document.getElementById("formRegistroEstudiante").reset();
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
    document.querySelector('#cedulaEstudiante').value = datos.cedula_estudiante ;
    document.querySelector('#cedulaRepresentante').value = datos.cedula_representante ;
    document.querySelector('#nombres').value = datos.nombres_estudiante ;
    document.querySelector('#apellidos').value = datos.apellidos_estudiante ;
    document.querySelector('#nombresRepresentante').value = datos.nombres_representante ;
    document.querySelector('#apellidosRepresentante').value = datos.apellidos_representante ;
    document.querySelector('#telefono').value = datos.telefono ;
    document.querySelector('#telefonoDomicilio').value = datos.telefono_2 ;
    document.querySelector('#direccion').value = datos.direccion ;
    document.querySelector('#correo').value = datos.correo ;

   


      // Llenar los select de año y sección (asegurándote de que los valores coincidan)
      const anoEscolar = document.querySelector('#anoEscolar');
      const anoSeccion = document.querySelector('#anoSeccion');
      anoEscolar.value = datos.ano;
      anoSeccion.value = datos.seccion;
  
   
    const cedulaEstudianteActual = datos.cedula_estudiante ;
    const cedulaEstudianteNuevo = document.querySelector('#cedulaEstudiante').value; 

    document.querySelector('#cedulaEstudianteActual').value = cedulaEstudianteActual;

    // Abrir el modal
    modalAñadir.classList.add('show');// Abrir el modal
    document.querySelector(".modal__Oscuro").style.display = "block";
}


//MODAL PAGO ESPECIFICO
//AL agregar los pagos de este registor no olvidar los ATRIBUTOS
function openPagoEspecificoModal(event) {
   

     const datos = JSON.parse(event.target.getAttribute('data-datos'));
     
    const modal = document.getElementById('modalPagosEspecificos');
   
    globalDataEstudianteRepresentante=datos;
    
    
    // Actualizar los elementos dentro del modal con los valores recibidos

    //AQUI SE ESTABLENCE LAS VARIABLES QUE SE MOSTRARAN EN EL MODAL PAGO REPRESENTANTE
    document.getElementById('nombresEstudianteRegistroPago').textContent = datos.nombres_estudiante ;
    //CEDULA ESTUDIANTE REGISTRO PAGO
    document.getElementById('cedulaEstudianteRegistroPago').textContent = datos.cedula_estudiante;
    //NOMBRE REPRESENTANTE REGISTRO PAGO
    document.getElementById('nombresRepresentanteRegistroPago').textContent = datos.nombres_representante;
     //CEDULA ESTUDIANTE REPRESENTANTE
    document.getElementById('cedulaRepresentanteRegistroPago').textContent = datos.cedula_representante ;
  
    document.getElementById('direccionRepresentanteRegistroPago').textContent= datos.direccion;
    document.getElementById('telefonoRepresentanteRegistroPago').textContent=datos.telefono;

    
    // Mostrar el modal

    modal.classList.add('show');// Abrir el modal
    document.querySelector(".modal__Oscuro").style.display = "block";
 
}

// Función para abrir el modal y mostrar los datos
function openModalMostrarMasDatos(event) {
    const datos = JSON.parse(event.target.getAttribute('data-datos')); // Obtén los datos del atributo data-datos
    // console.log(datos); // Muestra los datos en consola

    // Aquí puedes usar los datos para mostrar en el modal
    document.getElementById('DatosCompletosMostrarMas').textContent = `
        Cédula Estudiante: ${datos.cedula_estudiante}
        Nombres Estudiante: ${datos.nombres_estudiante}
        Apellidos Estudiante: ${datos.apellidos_estudiante}
        Nombres Representante: ${datos.nombres_representante}
        Apellidos Representante: ${datos.apellidos_representante}
        Teléfono: ${datos.telefono}
        Teléfono 2: ${datos.telefono_2}
    `;
    //Toda esta data Sera para La Incripcion, Se mantedran Guardado de momento
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