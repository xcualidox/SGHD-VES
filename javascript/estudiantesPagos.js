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


function redirigirEstudiantePDF(cedula) {
    const url = `../pdf/estudianteRepresentantePDF.php?cedula=${cedula}`;
    window.open(url, '_blank'); // Abre en una nueva pestaña
}
// Eventos para abrir y cerrar los modales
//MODAL DE REGISTRO ESTUDIANTE REPRESENTANTE
openModalAñadir.addEventListener('click', () => {
    modalAñadir.classList.add('show');// Abrir el modal
    document.querySelector(".modal__Oscuro").style.display = "block";
    cambiarInput('Nuevo');
});

closeModalAñadir.addEventListener('click', () => {
    document.getElementById('cedulaEstudianteActual').value='';
    document.getElementById("formRegistroEstudiante").reset();
    modalAñadir.classList.remove('show'); // Cerrar el modal // Cerrar el modal
    document.querySelector(".modal__Oscuro").style.display = "none";
});



document.getElementById('closePagosEspecificos').addEventListener('click', () => {
    const modal = document.getElementById('modalPagosEspecificos');
    modal.classList.remove('show');
    document.querySelector(".modal__Oscuro").style.display = "none";
});


borrarRepresentante.addEventListener(('click'),()=>{
    cedulaRepresentante=document.getElementById('cedulaRepresentante').value;
    eliminarRepresentante(cedulaRepresentante,()=>{
        limpiarFormRepresentante();
        recargarDatalistRepresentantes();
    });

});

function limpiarFormRepresentante(){
    cedulaRepresentante=document.getElementById('cedulaRepresentante');
    nombresRepresentante=document.getElementById('nombresRepresentante');
    apellidosRepresentante=document.getElementById('apellidosRepresentante');
    telefono=document.getElementById('telefono');
    telefonoDomicilio=document.getElementById('telefonoDomicilio');
    correo=document.getElementById('correo');
    direccion=document.getElementById('direccion');

    cedulaRepresentante.value='';
    nombresRepresentante.value='';
    apellidosRepresentante.value='';
    telefono.value='';
    telefonoDomicilio.value='';
    correo.value='';
    direccion.value='';
};

function eliminarRepresentante(cedula,callback) {    
    showConfirm("¿Está seguro de que desea eliminar este Representante?",()=>{
   
    $.ajax({
        url: '../../Control/c_estudiantes.php',
        type: 'POST',
        data: {
            cedulaEliminarRepresentante: cedula
        },
        success: function (response) {
            try {
                const data = JSON.parse(response);
                
                if (data.status === 'success') {
                    // Mostrar el toast de éxito
                    callback(data);
                    
                } else {
                    // Mostrar mensaje de error del servidor
                    showToast("Error fas: " + data.message, false);
                    callback(null);
                }
            } catch (mensageError) {
                // Capturar errores de JSON.parse o formato inválido
                console.error('Error al procesar la respuesta:', mensageError);
                console.log(response);
                showToast("Problema al procesar la respuesta: ", false);
                callback(null);
            }
        },
        error: function (error) {
            console.error('Error al enviar los datos:', error);
            showToast("Hubo un error al enviar los datos", false);
            callback(null);
        }
    });
});
}

function pedirRepresentanteSingular(cedula, callback){
    
    $.ajax({
        url: '../../Control/c_estudiantes.php',
        type: 'POST',
        data: {
            obtenerRepresentanteUnico: true,
            cedula: cedula
        },
        success: function (response) {
            try {
                const data = JSON.parse(response);

                if (data.status === 'success') {
                    callback(data.response);
                } else {
                    // Mostrar mensaje de error del servidor
                    showToast("Error fas: " + data.message, false);
                    console.log('pedirRepresentante')
                    console.log(data);
                    callback(null);
                }
            } catch (mensageError) {
                // Capturar errores de JSON.parse o formato inválido
                console.error('Error al procesar la respuesta:', mensageError);
                console.log(data);
                showToast("Error al obtener datos del representante", false);
                callback(null);
            }
        },
        error: function (error) {
            console.error('Error al enviar los datos:', error);
            showToast("Hubo un error al enviar los datos", false);
            callback(null);
        }
    });

}

