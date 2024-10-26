const selectMes = document.getElementById('mes');
const mesesSeleccionados = document.getElementById('mesesSeleccionados');
let totalMonto = 0;

// Definir los precios para cada mes
const preciosMeses = {
  "Enero": 40,
  "Febrero": 40,
  "Marzo": 40,
  // Agrega el resto de los meses con sus precios
};

// Función para añadir mes seleccionado
selectMes.addEventListener('change', function () {
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
      document.getElementById('mesPagar').value=totalMonto;

      // Reactivar la opción en el select
      Array.from(selectMes.options).forEach(option => {
        if (option.value === mes) {
          option.disabled = false;
        }
      });
    };
    document.getElementById('mesPagar').value=totalMonto;

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