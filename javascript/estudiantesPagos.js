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
    fetch('/javascript/dolar.json')
    .then(response => response.json())
    .then(data => {
        // Establece el valor del input con el valor del dólar desde el JSON
        document.querySelector('#DolarBCV').value = data.DolarBCV;
        // console.log('Valor cargado en DolarBCV:', calcular());
    })
    .catch(error => {
        console.error('Error al cargar el archivo JSON:', error);
    });
}

// Función para actualizar el valor del dólar al hacer onblur en el input
function actualizarDolar() {
    const input = document.getElementById('DolarBCV').value;

    const convertidor=parseFloat(input);
    if (convertidor>0) {

            // Enviar el valor al servidor mediante una solicitud POST
    fetch('/Angel_Guarda/Control/c_dolar.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({ DolarBCV: convertidor }), // Convertimos el valor a JSON
    })
    .then(response => response.json())
    .then(data => {
        console.log('Respuesta del servidor:', data);
        // Una vez actualizado, vuelve a cargar el valor desde el archivo JSON
        cargarDolar(); // Llamar cargarDolar para recargar el valor actualizado
    })
    .catch(error => {
        console.error('Error al actualizar el valor:', error);
    });
        
    }
    else{
        // console.log("Tiene que ser mayor a 0");
        cargarDolar();
        
    }
  


}

// Llamar a la función cargarDolar cuando se cargue la página
window.onload = cargarDolar();

function calcular() {
    const test = document.getElementById("DolarBCV").value;
    return test;    
}