var bloques="";
var anos="";
var horaEnd = new Date();
var horaInicial = new Date();
var horaComparar = new Date();
var id="";
var ano_seccion="";
var seccion_array="";
var change="";
function CrearHorario() {
    var select=document.querySelectorAll(".select");
    if (select[0].value!="" && select[1].value!="") {
      ano_seccion=select[0].value;
      seccion_array=select[1].value;
      var span= document.querySelector(".tabla_horario").querySelectorAll('span');
     console.log(select)
      console.log(select[1].selectedIndex);
      span[1].innerHTML= select[0].options[select[0].selectedIndex].innerText;
      span[3].innerHTML=select[1].options[select[1].selectedIndex].innerText;
      document.querySelector(".tabla_horario").style.display='grid';
      document.querySelector('.guardar').style.display='block';
      document.querySelector('.volver').style.display='block';
      document.querySelector('.container_horario').style.display='none';
    }
    else {
      alert("Tiene que selecionar año y seccion");
    }
    }
    
function EditarBloque(bloque) {
    document.querySelector('.registrar_materia').style.display='block';
    if (anos=="") {
      enviarRequest(document.getElementById('ano').value, bloque.id);
    }
    else {
      enviarRequest(anos, bloque.id);
    }
    
    bloques=bloque.id;
}
function RegistrarBloque() {
    var input=document.querySelector('#valores_horario');
    var aula=document.querySelector('#aula');
    var profesor=document.querySelector('#profesor');
    var materia=document.querySelector('#materia');
    var aula2=document.querySelector('#aula2');
    var materia2=document.querySelector('#materia2');
    var profesor2=document.querySelector('#profesor2');
    if (aula.value!="" && materia.value!="" && profesor.value!="" && document.querySelector('#dividir').checked==false) {
        block='#'+bloques;
        document.querySelector(block).innerHTML="<span style='font-weight: bold;'>Aula </span><b id='"+aula.value+"' style='font-weight: lighter;'>"+aula.options[aula.selectedIndex].innerText+"</b><br><span style='font-weight: bold;'>Materia </span><b id='"+materia.value+"' style='font-weight: lighter;'>"+materia.options[materia.selectedIndex].innerText+"</b><br><span style='font-weight: bold;'>Prof </span><b id='"+profesor.value+"' style='font-size:12px;font-weight: lighter;'>"+profesor.options[profesor.selectedIndex].innerText+"</b>";
        document.querySelector('.registrar_materia').style.display='none';
        aula.value="";
        materia.value="";
        profesor.value="";
    }
    else if (document.querySelector('#dividir').checked && aula.value!="" && materia.value!="" && aula2.value!="" && materia2.value!="" && profesor2.value!="" && profesor.value!="") {
      block='#'+bloques;
      document.querySelector(block).innerHTML="<b id=1> GRUPO 1</b><br><span style='font-weight: bold;'>Aula </span> <b id='"+aula.value+"'style='font-weight: lighter;'>"+aula.options[aula.selectedIndex].innerText+"</b><br><span style='font-weight: bold;'>Materia </span><b id='"+materia.value+"' style='font-weight: lighter;'>"+materia.options[materia.selectedIndex].innerText+"</b><br><span style='font-weight: bold;'>Prof </span><b id='"+profesor.value+"' style='font-size:12px;font-weight: lighter;'>"+profesor.options[profesor.selectedIndex].innerText+"</b><br><b id=2> GRUPO 2</b><br><span style='font-weight: bold;'>Aula </span><b id='"+aula2.value+"' style='font-weight: lighter;'>"+aula2.options[aula2.selectedIndex].innerText+"</b><br><span style='font-weight: bold;'>Materia </span><b id='"+materia2.value+"' style='font-weight: lighter;'>"+materia2.options[materia2.selectedIndex].innerText+"</b><br><span  style='font-size:12px;font-weight: bold;'>Prof </span><b id='"+profesor2.value+"' style='font-size:12px;font-weight: lighter;''>"+profesor2.options[profesor2.selectedIndex].innerText+"</b>";
      document.querySelector('.registrar_materia').style.display='none';
      aula.value="";
      materia.value="";
      aula2.value="";
      materia2.value="";
      document.querySelector('#dividir').checked=false;
      CheckedGrupos(document.querySelector("#dividir"));
    }
    else {
        alert('No puede dejar los campos vacios')
    }
    console.log(input.value);
}
function GuardarHorario() {
    var divs=document.querySelector('.tabla_horario').querySelectorAll('div');
    for (let index = 5; index < divs.length; index++) {
        b=divs[index].querySelectorAll('b');
        if (b.length>0 && b.length<4) {
            if (document.getElementById('valores_horario').value=="") {
                document.getElementById('valores_horario').value=divs[index].id+","+b[0].id+","+b[1].id+","+b[2].id+", ";
                
            }
            else {
                document.getElementById('valores_horario').value=document.getElementById('valores_horario').value+","+divs[index].id+","+b[0].id+","+b[1].id+","+b[2].id+", ";
            }
          
        }
        else if (b.length>4) {
          console.log(b);
          if (document.getElementById('valores_horario').value=="") {
            document.getElementById('valores_horario').value=divs[index].id+","+b[1].id+","+b[2].id+","+b[3].id+",1,"+divs[index].id+","+b[5].id+","+b[6].id+","+b[7].id+",2";
            
        }
        else {
            document.getElementById('valores_horario').value=document.getElementById('valores_horario').value+","+divs[index].id+","+b[1].id+","+b[2].id+","+b[3].id+",1,"+divs[index].id+","+b[5].id+","+b[6].id+","+b[7].id+",2";
        }
        }
    }
    if (document.getElementById('valores_horario')!="") {
      console.log(document.getElementById('valores_horario').value)
      document.getElementById('id_intervalo').value=id;
      console.log(document.getElementById('id_intervalo').value);
      document.getElementById('guardar_horario').submit();
    }
}
function recorrerSelect(array) {
    console.log(array);
    var select = document.getElementById("aula");
    var select2 = document.getElementById("aula2") // Reemplaza "miSelect" con el ID de tu propio elemento select
   var x=0;
   for (var i = 0; i < select.options.length; i++) {
    var opcion = select.options[i];
    var opcion2 = select2.options[i];
    opcion.style.display="block";
    opcion2.style.display="block";
   }
    for (var i = 0; i < select.options.length; i++) {
      var opcion = select.options[i];
      var opcion2 = select2.options[i];
      if (opcion.value==array[x]) {
        opcion.style.display="none";
        opcion2.style.display="none";
        i=0;
        x=x+1;
      }
      // Puedes hacer algo más con cada opción aquí, como guardar los valores en un array o realizar alguna operación
    }
  }
