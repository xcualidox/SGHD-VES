botonesPagos=document.querySelectorAll("img[alt='Pago Especifico']"); //Todos los botones de Pago de Estudiante

//Activar boton al terminar de cargar la pagina (creo que no sirve xd)
window.addEventListener("load", function() {
  for (let i = 0; i < botonesPagos.length; i++) {
    botonesPagos[i].style.display='block';
    
  }
})
//MODALES SALDADOS Y PAGO

openModalPagos.addEventListener('click', () => {

  modalPagos.classList.add('show');// Abrir el modal
  document.querySelector(".modal__Oscuro").style.display = "block";

  //Obtiene el nombre de las columnas
  vaciarTabla('theadPagos');
  vaciarTabla('tbodyPagos');
  vaciarSelect('selectPagos', { innerHTML: '--Seleccionar Filtro--', value: '' });
  pedirColumnasPago( //callback
    function (columnas) {
      insertarTrHeader('theadPagos', columnas);
      insertarOptionPagos('selectPagos', columnas);
    });

  pedirPagos(
    function (pagos) {
      insertarTr('tbodyPagos', pagos);
    });


});
closeModalPagos.addEventListener('click', () => {

  modalPagos.classList.remove('show');// Abrir el modal
  document.querySelector(".modal__Oscuro").style.display = "none";
});


//Cerrar Modal de Pagos en Especifico y limpiarlo
closePagosEspecificos.addEventListener('click', () => {


  limpiarFormPagos()
  console.log('cerrar Modal');
  modalPagos.close(); // Cerrar el modal
});


function limpiarFormPagos() {
  document.getElementById("registrarPagoForm").reset();
  //Remueve todos los meses Añadidos
  while (mesesSeleccionados.firstChild) {
    mesesSeleccionados.removeChild(mesesSeleccionados.firstChild);
  }
  // Resetear el total del monto
  totalMonto = 0;
  document.getElementById('mesPagar').innerText = totalMonto.toFixed(2);
  document.getElementById('mesPagarBolivar').innerText = totalMonto.toFixed(2);

  mostrarDivPagos.classList.remove('block')
}

botonBuscarPagos.addEventListener('click', () => {
  vaciarTabla('tbodyPagos');
  pedirPagos(
    function (pagos) {
      if (pagos != null) {
        insertarTr('tbodyPagos', pagos);
      }
      else {
        let $nada;
        return $nada;
      }
    });
});

//Insertar options de mensualidad en pagos
function insertarOptionGeneral(idSelect = '', array = {}) {

  let select = document.getElementById(idSelect);

  for (const diccionario of array) {
    let nuevo_option = document.createElement('option');

    for (const valor in diccionario) {

      if (valor == 'innerHTML') {
        nuevo_option.innerHTML = diccionario[valor];
      }
      else {
        console.log(diccionario.innerHTML.charAt(0).toUpperCase() + diccionario.innerHTML.slice(1));

        nuevo_option.setAttribute(valor, diccionario[valor]);
      }

    }
    select.appendChild(nuevo_option);
  }


}

function llenarOptionPagos() {
  
  vaciarSelect('mes',{innerHTML: '---Seleccionar Mes---', disabled: '', selected: ''});

  let anoEscolar = document.getElementById('AnoEscolarPago').value;

  //Llenar con Mensualidad
  pedirMensualidad(anoEscolar, //callback
      function(mensualidad){

          console.log(mensualidad);
          let atributos=[];
          for (let i = 0; i < mensualidad.length; i++) {
              
              atributos.push({innerHTML: mensualidad[i]['mes'], value: mensualidad[i]['monto'],'data-id': mensualidad[i]['id']})

          }
 
          console.log(atributos)
          insertarOptionGeneral('mes',atributos);


      })

}

AnoEscolarPago=document.getElementById('AnoEscolarPago');
AnoEscolarPago.addEventListener('change',() => {
  llenarOptionPagos();
})

