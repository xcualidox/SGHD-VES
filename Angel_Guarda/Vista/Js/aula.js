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

function Modificar(nombre, descripcion) {
    var div=document.querySelector('#form');
    var inputs=div.querySelectorAll('input');
    var text=div.querySelectorAll('#des');

    document.getElementById('boton1').style.display='none';
    document.getElementById('boton2').style.display='block';
    div.style.display='block';
    inputs[0].value=nombre;
    text[0].value=descripcion;
    document.getElementById("ope").value='Modificar';
    
    dato1=nombre;
    dato2=descripcion;
    console.log(dato1);
}

function Eliminar(nombre) {
    document.getElementById('origin').value=nombre;
    document.querySelector('#ope').value="Borrar";
    alert('Este dato ha sido eliminado exitosamente');
    document.querySelector('#form').submit();
}
function Disponibilidad(valor, nombre) {
    document.getElementById('ope').value=valor;
    document.getElementById('nom').value=nombre;
    document.getElementById('form').submit();
}
function Enviar(valor){
    var div=document.querySelector('#form');
    var inputs=div.querySelectorAll('input');
    var text=div.querySelectorAll('#des');
    console.log(dato1);

    document.pantalla.dis.value=1;

    if (document.getElementById("ope").value=="") {
        document.pantalla.ope.value = valor;
    }

    var x = document.pantalla.ope.value;   

    if (x=="Incluir"){

        var nom = document.querySelector('#nom').value; 
        var des = document.querySelector('#des').value;

        if (nom == "" || des == ""){
            alert("No puede dejar los campos vacios");
        }

        else{

            var des2 = des.toLowerCase();

            var primL = nom.charAt(0);
            var primLM = primL.toUpperCase();
            var rest = nom.slice(1);
            var restM = rest.toLowerCase();

            var nom2 = primLM + restM;

            document.querySelector('#nom').value = nom2;
            document.querySelector('#des').value = des2;

            alert("Los datos han sido introducidos exitosamente");
            document.pantalla.submit();
        }    
    }

    else{
        var inp1 = inputs[0].value;
        var inp2 = text[0].value;

        if (inp1 == "" || inp2 == ""){
            alert("No puede dejar los campos vacios");
        }

        else if (inp1 == dato1 && inp2 == dato2){
            alert("No puede dejar los mismos datos");
        }

        else{
            var nom = document.querySelector('#nom').value; 
            var des = document.querySelector('#des').value;

            var des2 = des.toLowerCase();

            var primL = nom.charAt(0);
            var primLM = primL.toUpperCase();
            var rest = nom.slice(1);
            var restM = rest.toLowerCase();

            var nom2 = primLM + restM;

            document.querySelector('#nom').value = nom2;
            document.querySelector('#des').value = des2;

            alert("Este dato ha sido modificado exitosamente");
            document.getElementById('origin').value=dato1;
            div.submit();
        }
    }
}
