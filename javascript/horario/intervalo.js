var dato1="";
var dato2="";



function Modificar(nombre) {
    var div=document.querySelector('#form');
    var inputs=div.querySelectorAll('input');

    document.getElementById('boton1').style.display='block';
    document.getElementById('boton2').style.display='none';
    div.style.display='block';
    inputs[0].value=nombre;
    document.getElementById("ope").value='Modificar';
    dato1=nombre;
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

    //document.pantalla.dis.value=1;

    if (document.getElementById("ope").value=="") {
        document.pantalla.ope.value = valor;
    }

    var x = document.pantalla.ope.value;   

    if (x=="Incluir"){

        var nom = document.querySelector('#nom').value; 

        if (nom == ""){
            alert("No puede dejar los campos vacios");
        }

        else{
            var primL = nom.charAt(0);
            var primLM = primL.toUpperCase();
            var rest = nom.slice(1);
            var restM = rest.toLowerCase();

            var nom2 = primLM + restM;

            document.querySelector('#nom').value = nom2;

            alert("Los datos han sido introducidos exitosamente");
            document.pantalla.submit();
        }    
    }

    else{
        var inp1 = inputs[0].value;

        if (inp1 == ""){
            alert("No puede dejar los campos vacios");
        }

        else if (inp1 == dato1){
            alert("No puede dejar los mismos datos");
        }

        else{
            var nom = document.querySelector('#nom').value; 

            var primL = nom.charAt(0);
            var primLM = primL.toUpperCase();
            var rest = nom.slice(1);
            var restM = rest.toLowerCase();

            var nom2 = primLM + restM;

            document.querySelector('#nom').value = nom2;

            alert("Este dato ha sido modificado exitosamente");
            document.getElementById('origin').value=dato1;
            div.submit();
        }
    }
}
