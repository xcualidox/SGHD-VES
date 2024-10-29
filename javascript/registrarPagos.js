const selectMes = document.getElementById('mes');
const mesesSeleccionados = document.getElementById('mesesSeleccionados');
let totalMonto = 0;



// Definir los precios para cada mes
const preciosMeses = {
  "Enero": 40,
  "Febrero": 40,
  "Marzo": 40,
  "Abril":40,
  "Junio":40,
  "Julio":40,
  "Agosto":40,
  "Septiembre":40,
  "Octubre":40,
  "Noviembre":40

  // Agrega el resto de los meses con sus precios
};

function verificarSeleccionadoTipo() {

  const mostrarDivPagos=document.querySelector('#mostrarDivPagos');
  const seleccion = document.querySelector('input[name="FormaPago"]:checked');
  const seleccionDescuento = document.querySelector('input[name="descuento"]:checked');
  if (seleccion && seleccionDescuento) {

    mostrarDivPagos.classList.add('block');
    let enviar = [seleccion.value, seleccionDescuento.value];
    console.log("Valores en el array enviar:", enviar);

    
      return enviar
  }
}



// Función para añadir mes seleccionado
selectMes.addEventListener('change', function () {
  const precioDolarCal=document.getElementById('DolarBCV').value;
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
    console.log('Mes agregado:', mesObjeto);
    console.log('Monto total acumulado:', totalMonto);
  

    // Permitir eliminar el mes al hacer clic
    mesItem.onclick = function () {
      mesesSeleccionados.removeChild(mesItem);
      totalMonto -= precioMes; // Restar el precio del mes eliminado
      document.getElementById('mesPagar').value =totalMonto.toFixed(2); //Muestra solamente 2 decimales
      document.getElementById('mesPagarDolar').value = (precioDolarCal * totalMonto).toFixed(2); //Muestra solamente 2 decimales


      // Reactivar la opción en el select
      Array.from(selectMes.options).forEach(option => {
        if (option.value === mes) {
          option.disabled = false;
        }
      });
    };
  
    document.getElementById('mesPagar').value = totalMonto.toFixed(2); //Muestra solamente 2 decimales
    document.getElementById('mesPagarDolar').value = (precioDolarCal * totalMonto).toFixed(2); //Muestra solamente 2 decimales
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

function tipoPago() {

  const formaPago = verificarSeleccionado(); //Llamo la funcion para traerme lo que retorna
  const tipoPago =formaPago[0]; //Accediendo a Pago si es divisa o Transferencia
  return tipoPago
}

function abonadoMes() {

  if (tipoPago === 'divisas') {
   

  } else if (tipoPago === 'transferencia') {
    
 
  }
  const mesPagar= parseFloat(document.querySelector("#mesPagar").value);
  const abonadoMes= parseFloat(document.querySelector('#mesAbonar').value);
  console.log(mesPagar,abonadoMes);
  
   if (  abonadoMes>=mesPagar) {
    showToast('El precio de lo Abonado no puede superar el Monto a Pagar',false);
   }
   

}