function pedirRepresentanteNombreCedula(callback){
    
    $.ajax({
        url: '../../Control/c_estudiantes.php',
        type: 'POST',
        data: {
            obtenerRepresentanteCedulaNombre: true
        },
        success: function (response) {
            try {
                const data = JSON.parse(response);

                if (data.status === 'success') {
                    callback(data.response);
                } else {
                    // Mostrar mensaje de error del servidor
                    showToast("Error fas: " + data.message, false);
                    console.log('pedirRepresentante')
                    console.log(data);
                    callback(null);
                }
            } catch (mensageError) {
                // Capturar errores de JSON.parse o formato inválido
                console.error('Error al procesar la respuesta:', mensageError);
                console.log(data);
                showToast("Error al obtener datalist de Representante", false);
                callback(null);
            }
        },
        error: function (error) {
            console.error('Error al enviar los datos:', error);
            showToast("Hubo un error al enviar los datos", false);
            callback(null);
        }
    });

}

function EliminarEstudiante(cedula) {    
    showConfirm("¿Está seguro de que desea eliminar este Estudiante?",()=>{
   
    $.ajax({
        url: '../../Control/c_estudiantes.php',
        type: 'POST',
        data: {
            cedulaEliminar: cedula
        },
        success: function (response) {
            try {
                const data = JSON.parse(response);
                
                if (data.status === 'success') {
                    // Mostrar el toast de éxito
                    location.href+'?estado=correcto';
                    location.reload();
             
                } else {
                    // Mostrar mensaje de error del servidor
                    showToast("Error fas: " + data.message, false);
                }
            } catch (mensageError) {
                // Capturar errores de JSON.parse o formato inválido
                console.error('Error al procesar la respuesta:', mensageError);
                console.log(response);
                showToast("Problema al procesar la respuesta: ", false);
            }
        },
        error: function (error) {
            console.error('Error al enviar los datos:', error);
            showToast("Hubo un error al enviar los datos", false);
        }
    });
});
}


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

