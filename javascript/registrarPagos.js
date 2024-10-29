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
      document.getElementById('mesPagar').innerText = totalMonto.toFixed(2);//Muestra solamente 2 decimales
      document.getElementById('mesPagarBolivar').innerText = (precioDolarCal * totalMonto).toFixed(2); //Muestra solamente 2 decimales

      abonadoMes(); // Verificar si el monto sigue siendo válido después de la eliminación


      // Reactivar la opción en el select
      Array.from(selectMes.options).forEach(option => {
        if (option.value === mes) {
          option.disabled = false;
        }
      });
    };

    document.getElementById('mesPagar').innerText = totalMonto.toFixed(2);//Muestra solamente 2 decimales
    document.getElementById('mesPagarBolivar').innerText = (precioDolarCal * totalMonto).toFixed(2); //Muestra solamente 2 decimales
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

  const mesPagarDolar = parseFloat(document.querySelector("#mesPagar").innerText);


  const mesPagarBolivar = parseFloat(document.querySelector('#mesPagarBolivar').innerText);
 
  let abonadoMes = parseFloat(document.querySelector('#mesAbonar').value);
  let abonadoMesField = document.querySelector('#mesAbonar'); //Para pintar el Borde
  let  mesPagarDolarField=document.querySelector("#mesPagar")
  let mesPagarBolivarField=document.getElementById('mesPagarBolivar');
  

  mesPagarDolarField.style.color = '';
  mesPagarBolivarField.style.color = '';


  if (formaPago[0] === 'divisas') {
    mesPagar = mesPagarDolar
    mesPagoField= mesPagarDolarField

  } else if (formaPago[0] === 'transferencia') {
    mesPagar = mesPagarBolivar
    mesPagoField=mesPagarBolivarField

  }

  const guardarRegistroPago = document.getElementById('guardarRegistroPago'); // Asegúrate de que esto esté correctamente definido

  if (abonadoMes < mesPagar) {
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