//MODAL PAGO ESPECIFICO
//AL agregar los pagos de este registor no olvidar los ATRIBUTOS
function openPagoEspecificoModal(event) {

  vaciarSelect('mes', { innerHTML: '---Seleccionar Mes---', disabled: '', selected: '' });

  let anoEscolar = document.getElementById('AnoEscolarPago').value;

  //Llenar con Mensualidad
  pedirMensualidad(anoEscolar, //callback
    function (mensualidad) {

      console.log(mensualidad);
      let atributos = [];
      const contadorMeses = {}
      llenarOptionPagos();
      for (let i = 0; i < mensualidad.length; i++) {
        //Agregas para tenga una letra en mayuscula
        mensualidadCapitalize = mensualidad[i]['mes'].charAt(0).toUpperCase() + mensualidad[i]['mes'].slice(1)


        if (contadorMeses[mensualidadCapitalize]) {

          contadorMeses[mensualidadCapitalize]++;
          // Agregamos el número al final del mes para diferenciarlo
          mensualidadCapitalize += ' ' + contadorMeses[mensualidadCapitalize];
        } else {
          // Si es la primera vez que el mes aparece, lo inicializamos en el contador
          contadorMeses[mensualidadCapitalize] = 1;
        }
        atributos.push(
          { innerHTML: mensualidadCapitalize, value: mensualidad[i]['monto'], 'data-id': mensualidad[i]['id'] }
        )

      }

      console.log(atributos)
      insertarOptionGeneral('mes', atributos);


    })


  const datos = JSON.parse(event.target.getAttribute('data-datos'));

  const modal = document.getElementById('modalPagosEspecificos');

  globalDataEstudianteRepresentante = datos;


  // Actualizar los elementos dentro del modal con los valores recibidos

  //AQUI SE ESTABLENCE LAS VARIABLES QUE SE MOSTRARAN EN EL MODAL PAGO REPRESENTANTE
  document.getElementById('nombresEstudianteRegistroPago').textContent = datos.nombres_estudiante;
  //CEDULA ESTUDIANTE REGISTRO PAGO
  document.getElementById('cedulaEstudianteRegistroPago').textContent = datos.cedula_estudiante;
  //NOMBRE REPRESENTANTE REGISTRO PAGO
  document.getElementById('nombresRepresentanteRegistroPago').textContent = datos.nombres_representante;
  //CEDULA ESTUDIANTE REPRESENTANTE
  document.getElementById('cedulaRepresentanteRegistroPago').textContent = datos.cedula_representante;

  document.getElementById('direccionRepresentanteRegistroPago').textContent = datos.direccion;
  document.getElementById('telefonoRepresentanteRegistroPago').textContent = datos.telefono;


  // Mostrar el modal

  modal.classList.add('show');// Abrir el modal
  document.querySelector(".modal__Oscuro").style.display = "block";

}

//placeholder es para option de placeholder, se pueden setear valores de esta forma: {value: 'lol', class: 'hidden'}

//Se puede darle nombre con innerHTML, ejemplo: {innerHTML: --Seleccionar Opcion--, value: 'lol'}

function vaciarSelect(idSelect, placeholder = {}) {
  let select = document.getElementById(idSelect);
  select.innerHTML = '';
  campo_placeholder = document.createElement('option');

  for (let valor in placeholder) {
    if (valor == 'innerHTML') {
      campo_placeholder.innerHTML = placeholder[valor];
    }
    else {
      campo_placeholder.setAttribute(valor, placeholder[valor])
    }
  }
  select.appendChild(campo_placeholder);

}

//Insertar options en el select de busqueda de pagos
function insertarOptionPagos(idSelect = '', array = []) {

  let selectPagos = document.getElementById(idSelect);

  for (let i = 0; i < array.length; i++) {

    let nuevo_option = document.createElement('option');
    nuevo_option.value = array[i];
    nuevo_option.innerHTML = array[i].toUpperCase();
    console.log(nuevo_option.innerHTML);


    selectPagos.appendChild(nuevo_option);
  }


}