function ClearHorario() {
  var divs=document.querySelector('.tabla_horario').querySelectorAll('div');
  for (let index = 5; index < divs.length; index++) {
    divs[index].innerText="";
    
  }
}
  function OptionSelect() {
    document.getElementById('aula').value="";
    document.getElementById('aula2').value="";
    document.getElementById('materia').value="";
    document.getElementById('materia2').value="";
    document.getElementById('profesor').value="";
    document.getElementById('profesor2').value="";
    var select = document.getElementById("aula"); // Reemplaza "miSelect" con el ID de tu propio elemento select
    for (var i = 0; i < select.options.length; i++) {
      var opcion = select.options[i];
        opcion.style.display="block";
      }
      // Puedes hacer algo más con cada opción aquí, como guardar los valores en un array o realizar alguna operación
    }
function enviarRequest(ano, bloque) {
    $.ajax({
      url: '../../Control/horario_ajax.php',
      type: 'POST',
      data: { anos: ano, bloques: bloque},
      success: function(response) {
        // La solicitud se ha realizado con éxito
        // Aquí puedes manejar la respuesta del servidor, que puede ser un JSON o cualquier otro formato
        console.log(response);
        // Si deseas trabajar con los datos recibidos, puedes hacerlo aquí
        var datos = JSON.parse(response);
        recorrerSelect(datos);
        // Ahora puedes manipular la matriz de datos según tus necesidades
      },
      error: function(xhr, status, error) {
        // Ocurrió un error al realizar la solicitud AJAX
        console.log(error);
      }
    });
  }

  function ArrayMateria(ano, select, select2) {
    RecorrerProfesor(select,"");
    if (ano.value!="") {
      $.ajax({
        url: '../../Control/horario_ajax.php',
        type: 'POST',
        data: { materia: ano.value, block: bloques, ano_array: ano_seccion},
        success: function(response) {
          // La solicitud se ha realizado con éxito
          // Aquí puedes manejar la respuesta del servidor, que puede ser un JSON o cualquier otro formato
          console.log(response);
          // Si deseas trabajar con los datos recibidos, puedes hacerlo aquí
          var datos = JSON.parse(response);
          RecorrerProfesor(select,datos,select2);
          // Ahora puedes manipular la matriz de datos según tus necesidades
        },
        error: function(xhr, status, error) {
          // Ocurrió un error al realizar la solicitud AJAX
          console.log(error);
        }
      });
    }
  }
  function BorrarBloque() {
      $.ajax({
        url: '../../Control/horario_ajax.php',
        type: 'POST',
        data: { ano_solo: ano_seccion, block: bloques, seccion_solo: seccion_array},
        success: function(response) {
          // La solicitud se ha realizado con éxito
          // Aquí puedes manejar la respuesta del servidor, que puede ser un JSON o cualquier otro formato
          console.log(response);
          // Si deseas trabajar con los datos recibidos, puedes hacerlo aquí
          var datos = JSON.parse(response);
          // Ahora puedes manipular la matriz de datos según tus necesidades
        },
        error: function(xhr, status, error) {
          // Ocurrió un error al realizar la solicitud AJAX
          console.log(error);
        }
      });
  }

