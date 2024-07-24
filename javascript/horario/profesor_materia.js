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
function Mostrar(){
    const btn = document.getElementById('boton1');
    const btn2 = document.getElementById('boton2');
    const form = document.getElementById('form');
    const inputs= form.querySelectorAll('input');
    inputs[0].value="";
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
        document.getElementById("profesor").style.display="block";
        document.getElementById("datos").style.display="none";
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
function Modificar(cedula, array, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido) {
    for (let index = 0; index < array.length; index++) {
        div[1].appendChild(document.getElementById(array[index].materia));
    }
    document.getElementById("profesor").style.display="none";
    document.getElementById("datos").style.display="block";
    document.getElementById("datos").value=primer_nombre+" "+segundo_nombre+" "+primer_apellido+" "+segundo_apellido;
    document.getElementById("origin").value=cedula;
    Mostrar()
};

function Eliminar(cedula) {
    document.getElementById('origin').value=cedula;
    alert('Este dato ha sido eliminado exitosamente');
    document.querySelector('#form').submit();
}
function Enviar() {
    document.getElementById('add').value="";
    span=div[1].querySelectorAll('span');
    if (span.length>0 && document.getElementById("profesor").value!="" && document.querySelector("#origin").value=="") {
        for (let index = 0; index < span.length; index++) {
            document.getElementById('add').value=document.getElementById('add').value+","+span[index].id;
        }
        document.getElementById('form').submit()
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
            document.getElementById('form').submit()
        }
        else {
            alert("Tienes que hacer algun cambio para poder guardar")
        }
        console.log(array);
    }
    else {
        alert("Existen campos vacios");
    }
}
function enviarRequest(cedula, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido) {
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
        Modificar(cedula,datos, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido)
        // Ahora puedes manipular la matriz de datos según tus necesidades
      },
      error: function(xhr, status, error) {
        // Ocurrió un error al realizar la solicitud AJAX
        console.log(error);
      }
    });
  }