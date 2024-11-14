function recargarMesesPagos(){
  vaciarSelect('selectMesesPagos');
  vaciarTabla('theadMesesPagos');

  pedirColumnasMesesPagos(function(columnas){

   
    
    insertarTrHeader('theadMesesPagos', columnas);
    insertarOptionPagos('selectMesesPagos', columnas);

    //Parametros extras especificos de MesesPagos
    
    //cambiar mes a mensualidad.mes porque al query tener LEFT JOIN lo considera muy ambiguo (ya existe mensualidad.mes y meses_pagos.mes)
    let selectMesesPagos=document.getElementById('selectMesesPagos');
    let options=selectMesesPagos.children;
    console.log('lolxdxd')
    for(const option of options){
      if(option.value=='mes'){
        option.value='mensualidad.mes';
      }
    }
  });



  cedulaEstudiante=cedulaEstudianteRegistroPago.value;
  pedirMesesPagos({'cedula_estudiante': cedulaEstudiante},
    function(pagos){
      vaciarTabla('tbodyMesesPagos');
      if (pagos != null) {
        
    
      console.log(pagos);
      
        insertarTr('tbodyMesesPagos', pagos);
        
        }
      else {
        let $nada;
        return $nada;
        }
    }
  );
}

botonBuscarMesesPagos.addEventListener('click',()=>{
  vaciarTabla('tbodyMesesPagos');
  let cedula = cedulaEstudianteRegistroPago.innerHTML;
  pedirMesesPagos({'cedula_estudiante': cedula},
  
    function (pagos) { //callback
      console.log(pagos);
      if (pagos != null) {
        insertarTr('tbodyMesesPagos', pagos);
      }
      else {
        return;
      }
    });
});

botonesPagos = document.querySelectorAll("img[alt='Pago Especifico']"); //Todos los botones de Pago de Estudiante

//Activar boton al terminar de cargar la pagina (creo que no sirve xd)
window.addEventListener("load", function () {
  for (let i = 0; i < botonesPagos.length; i++) {
    botonesPagos[i].style.display = 'block';

  }
})
//MODALES SALDADOS Y PAGO

openModalMesesPS.addEventListener('click', () => {
  modalMesesPS.classList.add('show');// Abrir el modal
  document.querySelector(".modal__Oscuro").style.display = "block";
  recargarMesesPagos();
});

closeMesesPS.addEventListener('click', () => {

  modalMesesPS.classList.remove('show'); // Cerrar el modal 
  document.querySelector(".modal__Oscuro").style.display = "none";
});


function redirigirPagoPDF(idPago) {
  const url = '../pdf/pagosPDF.php?idPago='+idPago;
  window.open(url, '_blank'); // Abre en una nueva pestaña
}
openModalPagos.addEventListener('click', () => {

  //Vaciar el
  cedulaEstudianteRegistroPago.value='';

  modalPagos.classList.add('show');// Abrir el modal
  document.querySelector(".modal__Oscuro").style.display = "block";

  //Obtiene el nombre de las columnas
  vaciarTabla('theadPagos');
  vaciarTabla('tbodyPagos');
  vaciarSelect('selectPagos', { innerHTML: '--Seleccionar Filtro--', value: '' });
  pedirColumnasPago( //callback
        function (columnas) {

          columnasImprimir=columnas
        
          
          columnasImprimir=[
          "idPago",
          "cedula_estudiante",
          "cedula_representante",
          "fecha",
          "monto",
          "tipo_pago",
          "ano_escolar",
          "mes",
          "Acciones"
          
      ];

      insertarTrHeader('theadPagos', columnasImprimir);
      insertarOptionPagos('selectPagos', columnas);
    });

  pedirPagos({},
    function (pagos) {
  
      cuerpoPagos(pagos);
 
    });


  moverListaPagosGlobal();
});
closeModalPagos.addEventListener('click', () => {

  modalPagos.classList.remove('show');// Abrir el modal
  document.querySelector(".modal__Oscuro").style.display = "none";
});