function RecorrerProfesor(profesor, array, profesor2) {
  var x=0;
  document.getElementById(profesor).value="";
  console.log(array[x]);
  var opciones=document.getElementById(profesor).querySelectorAll('option');
  if (array!="") {
    for (let index = 0; index < opciones.length; index++) {
      if (opciones[index].value==array[x] && document.getElementById(profesor2).value!=opciones[index].value) {
        opciones[index].hidden=false;
        x=x+1;
        index=0;
      }
    }
  }
  else {
    for (let index = 0; index < opciones.length; index++) {
        if (opciones[index].value!="") {
          opciones[index].hidden=true;
        }
        
      }
    }
  
}
function EliminarHorario(ano, seccion) {
    $.ajax({
      url: '../../Control/horario_ajax.php',
      type: 'POST',
      data: { anos_borrar: ano, seccion_borrar: seccion},
      success: function(response) {
        // La solicitud se ha realizado con éxito
        // Aquí puedes manejar la respuesta del servidor, que puede ser un JSON o cualquier otro formato
        console.log(response);
        // Si deseas trabajar con los datos recibidos, puedes hacerlo aquí
        var datos = JSON.parse(response);
        console.log(datos)
        // Ahora puedes manipular la matriz de datos según tus necesidades
      },
      error: function(xhr, status, error) {
        // Ocurrió un error al realizar la solicitud AJAX
        console.log(error);
      }
      
    });
    location.reload();
}
function ModificarHorario(array, nombre_ano, nombre_seccion, intervalo){
  ClearHorario();
  document.querySelector(".tabla_horario").style.display='grid';
  document.querySelector('.guardar').style.display='block';
  document.querySelector('.volver').style.display='block';
  var span= document.querySelector(".tabla_horario").querySelectorAll('span');
  span[1].innerHTML= nombre_ano;
  span[3].innerHTML=nombre_seccion;
  for (let index = 0; index < array.length; index++) {
    if (array[index][5]==" " || array[index][5]=="") {
      document.querySelector('#'+array[index][4]).innerHTML="<span style='font-weight: bold;'>Aula </span><b id='"+array[index][0]+"' style='font-weight: lighter;'>"+array[index][1]+"</b><br><span style='font-weight: bold;'>Materia </span><b id='"+array[index][2]+"' style='font-weight: lighter;'>"+array[index][3]+"</b><br><span style='font-weight: bold;'>Prof </span><b id='"+array[index][6]+"' style='font-size:12px;font-weight: lighter;'>"+array[index][7]+" "+array[index][8]+" "+array[index][9]+" "+array[index][10]+"</b>";
    }
    else {
      document.querySelector('#'+array[index][4]).innerHTML="<b id='"+array[index][5]+"'> GRUPO "+array[index][5]+"</b><br>"+"<span style='font-weight: bold;'>Aula </span><b id='"+array[index][0]+"' style='font-weight: lighter;'>"+array[index][1]+"</b><br><span style='font-weight: bold;'>Materia </span><b id='"+array[index][2]+"' style='font-weight: lighter;'>"+array[index][3]+"</b><br><span style='font-weight: bold;'>Prof </span><b id='"+array[index][6]+"' style='font-size:12px;font-weight: lighter;'>"+array[index][7]+" "+array[index][8]+" "+array[index][9]+" "+array[index][10]+"</b><br>"+document.querySelector('#'+array[index][4]).innerHTML;
    }
    
    
  }
}
  function ModificarBloques(ano, seccion, nombre_ano, nombre_seccion, intervalo) {
    CalcularHora(intervalo);
    ano_seccion=ano;
    seccion_array=seccion;
    $.ajax({
      url: '../../Control/horario_ajax.php',
      type: 'POST',
      data: { anos: ano, seccion: seccion},
      success: function(response) {
        // La solicitud se ha realizado con éxito
        // Aquí puedes manejar la respuesta del servidor, que puede ser un JSON o cualquier otro formato
        // Si deseas trabajar con los datos recibidos, puedes hacerlo aquí
        var datos = JSON.parse(response);
        anos=ano;
        console.log()
        document.getElementById('ano').value=ano;
        document.getElementById('seccion').value=seccion;
        ModificarHorario(datos, nombre_ano, nombre_seccion, intervalo);
        // Ahora puedes manipular la matriz de datos según tus necesidades
      },
      error: function(xhr, status, error) {
        // Ocurrió un error al realizar la solicitud AJAX
        console.log(error);
      }
    });
  }
