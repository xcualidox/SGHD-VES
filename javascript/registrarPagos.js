const selectMes = document.getElementById('mes');
const mesesSeleccionados = document.getElementById('mesesSeleccionados');
let totalMonto = 0;





// Definir los precios para cada mes
const preciosMeses = {
  "Enero": 40,
  "Febrero": 40,
  "Marzo": 40,
  "Abril": 40,
  "Junio": 40,
  "Julio": 40,
  "Agosto": 40,
  "Septiembre": 40,
  "Octubre": 40,
  "Noviembre": 40

  // Agrega el resto de los meses con sus precios
};

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
  const precioDolarCal = document.getElementById('DolarBCV').value;
  const formaPagoDescuento = verificarSeleccionado();
 
  
  
  //Este array dira si el Pago es en Divisas o Bolivares
  const mes = selectMes.value;
  if (mes) {
    // Verificar si el mes ya está seleccionado
    const mesExistente = Array.from(mesesSeleccionados.children).find(child => child.textContent === mes);
    if (mesExistente) {

      selectMes.value = ''; // Resetear select
      return;
    }

    // Crear un nuevo elemento para el mes
    const mesItem = document.createElement('span');
    mesItem.textContent = mes;
    mesItem.classList.add('mes-item');

    // Obtener el precio del mes y sumarlo al total
    const precioMes = preciosMeses[mes] || 0; // Usar 0 si no está definido
    totalMonto += precioMes;

    // Crear objeto del mes seleccionado
    const mesObjeto = {
      nombre: mes,
      precio: precioMes
    };

    // Imprimir el objeto en la consola
    // console.log('Mes agregado:', mesObjeto);
    // console.log('Monto total acumulado:', totalMonto);
    valorEnviar= totalMonto
   
    

    


    // Permitir eliminar el mes al hacer clic
    mesItem.onclick = function () {
      mesesSeleccionados.removeChild(mesItem);
      totalMonto -= precioMes; // Restar el precio del mes eliminado
              //Usamos un OPERADOR TERNARIO, SI ESTE ESTO ES PARA CALCULAR SI HAY UN DESCUENTO LO CUAL HAY QUE RESTAR
      document.getElementById('mesPagar').innerText =  formaPagoDescuento[1] === '' ? totalMonto.toFixed(2) : (totalMonto * formaPagoDescuento[1]).toFixed(2)//Muestra solamente 2 decimales
      document.getElementById('mesPagarBolivar').innerText = formaPagoDescuento[1] === '' ? (precioDolarCal * totalMonto).toFixed(2)  : (precioDolarCal * totalMonto).toFixed(2) * formaPagoDescuento[1] //Muestra solamente 2 decimales
      valorEnviar=totalMonto;
      abonadoMes(); // Verificar si el monto sigue siendo válido después de la eliminación


      // Reactivar la opción en el select
      Array.from(selectMes.options).forEach(option => {
        if (option.value === mes) {
          option.disabled = false;
        }
      });
    };

    document.getElementById('mesPagar').innerText = formaPagoDescuento[1] === '' ? totalMonto.toFixed(2) : (totalMonto * formaPagoDescuento[1]).toFixed(2);//Muestra solamente 2 decimales
    document.getElementById('mesPagarBolivar').innerText = formaPagoDescuento[1] === '' ? (precioDolarCal * totalMonto).toFixed(2) : (precioDolarCal * totalMonto).toFixed(2) * formaPagoDescuento[1]; //Muestra solamente 2 decimales
    valorEnviar=totalMonto;
    
    abonadoMes();
    // Añadir el mes al contenedor
    mesesSeleccionados.appendChild(mesItem);
    

    // Desactivar el mes en el select para evitar duplicados
    Array.from(selectMes.options).forEach(option => {
      if (option.value === mes) {
        option.disabled = true;
      }
    });

    // Resetear el select
    selectMes.value = '';
  }
});



function abonadoMes() {

  const formaPago = verificarSeleccionado();
  const precioDolarCal = document.getElementById('DolarBCV').value;
  const mesPagarDolar = parseFloat(document.querySelector("#mesPagar").innerText);
  const mesPagarBolivar = parseFloat(document.querySelector('#mesPagarBolivar').innerText);
  const guardarRegistroPago = document.getElementById('guardarRegistroPago'); // Asegúrate de que esto esté correctamente definido
  let abonadoMes = parseFloat(document.querySelector('#mesAbonar').value);
  let abonadoMesField = document.querySelector('#mesAbonar'); //Para pintar el Borde
  let  mesPagarDolarField=document.querySelector("#mesPagar")
  let mesPagarBolivarField=document.getElementById('mesPagarBolivar');
  let valorEnviar= document.getElementById('valorPagoEnviar').value

  mesPagarDolarField.style.color = '';
  mesPagarBolivarField.style.color = '';

 

  if (formaPago[0] === 'divisas') {
    mesPagar = mesPagarDolar ;
    mesPagoField= mesPagarDolarField
    valorEnviar=abonadoMes.toFixed(2)

    

  } else if (formaPago[0] === 'transferencia') {
    mesPagar = mesPagarBolivar
    mesPagoField=mesPagarBolivarField
    valorEnviar=(abonadoMes/precioDolarCal).toFixed(2)
  }

  document.getElementById('valorPagoEnviar').value=valorEnviar
 

  if (abonadoMes <= mesPagar && 0 <= abonadoMes ) {
    guardarRegistroPago.disabled = false; // Habilitar el botón si el monto abonado es menor que el monto a pagar
    abonadoMesField.style.border = '';


  } else {
    guardarRegistroPago.disabled = true; // Deshabilitar el botón si el monto abonado es igual o mayor
    if (abonadoMes > mesPagar) {
      abonadoMesField.style.border = '2px solid red'
      mesPagoField.style.color='red';

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
      return { mes: mesItem.textContent, precio: preciosMeses[mesItem.textContent] || 0 };
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
      estudiante_Representante:data
  };
  


  // Enviar la solicitud AJAX
  $.ajax({
      url: '../../Control/c_registrarPago.php',
      type: 'POST',
     
      data: JSON.stringify(datos),
      dataType: 'json',
      success: function(response) {
          if (response.success) {
              showToast('Pago registrado exitosamente',true);
              console.log(response);
              
          } else {
            console.log( response.message);
            
              showToast('Hubo un error al registrar el pago: ',false);
          }
      },
      error: function(xhr, status, error) {
          console.error('Error:', xhr.responseText);
          showToast('Error en la solicitud:',false);
      }
  });
}