var dato1="";
var dato2="";

function Mostrar(){
    const btn = document.getElementById('boton1');
    const btn2 = document.getElementById('boton2');
    const form = document.getElementById('form');
    const inputs= form.querySelectorAll('input');
    inputs[0].value="";
    inputs[1].value="";
    if (form.style.display === 'none') {
    // 👇️ this SHOWS the form
        form.style.display = 'block';
        btn2.style.display = 'block';
        btn.style.display = 'none';
    } else {
    // 👇️ this HIDES the form
        form.style.display = 'none';
        btn2.style.display = 'none';
        btn.style.display = 'block';
    }
}

function Eliminar(ano, seccion) {
    document.getElementById('origin').value=ano;
    document.getElementById('origin2').value=seccion;

    document.pantalla.ope.value = "Borrar";

    alert('Este dato ha sido eliminado exitosamente');
    document.pantalla.submit();
}

function Modificar(ano, seccion) {
    var div=document.querySelector('#form');
    var inputs1=div.querySelectorAll('#a');
    var inputs2=div.querySelectorAll('#sec');
    document.getElementById('boton1').style.display='none';
    document.getElementById('boton2').style.display='block';
    div.style.display='block';
    inputs1[0].value=ano;
    inputs2[0].value=seccion;
    document.getElementById("ope").value='Modificar';
    
    dato1=ano;
    dato2=seccion;
    console.log(dato1);
}

function Enviar(valor){
    var div=document.querySelector('#form');
    var inputs1=div.querySelectorAll('#a');
    var inputs2=div.querySelectorAll('#sec');
    console.log(dato1);

    if (document.getElementById("ope").value=="") {
        document.pantalla.ope.value = valor;
    }

    var x = document.pantalla.ope.value;   

    if (x=="Incluir"){

        var a = document.getElementById('a').value;
        var sec = document.getElementById('sec').value;

        if(a == "" || sec == ""){
            alert("No puede dejar los campos vacios");
        }
        else{
            alert("El dato ha sido registrado exitosamente");
            document.pantalla.submit();
        }
    }
    else if(x=="Modificar"){

        var inp1 = inputs1[0].value;
        var inp2 = inputs2[0].value;

        if(inp1 == "" || inp2 == ""){
            alert("No puede dejar los campos vacios");
        }

        else if (inp1 == dato1 && inp2 == dato2){
            alert("Los datos modificados no pueden quedar igual");
        }

        else{
            var a = document.getElementById('a').value; 
            var sec = document.getElementById('sec').value;

            document.getElementById('origin').value=dato1;
            document.getElementById('origin2').value=dato2;

            alert("Este dato ha sido modificado exitosamente");
            div.submit();
        }
    }
}