function Volver() {
    document.querySelector(".tabla_horario").style.display='none';
    document.querySelector('.container_horario').style.display='none';
    document.querySelector('.guardar').style.display='none';
    document.querySelector('.volver').style.display='none';
    document.querySelector('#ano').value='';
    document.querySelector('#seccion').value='';
    if (change=="change") {
      location.reload();
    }
}

function CheckedGrupos(check) {
  if (check.checked) {
    document.querySelector('.grupo1').style.display='block';
    document.querySelector('.grupo2').style.display='block';
  }
  else {
    document.querySelector('.grupo1').style.display='none';
    document.querySelector('.grupo2').style.display='none';
  }
}
function LimpiarBloque() {
    block='#'+bloques;
    change="change";
    document.querySelector(block).innerHTML="";
    document.querySelector('.registrar_materia').style.display='none';
    OptionSelect();
    BorrarBloque();
  }
/*function eliminarElementos(array, elementos) {
    return array.filter(item => !elementos.includes(item));
  }*/
function eliminarElementos(inputId, elementos) {
    var input = document.getElementById(inputId);
    var texto = input.value;
    
    for (var i = 0; i < elementos.length; i++) {
      var regex = new RegExp(elementos[i], 'g');
      texto = texto.replace(regex, '');
    }
    
    input.value = texto;
}

