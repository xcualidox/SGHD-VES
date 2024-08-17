const test_button = document.querySelector("#test_button");
const initial_date = document.querySelector("#initial_date");
const final_date = document.querySelector("#final_date");
// Fecha de hoy
const today = new Date();
const year = today.getFullYear();
const month = String(today.getMonth() + 1).padStart(2, '0');
const day = String(today.getDate()).padStart(2, '0');
const todayLocal = `${year}-${month}-${day}`;


// Bitacora
function getBitacora(){
    const filterFormBitacora = document.querySelector("#filterFormBitacora");
    let data = new FormData(filterFormBitacora);
    data.append("op", "get_all");
    fetch("../../Control/c_bitacora.php",
        {
            method: "POST",
            body: data
        }
    )
    .then(response => response.json())
    .then(result =>
        {
            bitacoraTable(result);
        }
    );
}
// Añade los datos a una tabla
function bitacoraTable(data)
{
    const table = document.querySelector("#bitacoraTable");
    const tableBody = table.querySelector("tbody");
    data.forEach(log => 
        {
            let row = document.createElement("tr");
            let elements = [formatearFechaVenezuela(log["fecha_hora"]), log["type"], log["cedula"], log["full_name"], log["description"], log["user_computer"]];
            elements.forEach(element =>{
                let td = document.createElement("td");
                td.innerHTML = element;
                td.style.padding = "1rem";
                row.appendChild(td);
            });
            tableBody.appendChild(row);
        }
    );
}
// Inputs de fecha
// Colocamos como fecha maxima el dia en curso
initial_date.max = todayLocal;
final_date.max = todayLocal;
initial_date.addEventListener("change", ()=>
{
    // Ajustamos la fecha inicial si esta excede al dia en curso
    if (initial_date.value > todayLocal) {
        initial_date.value = todayLocal;
    }
    // Establecemos la fecha minima del input como la fecha inicial
    final_date.min = initial_date.value;

    // Luego de establecer la fecha inicial se abre el input de la fecha final
    final_date.showPicker();

    // Asegura que la fecha inicial no sea mayor a la fecha final
    if (initial_date.value > final_date.value) {
        final_date.value = '';
    }
});
final_date.addEventListener("change", () => {
    if (final_date.value > todayLocal) {
        final_date.value = todayLocal;
    }

    // Limpiamos el input si esta es menor que la fecha inicial
    if (final_date.value < initial_date.value) {
        final_date.value = '';
    }
});

// Formatea la fecha y hora al horario de venezuela
function formatearFechaVenezuela(fechaIso) {
    // Crear un objeto Date a partir de la cadena ISO
    const fecha = new Date(fechaIso);
  
    // Obtener las partes de la fecha
    const opciones = {
      year: 'numeric',
      month: '2-digit',
      day: '2-digit',
      hour12: true,
      hour: 'numeric',
      minute: '2-digit',
      second: '2-digit'
    };
  
    // Formatear la fecha según las opciones y el locale de Venezuela (es-VE)
    const fechaFormateada = fecha.toLocaleString('es-VE', opciones);
  
    return fechaFormateada;
  }

// Llamaos a la funcion getBitacora para que esta muestre todos los datos por defecto
getBitacora();