//Cerrar Modal de Pagos en Especifico y limpiarlo
closePagosEspecificos.addEventListener('click', () => {


  limpiarFormPagos()
  console.log('cerrar Modal');
 
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
  let cedula = cedulaEstudianteRegistroPago.innerHTML;
  pedirPagos({'cedula_estudiante': cedula},
  
    function (pagos) { //callback
      if (pagos != null) {

        console.log("Estudiante");
        
        insertarTr('tbodyPagos', pagos);
      }
      else {
        return;
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

  vaciarSelect('mes', { innerHTML: '---Seleccionar Mes---', disabled: '', selected: '' });

  let anoEscolar = document.getElementById('AnoEscolarPago').value;

  //Llenar con Mensualidad
  pedirMensualidad(anoEscolar, //callback
    function (mensualidad) {

      console.log(mensualidad);
      let atributos = [];
      const contadorMeses = {}
    
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
      insertarOptionGeneral('mes', atributos);


    })

}

AnoEscolarPago = document.getElementById('AnoEscolarPago');
AnoEscolarPago.addEventListener('change', () => {
  llenarOptionPagos();
})
//Funcionalidad que ocurre al cambiar la lista de pagos de un sitio a otro

//actualmente solo se oculta el option del estudiante
function moverListaPagosEstudiante(){
  listaPagos.append(contenedorListaPagos);
  let optionsPagos=selectPagos.children;
  for(const option of optionsPagos){
    if (option.value == 'cedula_estudiante'){
      option.style.display='none';
    }
  }
}

function moverListaPagosGlobal() {
  modalPagos.append(contenedorListaPagos)
  let optionsPagos=selectPagos.children;
  for(const option of optionsPagos){
    if (option.value == 'cedula_estudiante'){
      option.style.display='block';
    }
  }
}

//MODAL PAGO ESPECIFICO
//AL agregar los pagos de este registor no olvidar los ATRIBUTOS
function openPagoEspecificoModal(event) {


  vaciarSelect('mes', { innerHTML: '---Seleccionar Mes---', disabled: '', selected: '' });

  let anoEscolar = document.getElementById('AnoEscolarPago').value;

  //Llenar con Mensualidad
  llenarOptionPagos();

  vaciarTabla('theadPagos');


  const datos = JSON.parse(event.target.getAttribute('data-datos'));
  //COLUMNAS ESTUDIANTES PAGOS ESTUDIANTES
  pedirColumnasPago( //callback
    function (columnas) {
      columnasImprimir=[
        "idPago",
        "cedula_estudiante",
        "cedula_representante",
        "fecha",
        "monto",
        "tipo_pago",
        "ano_escolar",
        "mes",
        "Acciones"
    ];
 
      
      insertarTrHeader('theadPagos', columnasImprimir);
      insertarOptionPagos('selectPagos', columnas);
      moverListaPagosEstudiante(); //sitio correcto dentro del callback de pedir las columnas
    });
  pedirPagos({'cedula_estudiante': datos['cedula_estudiante']},
    function(pagos){
      vaciarTabla('tbodyPagos');
      if (pagos != null) {
         //Viene asi para Imprimir dicha tabla en el td
         cuerpoPagos(pagos);
        }
      else {
        let $nada;
        return $nada;
        }
    }
  );

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

 


  // Mostrar el modal

  modal.classList.add('show');// Abrir el modal
  document.querySelector(".modal__Oscuro").style.display = "block";

}
function cuerpoPagos(pagos) {
  const pagoImprimir = pagos.map((pago) => (
        
          
    botonPDF=" <div class='flex justify-center items-center'> <img src='../../../images/icons/pdf.svg' onclick='redirigirPagoPDF("+pago.idPago+")' class='w-8 h-8  cursor-pointer' alt='PDF' title='PDF'>",
    BotonMostrarMas="<img src='../../../images/icons/moreGrid.svg' class='w-8 h-8  cursor-pointer' title='Mostrar Más' data-datos=''> <div/>",
    mezclaBotones=botonPDF+BotonMostrarMas,
    {
      idPago: pago.idPago,
      cedula_estudiante: pago.cedula_estudiante,
      cedula_representante:pago.cedula_representante,
      fecha:pago.fecha,
      monto:pago.monto,
      tipo_pago:pago.tipo_pago,
      ano_escolar:pago.ano_escolar,
      mes:pago.mes,
      botonera:mezclaBotones
  }));

  insertarTr('tbodyPagos', pagoImprimir);
}

//placeholder es para option de placeholder, se pueden setear valores de esta forma: {value: 'lol', class: 'hidden'}

//Se puede darle nombre con innerHTML, ejemplo: {innerHTML: --Seleccionar Opcion--, value: 'lol'}

function vaciarSelect(idSelect, placeholder = false) {
  let select = document.getElementById(idSelect);
  select.innerHTML = '';
  if(placeholder){
    
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

function pedirMesesPagos(parametrosCrudos = {}, callback) {

  const select = document.getElementById('selectMesesPagos');
  const inputTextoPago = document.getElementById('inputTextoMesesPagos');
  const tipoBusqueda = select.value;
  const busqueda = inputTextoPago.value;

  //Saber que ventana es obteniendo el id del boton de cerrar
  const padre = contenedorListaPagos.parentNode;
  const hermanos = padre.children;

  let parametros;
  let parametrosCrudos2={};
  
  if (tipoBusqueda == "" || busqueda == "") {
    parametrosCrudos = {};
  }
  else {
    //Filtrar parametros de busqueda vacíos vacíos
    for(const parametro in parametrosCrudos){
      if (parametro!='' && parametrosCrudos[parametro]!=''){
        parametrosCrudos2[parametro]=parametrosCrudos[parametro];
      }
    }

    //asignarle a parametrosCrudos los parametros del div de busqueda.
    Object.assign(parametrosCrudos2, { [tipoBusqueda]: busqueda });
  }

  console.log('loxdl');
  console.log(parametrosCrudos2);
  parametros = JSON.stringify(parametrosCrudos2);
  const pagina = 1;


  $.ajax({
    url: '../../Control/c_mesesPagos.php',
    type: 'POST',
    data: {
      obtenerMesesPagos: true,
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

function pedirPagos(parametrosCrudos = {}, callback, pagina=1) {

  const selectPagos = document.getElementById('selectPagos');
  const inputTextoPago = document.getElementById('inputTextoPagos');
  const tipoBusqueda = selectPagos.value;
  const busqueda = inputTextoPago.value;

  //Saber que ventana es obteniendo el id del boton de cerrar
  const padre = contenedorListaPagos.parentNode;
  const hermanos = padre.children;
  let cualVentana;
  for(const hermano of hermanos){

    switch (hermano.id) {
      case 'closeModalPagos':
        cualVentana = 'modalPagos';
        return; //Sale del loop de for
      case 'closePagosEspecificos':
        cualVentana = 'modalPagosEspecificos';
        return;
      default:
        cualVentana = 'ninguna';
        break;
    }

  }
  console.log('cualVentana');
  console.log(cualVentana);
  let parametros;
  let parametrosCrudos2={};
  if (tipoBusqueda == "" && cualVentana == 'modalPagos' || busqueda == "" && cualVentana == 'modalPagos') {
    parametrosCrudos = {};
  }
  else {
    //Filtrar parametros de busqueda vacíos vacíos
    for(const parametro in parametrosCrudos){
      if (parametro!='' && parametrosCrudos[parametro]!=''){
        parametrosCrudos2[parametro]=parametrosCrudos[parametro];
      }
    }

    //asignarle a parametrosCrudos los parametros del div de busqueda.
    Object.assign(parametrosCrudos2, { [tipoBusqueda]: busqueda });
  }

  console.log('loxdl');
  console.log(parametrosCrudos2);
  parametros = JSON.stringify(parametrosCrudos2);

  


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
  
        
        paginadoBotonera(response.maxPag, parseInt(response.pagina))
        console.log(response.pagina);
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
function paginadoBotonera(maxPag, currentPage = 1) {
    const paginacionContainer = document.getElementById("paginacionContainer");
    paginacionContainer.innerHTML = ""; // Limpiar el contenedor

    // Función para crear un botón de página
    const createButton = (page) => {
        const button = document.createElement("a");
        button.textContent = page;
        button.href = "#";
        button.classList.add("pagina");
        
        // Añadir clase 'seleccionado' a la página actual
        if (page === currentPage) {
            button.classList.add("seleccionado");
        }

        button.onclick = () =>pedirPagos({"cedula_estudiante":cedulaEstudianteRegistroPago.innerHTML},
            function (pagos) {
              vaciarTabla('tbodyPagos');
              cuerpoPagos(pagos);
         
            },page);
        paginacionContainer.appendChild(button);
    };

    // Función para crear el indicador de "..."
    const createEllipsis = () => {
        const ellipsis = document.createElement("span");
        ellipsis.textContent = "...";
        ellipsis.classList.add("ellipsis");
        paginacionContainer.appendChild(ellipsis);
    };

    // Lógica para mostrar las páginas con "..." cuando sea necesario
    if (maxPag <= 7) {
        // Mostrar todas las páginas si son 7 o menos
        for (let i = 1; i <= maxPag; i++) {
            createButton(i);
        }
    } else {
        // Mostrar las primeras páginas
        if (currentPage < 5) {
            for (let i = 1; i <= 5; i++) {
                createButton(i);
            }
            createEllipsis();
            createButton(maxPag);
        } 
        // Mostrar las últimas páginas
        else if (currentPage > maxPag - 4) {
            createButton(1);
            createEllipsis();
            for (let i = maxPag - 4; i <= maxPag; i++) {
                createButton(i);
            }
        } 
        // Mostrar las páginas alrededor de la actual
        else {
            createButton(1);
            createEllipsis();
            for (let i = currentPage - 2; i <= currentPage + 2; i++) {
                createButton(i);
            }
            createEllipsis();
            createButton(maxPag);
        }
    }
}

// Función que se llamará al hacer clic en cada botón
function cambiarPagina(pagina) {
  console.log("Página seleccionada:", pagina);
  // Aquí puedes añadir la lógica para cambiar el contenido o actualizar la vista según la página
}

function pedirColumnasMesesPagos(callback) {

  $.ajax({
    url: '../../Control/c_mesesPagos.php',
    type: 'POST',
    data: {
      obtenerColumnasMesesPagos: true,
    },
    dataType: 'json',  // Esperamos una respuesta JSON
    success: function (response) {
      // Manejar la respuesta del servidor
      if (response.status) {
        callback(response.resultados)
      } else {
        showToast('Error al obtener los datos de Meses Pagos', false);
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
    if (formaPagoDescuento[1] ) {
      document.getElementById('mesPagar').innerText = (totalMonto * formaPagoDescuento[1]).toFixed(2);
      document.getElementById('mesPagarBolivar').innerText = (precioDolarCal * totalMonto * formaPagoDescuento[1]).toFixed(2);
  } 
  valorEnviar = totalMonto;

  abonadoMes(); // Llama a la función para verificar el monto después de añadir el mes

  // Permitir eliminar el mes al hacer clic
  mesItem.onclick = function () {
    mesesSeleccionados.removeChild(mesItem);
    totalMonto -= precioMes; // Restar el precio del mes eliminado

    // Actualizar el valor a mostrar después de eliminar el mes
    if (formaPagoDescuento[1] ) {
      document.getElementById('mesPagar').innerText = (totalMonto * formaPagoDescuento[1]).toFixed(2);
      document.getElementById('mesPagarBolivar').innerText = (precioDolarCal * totalMonto * formaPagoDescuento[1]).toFixed(2);
    } 
  


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



  if (formaPago[0] === 'dolar') {
    mesPagar = mesPagarDolar;
    mesPagoField = mesPagarDolarField
    valorEnviar = abonadoMes.toFixed(2)



  } else if (formaPago[0] === 'bolivar') {
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

  //VALIDACION PARA  QUITAR DISSABLE
  const selectMes = document.getElementById("mes");

  // Selecciona todos los <option> dentro del <select>
  const opciones = selectMes.querySelectorAll("option");

  // Recorre todas las opciones y elimina el atributo disabled
  opciones.forEach(option => {
    option.removeAttribute("disabled");
  });

  // Preparar los datos para enviar
  const datos = {
    cedula: data.cedula_estudiante,
    ano_escolar: anoEscolar,
    numero_referencia: referencia,
    descuento: descuento,
    forma_pago: formaPago,
    nota_pago: notaPago,
    valor_pago_enviar: valorPagoEnviar,
    meses: mesesSeleccionados,
    dolarBCV: DolarBCV.value
  }


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
        console.log(response);
        let exitos = response.success;
        showToast(exitos+' de', true);
        limpiarFormPagos();

    },
    error: function (xhr, status, error) {
      console.error('Error:', xhr.responseText);
      showToast('Error en la solicitud:', false);
    }
  });
}