document.addEventListener('DOMContentLoaded', function() {
  // Aquí puedes colocar el código de la función que deseas ejecutar después de que la página haya cargado completamente
  document.querySelector('.button_crear').addEventListener('click', function () {
    document.querySelector(".container_horario").style.display='grid';
    });

    document.querySelector('.cerrar_bloque').addEventListener('click', function () {
      document.getElementById('aula').value="";
      document.getElementById('aula2').value="";
      document.getElementById('materia').value="";
      document.getElementById('materia2').value="";
      document.getElementById('profesor').value="";
      document.getElementById('profesor2').value="";
      document.querySelector(".registrar_materia").style.display='none';
      document.querySelector("#dividir").checked=false;
      CheckedGrupos(document.querySelector("#dividir"));
    });
    
    document.querySelector('.cerrar_div').addEventListener('click', function () {
      document.querySelector(".container_horario").style.display='none';
    });
    document.getElementById('profesor').addEventListener('click', function () {
      
    });
    document.querySelector('#ano').addEventListener('click', function () {
      document.getElementById('seccion').value="";
      $.ajax({
        url: '../../Control/horario_ajax.php',
        type: 'POST',
        data: { anos_crear: document.querySelector('#ano').value},
        success: function(response) {
          var x=0;
          var select=document.getElementById('seccion');
          for (let index = 0; index < select.options.length; index++) {
            select.options[index].style.display='block';
          }
          // La solicitud se ha realizado con éxito
          // Aquí puedes manejar la respuesta del servidor, que puede ser un JSON o cualquier otro formato
          console.log(response);
          // Si deseas trabajar con los datos recibidos, puedes hacerlo aquí
          var datos = JSON.parse(response);
          for (let index = 0; index < select.options.length; index++) {
            if (datos.length>0 && x<datos.length) {
              if (datos[x][0]==select.options[index].value) {
                select.options[index].style.display='none';
                x=x+1;
                index=0;
              }
            }
           
          }
          // Ahora puedes manipular la matriz de datos según tus necesidades
        },
        error: function(xhr, status, error) {
          // Ocurrió un error al realizar la solicitud AJAX
          console.log(error);
        }
      });
    });
});
function CalcularHora(intervalo, x) {
  id = x;
  var reset = document.querySelectorAll('.borrar');
  if (reset.length > 0) {
    for (let index = 0; index < reset.length; index++) {
      reset[index].remove();
    }
  }

  horaInicial.setHours(7, 0, 0, 0); 
  horaComparar.setHours(9, 0, 0, 0);
  horaEnd.setHours(17, 0, 0, 0);
  
  div = document.querySelector('.tabla_horario');
  var contador = 1;
  var minutosAgregar = intervalo;

  while (horaInicial < horaEnd) {
    var horaFinal = horaInicial.getHours();
    var minutosFinal = horaInicial.getMinutes();
    if (minutosFinal == 0) {
      minutosFinal = "00";
    }
    horaInicial.setMinutes(horaInicial.getMinutes() + minutosAgregar);
    var horasiguiente = horaInicial.getHours();
    var minutosiguiente = horaInicial.getMinutes();

    if (minutosiguiente == 0) {
      minutosiguiente = "00";
    }

    if (horaInicial.toLocaleTimeString() >= horaComparar.toLocaleTimeString() && contador > 2) {
      document.querySelector('.tabla_horario').insertAdjacentHTML("beforeend", "<span class='hora borrar'>" + horaFinal + ":" + minutosFinal + "-9:00 </span>");
      var dias = ["L", "M", "MM", "J", "V"];
      
      for (let i = 0; i < 5; i++) {
        document.querySelector('.tabla_horario').insertAdjacentHTML("beforeend", "<div id='B" + contador + dias[i] + "' class='borrar contend' onclick='EditarBloque(this)'></div>");
      }

      document.querySelector('.tabla_horario').insertAdjacentHTML("beforeend", "<span class='hora borrar'>9:00-9:30</span>");
      document.querySelector('.tabla_horario').insertAdjacentHTML("beforeend", "<p class='borrar' style='letter-spacing: 30px; font-size:50px; grid-column: 2/7; border:1px solid black; font-weight:bold; text-align:center; max-height:100px;'>RECREO</p>");
      
      horaInicial.setHours(9, 0, 0, 0);
      horaInicial.setMinutes(30);
      
      // Incrementar el contador después de recreo
      contador++;
    } else {
      document.querySelector('.tabla_horario').insertAdjacentHTML("beforeend", "<span class='hora borrar'>" + horaFinal + ":" + minutosFinal + "-" + horasiguiente + ":" + minutosiguiente + "</span>");
      var dias = ["L", "M", "MM", "J", "V"];
      
      for (let i = 0; i < 5; i++) {
        document.querySelector('.tabla_horario').insertAdjacentHTML("beforeend", "<div id='B" + contador + dias[i] + "' class='borrar contend' onclick='EditarBloque(this)'></div>");
      }

      contador++;

      if (horaInicial >= horaEnd) {
        document.querySelector('.tabla_horario').insertAdjacentHTML("beforeend", "<span style='letter-spacing: 30px; font-size:50px; grid-column: 1/7; font-weight:bold; text-align:center; height:180px; background-color:white;' class='borrar'></span>");
      }
    }
  }
}