//Insertar el header de una tabla
function insertarTrHeader(tbody_id = '', array = []) {

  let tbody = document.getElementById(tbody_id);

  nueva_columna = document.createElement('tr');

  for (let i = 0; i < array.length; i++) {

    nuevo_campo = document.createElement('td');
    nuevo_campo.innerHTML = array[i];
    nueva_columna.appendChild(nuevo_campo)

  }

  tbody.appendChild(nueva_columna);

}

function pedirPagos(callback) {

  const selectPagos = document.getElementById('selectPagos');
  const inputTextoPago = document.getElementById('inputTextoPagos');
  const tipoBusqueda = selectPagos.value;
  const busqueda = inputTextoPago.value;
  let parametrosCrudos;
  let parametros;

  if (tipoBusqueda == "" || busqueda == "") {
    parametrosCrudos = {};
  }

  else {
    parametrosCrudos = { [tipoBusqueda]: busqueda }; //Se coloca entre [] para que utilice la constante en vez de hacer una llave con el nombre "tipoBusqueda"
  }

  parametros = JSON.stringify(parametrosCrudos);
  const pagina = 1;


  $.ajax({
    url: '../../Control/c_pagos.php',
    type: 'POST',
    data: {
      obtenerPagos: true,
      pagina: pagina,
      parametrosBusqueda: parametros
    },
    dataType: 'json',  // Esperamos una respuesta JSON
    success: function (response) {
      // Manejar la respuesta del servidor
      if (response.success) {
        console.log(response);
        callback(response.resultados);
      } else {
        showToast('Error al obtener los datos de pagos', false);
        console.log(response);
        callback(null);
      }
    },
    error: function (jqXHR, textStatus, errorThrown) {
      console.error('Error en la solicitud AJAX:', textStatus, errorThrown);
      console.log('Respuesta del servidor:', jqXHR.responseText);
      // Aquí puedes agregar más depuración si la respuesta no es JSON válido
      showToast('Error en la comunicación con el servidor.', false);
      console.log(response);
      callback(null);
    }
  })
}

function pedirColumnasPago(callback) {

  $.ajax({
    url: '../../Control/c_pagos.php',
    type: 'POST',
    data: {
      obtenerColumnasPagos: true,
    },
    dataType: 'json',  // Esperamos una respuesta JSON
    success: function (response) {
      // Manejar la respuesta del servidor
      if (response.status) {
        console.log(response.resultados)
        callback(response.resultados)
      } else {
        showToast('Error al obtener los datos de mensualidad', false);
        console.log(response);
        callback(null)
      }
    },
    error: function (jqXHR, textStatus, errorThrown) {
      console.error('Error en la solicitud AJAX:', textStatus, errorThrown);
      console.log('Respuesta del servidor:', jqXHR.responseText);
      // Aquí puedes agregar más depuración si la respuesta no es JSON válido
      showToast('Error en la comunicación con el servidor.', false);
      console.log(response);
      callback(null)
    }
  })
}

const selectMes = document.getElementById('mes');
const mesesSeleccionados = document.getElementById('mesesSeleccionados');
let totalMonto = 0;






// Definir los precios para cada mes


function verificarSeleccionado() {

  const mostrarDivPagos = document.querySelector('#mostrarDivPagos');
  const seleccion = document.querySelector('input[name="FormaPago"]:checked');
  const seleccionDescuento = document.querySelector('input[name="descuento"]:checked');

  if (seleccion && seleccionDescuento) {

    mostrarDivPagos.classList.add('block');
    let enviar = [seleccion.value, seleccionDescuento.value];



    return enviar
  }

  return null
}
//Validacion si cambio la forma de pago referente
document.querySelectorAll('input[name="FormaPago"], input[name="descuento"]').forEach(radio => {
  radio.addEventListener('change', () => {
    const seleccion = verificarSeleccionado();
    if (seleccion) {
      abonadoMes(); // Validar el monto después de cada cambio en la selección
    }
  });
});



