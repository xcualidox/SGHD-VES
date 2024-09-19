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

//Aqui terminan los Modales