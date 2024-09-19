var bloques="";
var anos="";
var horaEnd = new Date();
var horaInicial = new Date();
var horaComparar = new Date();
var id="";
var ano_seccion="";
var seccion_array="";

var change="";
function CrearHorario(intervalo,x) {

    var select=document.querySelectorAll(".select");
    if (select[0].value!="" && select[1].value!="" && select[2].value!="") {
      ano_seccion=select[0].value;
      seccion_array=select[1].value;
      receso=select[2].value;
      console.log(receso);
 
    
      
      var span= document.querySelector(".tabla_horario").querySelectorAll('span');
     
      console.log(select[1].selectedIndex);
      span[1].innerHTML= select[0].options[select[0].selectedIndex].innerText;
      span[3].innerHTML=select[1].options[select[1].selectedIndex].innerText;
      document.querySelector(".tabla_horario").style.display='grid';
      document.querySelector('.guardar').style.display='block';
      document.querySelector('.volver').style.display='block';
      document.querySelector('.container_horario').style.display='none';

    }


    else {  
  
      showToast("Tiene que selecionar año y seccion",false)
      submit.preventDefault()
   
    }
     document.getElementById("receso").value=receso;

    CalcularHora(intervalo, x)

    }

function LimpiarBloqueVista() {

  let aulainput=document.getElementById('aula');
  let materiainput=document.getElementById('materia');
  let profesorinput=document.getElementById('profesor');

  materiainput.value='';
  ArrayMateria(materiainput, 'profesor','profesor2',function() {profesorinput.value=''});

  let aula2input=document.getElementById('aula');
  let materia2input=document.getElementById('materia2');
  let profesor2input=document.getElementById('profesor');

  materia2input.value='';
  ArrayMateria(materia2input, 'profesor2','profesor',function() {profesor2input.value=''});

}

function DeshabilitarAulaGrupo() {
  let aulaA=document.getElementById('aula');
  let aulaB=document.getElementById('aula2');
  let aulasA=aulaA.querySelectorAll('option');
  let aulasB=aulaB.querySelectorAll('option');

  aulasAhabilitadas=Array.from(aulasA).filter(option => option.style.display === 'block');
  aulasBhabilitadas=Array.from(aulasB).filter(option => option.style.display === 'block');
    
  for (let i = 0; i < aulasAhabilitadas.length; i++) {
    if(aulasAhabilitadas[i].value==aulaB.value && aulasAhabilitadas[i].value!=''){
      aulasAhabilitadas[i].hidden=true;
    }
    else{
      aulasAhabilitadas[i].hidden=false;
    }
  }

  for (let i = 0; i < aulasBhabilitadas.length; i++) {
    if(aulasBhabilitadas[i].value==aulaA.value && aulasBhabilitadas[i].value!=''){
      aulasBhabilitadas[i].hidden=true;
    }
    else{
      aulasBhabilitadas[i].hidden=false;
    }
  
  }

}