// Función para añadir mes seleccionado
selectMes.addEventListener('change', function () {
  const selectMes = document.getElementById('mes');
  const precioDolarCal = document.getElementById('DolarBCV').value;
  const formaPagoDescuento = verificarSeleccionado();
  const mesesSeleccionados = document.getElementById('mesesSeleccionados'); // Contenedor de los meses seleccionados


  const selectedIndex = selectMes.selectedIndex;
  const selected = selectMes.options[selectedIndex];

  // Verificar si el mes tiene un data-id
  const mesId = selected.getAttribute('data-id');
  if (!mesId) {
    return;
  }

  // Verificar si el mes ya está seleccionado utilizando `data-id`
  const mesExistente = Array.from(mesesSeleccionados.children).find(child => child.getAttribute('data-id') === mesId);
  if (mesExistente) {
    selectMes.value = ''; // Resetear select
    return;
  }



  // Obtener el precio del mes y sumarlo al total
  const valorMes = parseFloat(selected.value);
  const precioMes = valorMes || 0; // Usar 0 si no está definido
  totalMonto += precioMes;

    // Crear un nuevo elemento para el mes
    const mesItem = document.createElement('span');
    mesItem.textContent = selected.innerText;
    mesItem.classList.add('mes-item');
    mesItem.setAttribute('data-precio', precioMes);
    mesItem.setAttribute('data-id', mesId); // Asignar `data-id` al elemento

  // Crear objeto del mes seleccionado
  const mesObjeto = {
    nombre: selected.innerText,
    precio: precioMes,
    id: mesId
  };

  console.log('Mes agregado:', mesObjeto);
  console.log('Monto total acumulado:', totalMonto);

  // Actualizar el valor a mostrar con el descuento (si aplica)
  document.getElementById('mesPagar').innerText = formaPagoDescuento[1] === '' ? totalMonto.toFixed(2) : (totalMonto * formaPagoDescuento[1]).toFixed(2);
  document.getElementById('mesPagarBolivar').innerText = formaPagoDescuento[1] === '' ? (precioDolarCal * totalMonto).toFixed(2) : (precioDolarCal * totalMonto * formaPagoDescuento[1]).toFixed(2);
  valorEnviar = totalMonto;

  abonadoMes(); // Llama a la función para verificar el monto después de añadir el mes

  // Permitir eliminar el mes al hacer clic
  mesItem.onclick = function () {
    mesesSeleccionados.removeChild(mesItem);
    totalMonto -= precioMes; // Restar el precio del mes eliminado

    // Actualizar el valor a mostrar después de eliminar el mes
    document.getElementById('mesPagar').innerText = formaPagoDescuento[1] === '' ? totalMonto.toFixed(2) : (totalMonto * formaPagoDescuento[1]).toFixed(2);
    document.getElementById('mesPagarBolivar').innerText = formaPagoDescuento[1] === '' ? (precioDolarCal * totalMonto).toFixed(2) : (precioDolarCal * totalMonto * formaPagoDescuento[1]).toFixed(2);
    valorEnviar = totalMonto;
    abonadoMes(); // Verificar si el monto sigue siendo válido después de la eliminación

    // Reactivar la opción en el select
    Array.from(selectMes.options).forEach(option => {
      if (option.getAttribute('data-id') === mesId) {
        option.disabled = false;
      }
    });
  };

  // Añadir el mes al contenedor de meses seleccionados
  mesesSeleccionados.appendChild(mesItem);

  // Desactivar el mes en el select para evitar duplicados
  Array.from(selectMes.options).forEach(option => {
    if (option.getAttribute('data-id') === mesId) {
      option.disabled = true;
    }
  });

  // Resetear el select
  selectMes.value = '';
});