// Sincronizar con BCV al presionar el botón
function sincronizarConBCV() {
    mostrarSpinner(); // Mostrar spinner mientras se sincroniza
    fetch('../../Control/c_dolar.php?accion=sincronizar') // Asegúrate que esta sea la ruta correcta
        .then(response => response.json())
        .then(data => {
            if (data.DolarBCV) {
                const monto = parseFloat(data.DolarBCV).toFixed(2);
                document.getElementById('DolarBCV').value = monto;

                const fuente = data.fuente === 'local' ? false: true;

                if (fuente) {
                    showToast(`Tasa sincronizada correctamente `);
                } else {
                    showToast(`No Hubo Conexión con el Banco Central `,false);
                    
                }
             
            } else {
                showToast('No se pudo sincronizar el dólar. Verifica tu conexión.');
            }
        ocultarSpinner(); // Ocultar spinner después de la sincronización
        })
        .catch(error => {
            console.warn('Error al sincronizar:', error);
            showToast('Error de red. Usando tasa local.');
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




 // Función para cambiar el input a texto normal o datalist
 function cambiarInput(tipo) {
    //Tomo las Variables para añadirles el Dissable
 
    const nombreRepresentante = document.querySelector('#nombresRepresentante')
    const apellidosRepresentantes = document.querySelector('#apellidosRepresentante')
    const telefono = document.querySelector('#telefono')
    const direccion = document.querySelector('#direccion')
    const correo = document.querySelector('#correo')
    const telefonoDomicilio=document.querySelector('#telefonoDomicilio')

    const borrarRepresentante=document.querySelector('#borrarRepresentante')
    const modificarRepresentanteForm=document.querySelector('#modificarRepresentanteForm')


    const campoExistencia=[
     
        nombreRepresentante,
        apellidosRepresentantes,
        telefono,
        direccion,
        correo,
        telefonoDomicilio,
        
    ]
    function toggleCampos() {
        campoExistencia.forEach(campo => {
            campo.disabled = !campo.disabled;
        });
    }
    modificarRepresentanteForm
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
    
    recargarDatalistRepresentantes();
     // Verifica si el valor coincide con alguna opción en el datalist


    // Evento oninput para autocompletar campos
    cedulaInput.oninput = function () {
        const valorCedula = cedulaInput.value.trim();
        let datalist = document.querySelector('#cedulaOptions');
        let options = Array.from(datalist.children);

        // Verifica si el valor coincide con alguna opción en el datalist
        const match = options.some(option => option.value === valorCedula);
        if (match) {
            // Cambia automáticamente al estado "Existente" si coincide
          
    
            // Muestra los botones de modificar y borrar
            borrarRepresentante.classList.remove('hidden');
            modificarRepresentanteForm.classList.remove('hidden');
    
            // Aquí puedes hacer la solicitud para obtener los datos y rellenar los campos
            pedirRepresentanteSingular(valorCedula, function(datos) {
                nombreRepresentante.value = datos.nombres;
                apellidosRepresentantes.value = datos.apellidos;
                telefono.value = datos.telefono;
                direccion.value = datos.direccion;
                correo.value = datos.correo;
                telefonoDomicilio.value = datos.telefono_2;
            });
              cambiarInput('Existente');
            nuevoImg.src = imgNoSeleccionado;
            existenteImg.src = imgSeleccionado;
        } else {
            // Si no coincide, oculta los botones y limpia los campos
            borrarRepresentante.classList.add('hidden');
            modificarRepresentanteForm.classList.add('hidden');
            
            nombreRepresentante.value = "";
            apellidosRepresentantes.value = "";
            telefono.value = "";
            direccion.value = "";
            correo.value = "";
            telefonoDomicilio.value = "";
        }
    };
    if (tipo === 'Nuevo') {
      console.log('Presionaste: Nuevo');
        borrarRepresentante.classList.add('hidden');
        borrarRepresentante.classList.remove('block');
        modificarRepresentanteForm.classList.add('hidden')
        modificarRepresentanteForm.classList.remove('block')
        volverModificar.classList.add('hidden');
        volverModificar.classList.remove('block');
        window.onload= setMaxDateToday("dateNacimiento");
      cedulaInput.setAttribute('type', 'text');
      cedulaInput.removeAttribute('list'); // Quitar datalist
      //Muestra el boton de Modificar
    
  
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

     
            volverModificar.classList.remove('hidden');
            volverModificar.classList.add('block');
 

        mostraRadioRepresentantes.forEach(element => {
            element.classList.add('hidden');
            element.classList.remove('flex');
        });

        // Crear el datalist si no existe ya
       
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
      modificarRepresentanteForm.addEventListener('click', toggleCampos);
  }


  function setMaxDateToday(inputId) {
    const input = document.getElementById(inputId);
    if (!input) return;

    const hoy = new Date();

    // Formatear fecha a "YYYY-MM-DD"
    const formatoFecha = (fecha) => {
      const año = fecha.getFullYear();
      const mes = String(fecha.getMonth() + 1).padStart(2, "0");
      const día = String(fecha.getDate()).padStart(2, "0");
      return `${año}-${mes}-${día}`;
    };

    const fechaHoy = formatoFecha(hoy);

    input.max = fechaHoy;     // Establece el máximo como hoy
    input.value = fechaHoy;   // Asigna hoy como valor por defecto
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

    cambiarInput('Nuevo');
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
                    console.log(response);
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

function insertarOptionSingular(selectId, diccionario={}) {

    let nueva_option=document.createElement('option');
    for (const entrada in atributos = diccionario){
        if (entrada == 'innerHTML'){
            nueva_option.innerHTML=diccionario[entrada];
        }
        else{
            nueva_option.setAttribute(entrada,diccionario[entrada]);
        }
    }
    select=document.getElementById(selectId);
    select.append(nueva_option);
    
  }

function recargarDatalistRepresentantes(){
    vaciarSelect('cedulaOptions');
    
    pedirRepresentanteNombreCedula(function(representantes){ 
        for (let i = 0; i < representantes.length; i++) {
            const cedula = representantes[i]['cedula_representante'];
            const nombres = representantes[i]['nombres'];
            insertarOptionSingular('cedulaOptions', {value: cedula, innerHTML: nombres});
            
        }

    });
}

// Función para actualizar la tabla


// Función para llenar el formulario y abrir el modal al modificar
function llenarFormulario(element) {

    cambiarInput('Existente');

    // Obtener los datos del atributo 'data-datos'
    const datos = JSON.parse(element.getAttribute('data-datos'));

    //Esto es para que salga el Boton de Modificar y

    borrarRepresentante.classList.remove('hidden');
    modificarRepresentanteForm.classList.remove('hidden');
    


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



    vaciarSelect('mes',{innerHTML: '---Seleccionar Mes---', disabled: '', selected: ''});

    let anoEscolar = document.getElementById('AnoEscolarPago').value;

    //Llenar option con Mensualidad

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
    const datos = JSON.parse(event.target.getAttribute('data-datos'));

    document.getElementById('DatosCompletosMostrarMas').innerHTML = `
    <div class="bg-white rounded-xl shadow-md p-4 w-full">
      <div class="flex flex-wrap w-full gap-y-4">
        <div class="w-full md:w-1/2">
          <span class="font-semibold">Cédula Estudiante:</span>
          <span>${datos.cedula_estudiante}</span>
        </div>
        <div class="w-full md:w-1/2 ">
          <span class="font-semibold">Nombre Estudiante:</span>
          <span>${datos.nombres_estudiante}</span>
        </div>
        <div class="w-full md:w-1/2 ">
          <span class="font-semibold">Apellido Estudiante:</span>
          <span>${datos.apellidos_estudiante}</span>
        </div>
  
        <div class="w-full md:w-1/2">
          <span class="font-semibold">Sección:</span>
          <span>${datos.seccion }</span>
        </div>
        <div class="w-full md:w-1/2">
          <span class="font-semibold">Año Escolar:</span>
          <span>${datos.ano }</span>
        </div>
     <div class="w-full md:w-1/2">
            <span class="font-semibold">Estado:</span>
            <span id="estado-${datos.cedula_estudiante}">
                ${datos.activo == 0 ? "Inactivo" : "Activo"}
            </span>
            <button onclick="cambiarEstado('${datos.cedula_estudiante}')" class="ml-2 text-blue-600 ">
                Cambiar estado
            </button>
            </div>
           <div class="w-full md:w-1/2">
          <span class="font-semibold">Direccion:</span>
          <span>${datos.direccion }</span>
        </div>
      </div>
        <hr class="my-4 border-t-2 border-gray-300" />
    <h1 class="text-lg font-semibold p-5  text-teal-700">Datos del Representante</h1>
        <div class="flex flex-wrap w-full gap-y-4">
  
        <div class="w-full md:w-1/2 ">
          <span class="font-semibold">Nombre Representante: </span>
          <span>${datos.nombres_representante}</span>
        </div>
        <div class="w-full md:w-1/2 ">
          <span class="font-semibold">Apellido Representante:</span>
          <span>${datos.apellidos_representante}</span>
        </div>
              <div class="w-full md:w-1/2 ">
          <span class="font-semibold">Teléfono:</span>
          <span>${datos.telefono}</span>
        </div>
        <div class="w-full md:w-1/2">
          <span class="font-semibold">Teléfono 2:</span>
          <span>${datos.telefono_2 || 'Sin teléfono'}</span>
        </div>
          <div class="w-full md:w-1/2">
          <span class="font-semibold">Correo:</span>
          <span>${datos.correo || 'Sin Registrar'}</span>
        </div>
         </div>
    </div>
  `;

  
    document.getElementById('nombreEstudianteMostrar').textContent = `Nombres Estudiante: ${datos.nombres_estudiante} ${datos.apellidos_estudiante}`;
    document.getElementById('nombreEstudianteMostrar').textContent = `Nombres Estudiante: ${datos.nombres_estudiante} ${datos.apellidos_estudiante}`;
    console.log(datos);
    
    modalMostrarMas.classList.add('show');
    document.querySelector(".modal__Oscuro").style.display = "block";
}

function cambiarEstado(cedula) {
    console.log("Cambiando estado de:", cedula);
  
    $.ajax({
      url: '../../Control/c_estudianteEstado.php',
      type: 'POST',
      contentType: 'application/json',
      data: JSON.stringify({ cedula }),
      dataType: 'json',
      success: function(response) {
        if (response.success) {
          // Cambia el texto en el span según el nuevo estado
          const estadoSpan = document.getElementById(`estado-${cedula}`);
          if (estadoSpan) {
            estadoSpan.textContent = response.nuevo_estado == 0 ? "Inactivo" : "Activo";
          }
        } else {
          alert('Error al cambiar el estado: ' + response.error);
        }
      },
      error: function(xhr, status, error) {
        console.error('Error en la solicitud:', error);
        console.log(xhr.responseText);
        
      }
    });
  }

// Obtener el modal y el botón de cerrar por su ID


// Cerrar el modal al hacer clic en el botón de cerrar (X)
closeMostrarMas.addEventListener('click', () => {

    
    modalMostrarMas.classList.remove('show'); // Cerrar el modal 
    document.querySelector(".modal__Oscuro").style.display = "none";
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