function EditarBloque(bloque) {

    LimpiarBloqueVista();

    bloques=bloque.id;

    let contenidobloque=bloque.children;

    let seccion = document.getElementById("seccion").value;

    //Array donde se guardará los datos a usar en el formulario de modificar
    let datosbloque=[];

    //Recorrer los hijos del bloque
    for (let i = 0; i < contenidobloque.length; i++) {

      //Si el objeto es un <b> entonces guardarlo en la array
      if (contenidobloque[i].tagName == 'B') {
        let idbloque = contenidobloque[i].id;
        let textobloque = contenidobloque[i].innerText;
        
        datosbloque.push([idbloque,textobloque])
      }

    }

    console.log(datosbloque);
    document.querySelector('.registrar_materia').style.display='block';
    if (anos=="") {
      enviarRequest(document.getElementById('ano').value, bloque.id, seccion);
    }
    else {
      enviarRequest(anos, bloque.id, seccion);
    }

    //Setear los input de los bloques
    let aulainput=document.getElementById('aula');
    let materiainput=document.getElementById('materia');
    let profesorinput=document.getElementById('profesor');

    let aula2input=document.getElementById('aula2');
    let materia2input=document.getElementById('materia2');
    let profesor2input=document.getElementById('profesor2');

    let botondividir=document.querySelector('#dividir');

    //Si hay datos y son menos de 4, es decir, sin grupo dividido
    if (datosbloque.length > 0 && datosbloque.length < 4){

      console.log('lol: ')
      console.log(datosbloque[0][0])
      aulainput.value = datosbloque[0][0];

      //Llenar el input de asignatura y buscar profesores
      //La funcion como ultimo parametro de ArrayMateria es para llenar el campo de profesor al terminar de ejecutarse la funcion
      materiainput.value = datosbloque[1][0];
      ArrayMateria(materiainput, 'profesor','profesor2',function() {profesorinput.value=datosbloque[2][0]});

      aula2input.value=''
      materia2input.value=''
      ArrayMateria(materia2input, 'profesor2','profesor',function() {profesorinput.value=''});

    }

    //Si la array tiene mas de tres valores significa que el bloque está dividido
    else if (datosbloque.length > 0 && datosbloque.length > 3) {
      
      //Activa el botón de dividir y muestra sus opciones
      botondividir.checked=true;
      CheckedGrupos(botondividir);

      //Obtiene el primer grupo de la lista(a veces sale el grupo 2 primero)
      primergrupo=datosbloque[0][1];

      if (primergrupo=='GRUPO 2') {

        //Si empieza a buguiarse saliendo profesores del grupo 2 en el grupo 1 o viceversa recordar que grupo 2 utiliza profesor2 primero que profesor normal
        //No me preguntes a mi porque ta asi xd preguntale al yonas

        aulainput.value=datosbloque[5][0];
        materiainput.value=datosbloque[6][0];
        ArrayMateria(materiainput, 'profesor','profesor2',function() {profesorinput.value=datosbloque[7][0]});
        
        aula2input.value=datosbloque[1][0];
        materia2input.value=datosbloque[2][0];
        ArrayMateria(materia2input, 'profesor2','profesor',function() {profesor2input.value=datosbloque[3][0]});
      }

      else{
        
        aulainput.value=datosbloque[1][0];
        materiainput.value=datosbloque[2][0];
        ArrayMateria(materiainput, 'profesor','profesor2',function() {profesorinput.value=datosbloque[3][0]});

        aula2input.value=datosbloque[5][0];
        materia2input.value=datosbloque[6][0];
        ArrayMateria(materia2input, 'profesor2','profesor',function() {profesor2input.value=datosbloque[7][0]});

      }
      
    }

    //Si no los hay, vaciarlos
    else{
      aulainput.value = '';
      materiainput.value = '';
      profesorinput.value = '';
      aula2input.value = '';
      materia2input.value = '';
      profesor2input.value = '';
    }
    
    DeshabilitarAulaGrupo();

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
        showToast("No puede dejar los campos vacios",false);
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
      showToast("Operacion Exitosa",true);
      setTimeout(() => {
        document.getElementById('guardar_horario').submit();
      }, 800);
  
    }
}
function recorrerSelect(array) {
    //console.log('recorrerSelect:');
    //console.log(array);
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
    }

function arrayDiff(arrayToFilter,arrayToRemove){

  // Convert arrayToRemove to a Set for fast lookups
  const removeSet = new Set(arrayToRemove);

  // Filter arrayToFilter to keep only elements not in removeSet
  return filteredArray = arrayToFilter.filter(element => !removeSet.has(element));
}