function abonadoMes() {

  const formaPago = verificarSeleccionado();
  const precioDolarCal = document.getElementById('DolarBCV').value;
  const mesPagarDolar = parseFloat(document.querySelector("#mesPagar").innerText);
  const mesPagarBolivar = parseFloat(document.querySelector('#mesPagarBolivar').innerText);
  const guardarRegistroPago = document.getElementById('guardarRegistroPago'); // Asegúrate de que esto esté correctamente definido
  let abonadoMes = parseFloat(document.querySelector('#mesAbonar').value);
  let abonadoMesField = document.querySelector('#mesAbonar'); //Para pintar el Borde
  let mesPagarDolarField = document.querySelector("#mesPagar")
  let mesPagarBolivarField = document.getElementById('mesPagarBolivar');
  let valorEnviar = document.getElementById('valorPagoEnviar').value

  mesPagarDolarField.style.color = '';
  mesPagarBolivarField.style.color = '';



  if (formaPago[0] === 'divisas') {
    mesPagar = mesPagarDolar;
    mesPagoField = mesPagarDolarField
    valorEnviar = abonadoMes.toFixed(2)



  } else if (formaPago[0] === 'transferencia') {
    mesPagar = mesPagarBolivar
    mesPagoField = mesPagarBolivarField
    valorEnviar = (abonadoMes / precioDolarCal).toFixed(2)
  }

  document.getElementById('valorPagoEnviar').value = valorEnviar


  if (abonadoMes <= mesPagar && 0 <= abonadoMes) {
    guardarRegistroPago.disabled = false; // Habilitar el botón si el monto abonado es menor que el monto a pagar
    abonadoMesField.style.border = '';


  } else {
    guardarRegistroPago.disabled = true; // Deshabilitar el botón si el monto abonado es igual o mayor
    if (abonadoMes > mesPagar) {
      abonadoMesField.style.border = '2px solid red'
      mesPagoField.style.color = 'red';

      showToast('El precio de lo Abonado no puede superar el Monto a Pagar', false);

    }
  }



  // Opcional: deshabilitar si no se cumple la condición



}

function enviarPago() {
  const anoEscolar = document.getElementById('AnoEscolarPago').value;
  const descuento = document.querySelector('input[name="descuento"]:checked')?.value;
  const formaPago = document.querySelector('input[name="FormaPago"]:checked')?.value;
  const referencia = document.getElementById('referencia').value;
  const notaPago = document.getElementById('notaPago').value;
  const valorPagoEnviar = parseFloat(document.getElementById('valorPagoEnviar').value);

  // Verificar campos requeridos
  const data = globalDataEstudianteRepresentante; //Esta variable se encuentra en estudiantePagos en openPagoEspecificoModal del 
  //archivo estudiantesPagos




  // Recopilar los meses seleccionados y su precio
  const mesesSeleccionados = Array.from(document.querySelectorAll('#mesesSeleccionados .mes-item')).map(mesItem => {
    return {
      mes: mesItem.textContent,
      precio: parseFloat(mesItem.getAttribute('data-precio')) || 0,
      id: mesItem.getAttribute('data-id')
    };
  });

  // Preparar los datos para enviar
  const datos = {
    ano_escolar: anoEscolar,
    descuento: descuento,
    forma_pago: formaPago,
    numero_referencia: referencia,
    nota_pago: notaPago,
    valor_pago_enviar: valorPagoEnviar,
    meses: mesesSeleccionados,
    estudiante_Representante: data
  };



  // Enviar la solicitud AJAX
  $.ajax({
    url: '../../Control/c_pagos.php',
    type: 'POST',

    data: {
      registrarPago: true,
      datos: JSON.stringify(datos)
    },
    dataType: 'json',
    success: function (response) {
      if (response.success) {
        showToast('Pago registrado exitosamente', true);
        console.log(response);
        limpiarFormPagos()
      


      } else {
        console.log(response.message);

        showToast('Hubo un error al registrar el pago: ', false);
      }
    },
    error: function (xhr, status, error) {
      console.error('Error:', xhr.responseText);
      showToast('Error en la solicitud:', false);
    }
  });
}