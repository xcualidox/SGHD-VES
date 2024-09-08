var dato1="";
var dato2="";
var dato3="";
var div=document.querySelectorAll(".materias_container")
var lista=document.querySelectorAll('.lista');
var indice="";
var origin_array=[];
console.log(div);
console.log("sss")
for (let index = 0; index < lista.length; index++) {
    document.getElementById(lista[index].id).addEventListener("click", function () {
        for (let index = 0; index < lista.length; index++) {
            document.getElementById(lista[index].id).style.backgroundColor='';
            document.getElementById(lista[index].id).style.color='';
            
        }
        document.getElementById(lista[index].id).style.backgroundColor='#00796b';
        document.getElementById(lista[index].id).style.color='white';
        indice=lista[index].id;

        //Obtener el ID del padre del span (determinara si se debe agregar o quitar)
        parent=document.getElementById(indice).parentElement.id;

        switch(parent)
        {
            //Actuar en caso de que esté en el contenedor de materias disponibles o agregadas
            case 'disponibles':
                Add();
                break;

            case 'agregadas':
                Del();
                break;
        
        }
    })
    
}
window.addEventListener("click", function(event) {
    if (div[0].contains(event.target) || div[1].contains(event.target)) {
      
    }
    else {
        for (let index = 0; index < lista.length; index++) {
            document.getElementById(lista[index].id).style.backgroundColor='';
            document.getElementById(lista[index].id).style.color='';
        }
    }
  });

function Add() {
    var span=document.getElementById(indice);
    div[1].appendChild(span);
}
function Del() {
    var span=document.getElementById(indice);
    div[0].appendChild(span);
}
function Mostrar(cedula = undefined){

    const btn = document.getElementById('boton1');
    const btn2 = document.getElementById('boton2');
    const form = document.getElementById('form');
    const inputs= form.querySelectorAll('input');
    const profesorForm = document.getElementById("form");


    inputs[0].value="";
    if (form.style.display === 'none') {
    // 👇️ this SHOWS the form
        form.style.display = 'block';
        btn2.style.display = 'none';
        btn.style.display = 'block';
    } else {
    // 👇️ this HIDES the form

        //si el formulario a ocultar es de modificar
        if (cedula != undefined) {

            //obtener el <option> añadido en Modificar y eliminarlo
            profesoractualmostrar=document.getElementById('profesoractual')
            profesoractualmostrar.remove();

            //Restaurar el onclick del boton de cerrar porque ya no es requerido eliminar datos del datalist
            let boton_cerrar=document.querySelector('.botoncerrar');
            boton_cerrar.setAttribute('onclick','Mostrar()')
        }

        else{
            btn.onClick='Mostrar()';
        }
        form.style.display = 'none';
        btn2.style.display = 'none';
        btn.style.display = 'block';

        profesorForm.reset();
    //    document.getElementById("profesor").style.display="block";
    //    document.getElementById("datos").style.display="none";



        ResetDiv();
    }
}

function ResetDiv() {
    span=div[1].querySelectorAll("span");
    for (let index = 0; index < span.length; index++) {
        div[0].appendChild(span[index]);
    }
    document.querySelector("#origin").value="";
}
function Modificar(cedula, array, nombres, apellidos) {
    listaprofesores=document.querySelector('#profesoresList');

    //Crear el <option> del datalist del profesor a modificar
    profesoractual=document.createElement('option');

    //asignarle los valores
    profesoractual.value = cedula;
    profesoractual.id = 'profesoractual';
    profesoractual.textContent=nombres+' '+apellidos;

    //Insertar el elemento como hijo del datalist 
    listaprofesores.appendChild(profesoractual)

    for (let index = 0; index < array.length; index++) {
        div[1].appendChild(document.getElementById(array[index].materia));
    }
    
    //document.getElementById("profesor").style.display="none";
    //document.getElementById("datos").style.display="block";
    document.getElementById("profesor").value=cedula;
    document.getElementById("origin").value=cedula;

    //Obtener el boton de cerrar
    let boton_cerrar=document.querySelector('.botoncerrar');

    //Colocarle la cedula para que Mostrar() elimine el datalist al usar su función de cerrar el formulario.
    boton_cerrar.setAttribute('onclick','Mostrar('+cedula+')')
    Mostrar();


};

function Eliminar(cedula) {

    showConfirm('¿Está seguro de que desea eliminar este datos?',() =>{
    document.getElementById('origin').value=cedula;
   
    document.querySelector('#form').submit();
    });
}
function Enviar() {
    document.getElementById('add').value="";
    span=div[1].querySelectorAll('span');
    if (span.length>0 && document.getElementById("profesor").value!="" && document.querySelector("#origin").value=="") {
        for (let index = 0; index < span.length; index++) {
            document.getElementById('add').value=document.getElementById('add').value+","+span[index].id;
        }

        showToast("Se Añadieron Materias Exitosamente", true);
        setTimeout(() => {
            document.getElementById('form').submit()
        }, 1000);
     
    }
    else if (document.querySelector("#origin").value!="") {
        for (let index = 0; index < span.length; index++) {
            document.getElementById('add').value=document.getElementById('add').value+","+span[index].id;
        }
        array=document.getElementById('add').value.split(",")
        for (let index = 0; index < origin_array.length; index++) {
            if (array.includes(origin_array[index][0])) {
                ValidarCambio=false;
            } 
            else {
                ValidarCambio=true;
            }
        }
        if (ValidarCambio || origin_array.length+1!=array.length) {
            showToast("Se Modificaron Materias Exitosamente", true);
            setTimeout(() => {
                document.getElementById('form').submit()
            }, 1000);
        }
        else {
          
            showToast("Tienes que hacer algun cambio para poder guarda", false);
        }
        console.log(array);
    }
    else {
       
        showToast("Existen campos vacios", false);
    }
}


function ValidarNombre(cedula){
    let profesores = document.querySelectorAll('#profesoresList option');

    let nombre = 'No se ha encontrado un profesor con esa cedula.'

    for (let i = 0; i < profesores.length; i++) {
        console.log('Indice ' + i + 'es ' + profesores[i].value +' y dato a comparar ' + cedula)
        if (profesores[i].value == cedula) {
            console.log('Obtenido: '+profesores[i].value)
            nombre = profesores[i].value;
        }
    }

    document.getElementById('nombre_profesor').textContent=nombre;
    
  }
  

function enviarRequest(cedula, nombres, apellidos) {
    $.ajax({
      url: '../../Control/profesor_materia.php',
      type: 'POST',
      data: { cedula: cedula},
      success: function(response) {
        // La solicitud se ha realizado con éxito
        // Aquí puedes manejar la respuesta del servidor, que puede ser un JSON o cualquier otro formato
        console.log(response);
        // Si deseas trabajar con los datos recibidos, puedes hacerlo aquí
        var datos = JSON.parse(response);
        origin_array=datos;
        Modificar(cedula,datos, nombres, apellidos)
        
        // Ahora puedes manipular la matriz de datos según tus necesidades
      },
      error: function(xhr, status, error) {
        // Ocurrió un error al realizar la solicitud AJAX
        console.log(error);
      }
    });
  }