function enviarRequest(ano, bloque, seccion) {
    $.ajax({
      url: '../../Control/horario_ajax.php',
      type: 'POST',
      data: { anos: ano, bloques: bloque, seccion : seccion},
      success: function(response) {
        // La solicitud se ha realizado con éxito
        // Aquí puedes manejar la respuesta del servidor, que puede ser un JSON o cualquier otro formato
        // Si deseas trabajar con los datos recibidos, puedes hacerlo aquí
        var datosxd = JSON.parse(response);
        console.log('enviarRequest: ');
        console.log(datosxd);
        var datos = datosxd;
        recorrerSelect(datos);
        datos = '';
        // Ahora puedes manipular la matriz de datos según tus necesidades
      },
      error: function(xhr, status, error) {
        // Ocurrió un error al realizar la solicitud AJAX
        console.log(error);
      }
    });
  }

  function ArrayMateria(ano, select, select2, callback) {
    if (ano.value!="") {
      $.ajax({
        url: '../../Control/horario_ajax.php',
        type: 'POST',
        data: { materia: ano.value, block: bloques, ano_array: ano_seccion, seccion : seccion_array},
        success: function(response) {
          // La solicitud se ha realizado con éxito
          
          // Aquí puedes manejar la respuesta del servidor, que puede ser un JSON o cualquier otro formato
          // console.log(response);

          // Si deseas trabajar con los datos recibidos, puedes hacerlo aquí
          var datos = JSON.parse(response);
          
          RecorrerProfesor(select,datos,select2);
          // Ahora puedes manipular la matriz de datos según tus necesidades

          if (typeof callback === 'function') {
            callback();
          }
        },
        error: function(xhr, status, error) {
          // Ocurrió un error al realizar la solicitud AJAX
          console.log(error);
          if (typeof callback === 'function') {
            callback();
          }
        }
      });
    }
    else{
      RecorrerProfesor(select,[],select2);
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
  console.log('arrayequisxd')
  console.log(array[x]);
  var opciones=document.getElementById(profesor).querySelectorAll('option');

  if (array!='' && array.length > 0) {
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
  // Mostrar confirmación antes de eliminar
  showConfirm("¿Está seguro de que desea eliminar este dato?", () => {
    // Realiza la solicitud AJAX solo si se confirma
    $.ajax({
      url: '../../Control/horario_ajax.php',
      type: 'POST',
      data: { anos_borrar: ano, seccion_borrar: seccion },
      success: function(response) {
        // La solicitud se ha realizado con éxito
        console.log(response);
        var datos = JSON.parse(response);
        console.log(datos);
        // Recargar la página para mostrar resultados
        location.reload();
      },
      error: function(xhr, status, error) {
        // Ocurrió un error al realizar la solicitud AJAX
        console.log(error);
      }
    });
  });
}

function ModificarHorario(array, nombre_ano, nombre_seccion, intervalo,receso_array){
  ClearHorario();
  document.querySelector(".tabla_horario").style.display='grid';
  document.querySelector('.guardar').style.display='block';
  document.querySelector('.volver').style.display='block';
  var span= document.querySelector(".tabla_horario").querySelectorAll('span');
 console.log(span);
 
  
  span[1].innerHTML= nombre_ano;
  span[3].innerHTML=nombre_seccion;
  for (let index = 0; index < array.length; index++) {
    if (array[index][5]==" " || array[index][5]=="") {
      document.querySelector('#'+array[index][4]).innerHTML="<span style='font-weight: bold;'>Aula </span><b id='"+array[index][0]+"' style='font-weight: lighter;'>"+array[index][1]+"</b><br><span style='font-weight: bold;'>Materia </span><b id='"+array[index][2]+"' style='font-weight: lighter;'>"+array[index][3]+"</b><br><span style='font-weight: bold;'>Prof </span><b id='"+array[index][6]+"' style='font-size:12px;font-weight: lighter;'>"+array[index][7]+" "+array[index][8]+"</b>";
    }
    else {
      document.querySelector('#'+array[index][4]).innerHTML="<b id='"+array[index][5]+"'> GRUPO "+array[index][5]+"</b><br>"+"<span style='font-weight: bold;'>Aula </span><b id='"+array[index][0]+"' style='font-weight: lighter;'>"+array[index][1]+"</b><br><span style='font-weight: bold;'>Materia </span><b id='"+array[index][2]+"' style='font-weight: lighter;'>"+array[index][3]+"</b><br><span style='font-weight: bold;'>Prof </span><b id='"+array[index][6]+"' style='font-size:12px;font-weight: lighter;'>"+array[index][7]+" "+array[index][8]+"</b><br>"+document.querySelector('#'+array[index][4]).innerHTML;
    }
    
    
  }
}
function ModificarBloques(ano, seccion, nombre_ano, nombre_seccion, intervalo,receso) {

  document.getElementById('receso').value = receso;
  CalcularHora(intervalo);
  ano_seccion = ano;
  seccion_array = seccion;
  receso_array=receso;

  console.log(receso_array);
  



 

  

  $.ajax({
      url: '../../Control/horario_ajax.php',
      type: 'POST',
      data: { anos: ano, seccion: seccion, receso: receso },
      success: function(response) {
          var datos = JSON.parse(response);


          
         

          document.getElementById('ano').value = ano;
          document.getElementById('seccion').value = seccion;
          document.getElementById('receso').value = receso;
         
     

          ModificarHorario(datos, nombre_ano, nombre_seccion,receso_array);
      },
      error: function(xhr, status, error) {
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
  intervalo;
  const receso_array = document.querySelector("#receso").value;

  const [horaReceso, minutoReceso] = receso_array.split(':');
  var contador = 1;
  var minutosAgregar = intervalo;
  var horaInicial = new Date();
  var horaComparar = new Date();
  var horaEnd = new Date();

  var reset = document.querySelectorAll('.borrar');
  if (reset.length > 0) {
    for (let index = 0; index < reset.length; index++) {
      reset[index].remove();
    }
  }
  // Establecemos la hora inicial y la hora de receso

  horaInicial.setHours(7, 0, 0, 0); // Hora de inicio del horario
  horaComparar.setHours(parseInt(horaReceso), parseInt(minutoReceso), 0, 0); // Hora de receso
  horaEnd.setHours(17, 0, 0, 0); // Hora de fin del horario

  div = document.querySelector('.tabla_horario');


  while (horaInicial < horaEnd) {
    var horaFinal = horaInicial.getHours();
    var minutosFinal = horaInicial.getMinutes();
    if (minutosFinal == 0) {
      minutosFinal = "00";
    }

    // Comprobamos si es hora de receso
    if (horaInicial.getTime() === horaComparar.getTime()) {
      // Añadimos el bloque de receso
      document.querySelector('.tabla_horario').insertAdjacentHTML("beforeend", "<span class='hora borrar'>" + horaReceso + ":" + minutoReceso + " - " + (parseInt(horaReceso) + (minutoReceso >= 30 ? 1 : 0)) + ":" + ((minutoReceso + 30) % 60).toString().padStart(2, '0') + "</span>");
      document.querySelector('.tabla_horario').insertAdjacentHTML("beforeend", "<p class='borrar' style='letter-spacing: 30px; font-size:50px; grid-column: 2/7; border:1px solid black; font-weight:bold; text-align:center; max-height:100px;'>RECESO</p>");

      // Añadimos 30 minutos al receso
      horaInicial.setMinutes(horaInicial.getMinutes() + 30);
      continue; // Saltamos la iteración actual del ciclo
    }

    // Calculamos la hora siguiente
    horaInicial.setMinutes(horaInicial.getMinutes() + minutosAgregar);
    var horasiguiente = horaInicial.getHours();
    var minutosiguiente = horaInicial.getMinutes();

    if (minutosiguiente == 0) {
      minutosiguiente = "00";
    }

    // Añadimos el bloque de tiempo al horario
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


// document.querySelector('.tabla_horario').insertAdjacentHTML("beforeend", "<span class='hora borrar'>" + horaFinal + ":" + minutosFinal + "</span>");
// var dias = ["L", "M", "MM", "J", "V"];

// for (let i = 0; i < 5; i++) {
//   document.querySelector('.tabla_horario').insertAdjacentHTML("beforeend", "<div id='B" + contador + dias[i] + "' class='borrar contend' onclick='EditarBloque(this)'></div>");

// }

// document.querySelector('.tabla_horario').insertAdjacentHTML("beforeend", "<span class='hora borrar'>"+receso_array+ "</span>");
// document.querySelector('.tabla_horario').insertAdjacentHTML("beforeend", "<p class='borrar' style='letter-spacing: 30px; font-size:50px; grid-column: 2/7; border:1px solid black; font-weight:bold; text-align:center; max-height:100px;'>RECREO</p>");
