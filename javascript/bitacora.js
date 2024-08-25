const test_button = document.querySelector("#test_button");
const initial_date = document.querySelector("#initial_date");
const final_date = document.querySelector("#final_date");
const filterFormBitacora = document.querySelector("#filterFormBitacora");
// Fecha de hoy
const today = new Date();
const year = today.getFullYear();
const month = String(today.getMonth() + 1).padStart(2, '0');
const day = String(today.getDate()).padStart(2, '0');
const todayLocal = `${year}-${month}-${day}`;
// Boton para buscar bitcora 
const searchBarBtn = document.querySelector("#searchBarBtn");
// Boton para resetear los filtros de busqueda
const resetFilterBtn = document.querySelector("#resetFilterBtn");
// tabla de la bitacora
const table = document.querySelector("#bitacoraTable");

// Bitacora
// function getBitacora(){
//     let data = new FormData(filterFormBitacora);
//     data.append("op", "get_all");
//     fetch("../../Control/c_bitacora.php",
//         {
//             method: "POST",
//             body: data
//         }
//     )
//     .then(response => response.json())
//     .then(result =>
//         {
//             if (result)
//             {
//                 bitacoraTable(result);
//             }
//             else
//             {
//                 if(!table.classList.contains("hidden"))
//                 {
//                     table.classList.add("hidden");
//                 }
//             }
//         }
//     );
// }
// function paginationJquery() {
//     let filterData = new FormData(filterFormBitacora);
//     $('#pagination-container').pagination({
//         dataSource: function(done) {
//           $.ajax({
//             type: 'POST',
//             url: '../../Control/c_bitacora.php',
//             dataType: "json",
//             data: {
//               page: this.pageNumber,
//               totalNumber: 0, 
//               op: "get_all",
//               op_type: $("#op_type").val(),
//               initial_date: $("#initial_date").val(),
//               final_date: $("#final_date").val(),
//               input_filter: $("#searchBar").val(),
//             },
//             success: function(response) {
//                 // Verificar la estructura de la respuesta
//                 console.log("Respuesta completa del servidor:", response);

//                 // Asegurarse de que `response.total` y `response.data` sean correctos
//                 console.log("Total de registros esperados:", response.totalNumber);
//                 console.log("Datos de la página actual:", response.data);

//                 // Pasar los datos al plugin
//                 done(response.data);
//             },
            
//           });
//         },
//         totalNumberLocator: function(response) {
//             return response.totalNumber;
//         },
//         pageSize: 5, // Asegurarse de que esto coincide con la lógica del backend
//         className: 'paginationjs-theme-gray paginationjs-big',
//         callback: function(data, pagination) {
//             bitacoraTable(data); // Renderizar los datos en la tabla
//         }
//     });
// }
function paginationJquery() {
    let filterData = new FormData(filterFormBitacora);
    
    $('#pagination-container').pagination({
        dataSource: `../../Control/c_bitacora.php?op=get_all&op_type=${encodeURIComponent($("#op_type").val())}&initial_date=${encodeURIComponent($("#initial_date").val())}&final_date=${encodeURIComponent($("#final_date").val())}&input_filter=${encodeURIComponent($("#searchBar").val())}`,
        locator: 'data', // Aquí especificas la clave donde se encuentran los datos
        totalNumberLocator: function(response) {
            return response.total; // Ubicación de la clave total en la respuesta JSON
        },
        pageSize: 5,
        className: 'paginationjs-theme-gray paginationjs-big',
        callback: function(data, pagination) {
            if (data[0])
            {
                bitacoraTable(data); // Renderizar los datos en la tabla
            }
            else
            {
                if(!table.classList.contains("hidden"))
                {
                    table.classList.add("hidden");
                    $('#pagination-container').addClass("hidden");
                    $('#noResultMsg').removeClass("hidden");
                }
            }
            // console.log(data)
        }
    });
}

// Añade los datos a una tabla
function bitacoraTable(data)
{
    if(table.classList.contains("hidden"))
        {
            table.classList.remove("hidden");
            $('#pagination-container').removeClass("hidden");
            $('#noResultMsg').addClass("hidden");

        }
    const tableBody = table.querySelector("tbody");
    checkBitacoraTable(tableBody);
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
// Checkea si ya existe una tabla en el frontend, para asi borrarla y crar una nueva
function checkBitacoraTable(tableBody){
    let rows = tableBody.querySelectorAll("tr");
    if(rows.length > 1)
    {
        rows.forEach(element => 
        {
            element.remove();
        }
        );
    };

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
// getBitacora();
paginationJquery();

// Llamamos la funcion getBticora con los filtros de busqueda ya aplicados
searchBarBtn.addEventListener("click", () =>
{
    paginationJquery();
});
// Limpia el formulario de filtros y llama a la funcion getBticora sin los filtros
resetFilterBtn.addEventListener("click", () =>
{
    filterFormBitacora.reset();
    paginationJquery();
});

// forbid non numirical characters
document.querySelector("#searchBar").addEventListener("input", (e) => 
    {
        let inputLenght = e.target.value.length;
        let lastCh = e.target.value[inputLenght - 1];
        if (!/[A-Za-z0-9]+/.test(lastCh))
        {
            e.target.value = e.target.value.substr(0, inputLenght - 1 );
        }
    });

// Evita que se ejecute el formulario al dar enter
filterFormBitacora.addEventListener('keydown', (e) => {
    if( e.key == "Enter")
    {
        e.preventDefault();
        paginationJquery();
    }
});