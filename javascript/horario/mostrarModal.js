//Inicio para ventana de Confirmacion
function showConfirm(mensaje, onConfirm) {
    // Crear el contenedor de la confirmación
    const confirmContainer = document.createElement('div');
    confirmContainer.classList.add('confirm-container');
    confirmContainer.innerHTML = `
        <div class="confirm-box">
            <p>${mensaje}</p>
            <button id="confirm-yes" class="confirm-button">Sí</button>
            <button id="confirm-no" class="confirm-button">No</button>
        </div>
    `;

    document.body.appendChild(confirmContainer);

    // Manejar los clics en los botones
    document.getElementById('confirm-yes').onclick = () => {
        onConfirm();
        document.body.removeChild(confirmContainer);
    };

    document.getElementById('confirm-no').onclick = () => {
        document.body.removeChild(confirmContainer);
    };
}

// Función para mostrar el toast
function showToast(message, success = true) {
    const toast = document.createElement('div');
    toast.className = 'toast';
    toast.textContent = message;

    if (success) {
        toast.style.backgroundColor = 'var(--color-primary)'; // Verde oscuro para éxito
    } else {
        toast.style.backgroundColor = 'var(--color-rojo)'; // Rojo para error
    }

    document.body.appendChild(toast);

    setTimeout(() => {
        toast.classList.add('show');
    }, 100); // Para permitir que se aplique la transición

    setTimeout(() => {
        toast.classList.remove('show');
        setTimeout(() => {
            document.body.removeChild(toast);
        }, 500); // Tiempo para permitir que se aplique la transición de salida
    }, 2000); // Tiempo que el toast estará visible
}


function Mostrar(){
    const btn = document.getElementById('boton1');
    const btn2 = document.getElementById('boton2');
    const form = document.getElementById('form');
    const inputs= form.querySelectorAll('input');
   
    inputs[0].value="";
    inputs[1].value="";

    document.getElementById("ope").value = "";

    if (form.style.display === 'none') {
    // 👇️ this SHOWS the form
        form.style.display = 'block';
        btn2.style.display = 'none';
        btn.style.display = 'block';
    } else {
    // 👇️ this HIDES the form
        form.style.display = 'none';
        btn2.style.display = 'none';
        btn.style.display = 'block';

    }
}


