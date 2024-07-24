var dato1="";
var dato2="";
var dato3="";
var dato4="";
var dato5="";



function Modificar(cedula, p_nombre, s_nombre, p_apellido, s_apellido) {
    var div=document.querySelector('#form');
    var inputs=div.querySelectorAll('input');

    document.getElementById('boton1').style.display='block';
    document.getElementById('boton2').style.display='none';
    div.style.display='block';
    inputs[0].value=cedula;
    inputs[1].value=p_nombre;
    inputs[2].value=s_nombre;
    inputs[3].value=p_apellido;
    inputs[4].value=s_apellido;

    document.getElementById("ope").value='Modificar';
    
    dato1=cedula;
    dato2=p_nombre;
    dato3=s_nombre;
    dato4=p_apellido;
    dato5=s_apellido;
    console.log(dato1);
}

function Eliminar(nombre) {
    document.getElementById('origin').value=nombre;
    document.querySelector('#ope').value="Borrar";
    alert('Este dato ha sido eliminado exitosamente');
    document.querySelector('#form').submit();
}

function Enviar(valor){
    const regex = /^[0-9]*$/;
    var div=document.querySelector('#form');
    var inputs=div.querySelectorAll('input');
    console.log(dato1);

    if (document.getElementById("ope").value=="") {
        document.pantalla.ope.value = valor;
    }

    var x = document.getElementById("ope").value;

    if (x=="Incluir"){
        var cedula = inputs[0].value;
        var p_nombre = inputs[1].value;
        var s_nombre = inputs[2].value;
        var p_apellido = inputs[3].value;
        var s_apellido = inputs[4].value;

        if (cedula == "" || p_nombre == "" || s_nombre == ""|| p_apellido == "" || s_apellido == ""){
            alert("No puede dejar los campos vacios");
        }
    
        else if (regex.test(cedula)==false){
            alert("La cedula no es correcta deben ser solo numeros");
        }
    
        else{
            alert("Los datos han sido introducidos exitosamente");
            document.pantalla.submit();
        }
    }

    else if(x=="Modificar"){

        var inp1 = inputs[0].value;
        var inp2 = inputs[1].value;
        var inp3 = inputs[2].value;
        var inp4 = inputs[3].value;
        var inp5 = inputs[4].value;

        if(inp1 == "" || inp2=="" || inp3=="" || inp4=="" || inp5==""){
            alert("Los datos no pueden estar vacios");
        }

        else if (inp1 == dato1 && inp2 == dato2 && inp3 == dato3 && inp4 == dato4 && inp5 == dato5){
            alert("Los datos no pueden ser iguales");
        }

        else{
            document.getElementById('origin').value=dato1;
            alert("Este dato ha sido modificado exitosamente");
            document.pantalla.submit();
        }
    }
}
