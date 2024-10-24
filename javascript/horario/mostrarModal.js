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
    toast.style.zIndex='9999';
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

    // 👇️ this CLEANS the form
    document.getElementById("ope").value = "";

    // Nota: el for está en -2 porque el queryselector se agarró todos los inputs del formulario, no se para que sirven las ultimas 2 pero se buguea feo si las vacío.
    for (let i = 0; i < inputs.length-2; i++) {
        inputs[i].value="";
      } 

    if (form.style.display === 'none') {
    // 👇️ this SHOWS the form
        form.style.display = 'block';
        btn2.style.display = 'block';
        btn.style.display = 'block';
    } else {
    // 👇️ this HIDES the form
        form.style.display = 'none';
        btn2.style.display = 'block';
        btn.style.display = 'block';
    }
}


//FUNCION PARA AÑADIR . VISUALMENTE en la cedula

function formatearCedulas() {
    const numerosCedula = document.querySelectorAll(".numeroCedula");

    numerosCedula.forEach(function(elemento) {
        const numero = elemento.textContent;
        const numeroFormateado = numero.replace(/\B(?=(\d{3})+(?!\d))/g, ".");
        elemento.textContent = numeroFormateado;
    });
}


// FUNCION PARA AÑADIR GUION AL NUMERO DE CELULAR
function formatearNumerosCelular() {
    const numerosCelular = document.querySelectorAll(".numeroCelular");

    numerosCelular.forEach(function(elemento) {
        let numero = elemento.textContent;

        // Expresión regular que detecta prefijos de celulares venezolanos y agrega un guion
        const numeroFormateado = numero.replace(/^(0412|0416|0424|0414|0426)(\d+)/, '$1-$2');
        elemento.textContent = numeroFormateado;
    });
}
formatearCedulas();
formatearNumerosCelular();