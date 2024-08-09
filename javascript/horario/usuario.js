var dato1="";
var dato2="";
var dato3="";
var dato4="";
var dato5="";

function Modificar(cedula, nombre, apellido, rol) {
    var div=document.querySelector('#form');
    var inputs=div.querySelectorAll('.formulario__input');
    console.log(inputs);

    document.getElementById('boton1').style.display='none';
    document.getElementById('boton2').style.display='block';
    div.style.display='block';
    inputs[0].value=cedula;
    inputs[1].value=nombre;
    inputs[2].value=apellido;
    inputs[3].value=rol;

    document.getElementById("ope").value='Modificar';
    
    dato1=cedula;
    dato2=nombre;
    dato3=apellido;
    dato4=rol;
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
    var inputs=div.querySelectorAll('.formulario__input');
    console.log(inputs);

    if (document.getElementById("ope").value=="") {
        document.pantalla.ope.value = valor;
    }

    var x = document.getElementById("ope").value;

    if (x=="Incluir"){
        var cedula = inputs[0].value;
        var nombre = inputs[1].value;
        var apellido = inputs[2].value;
        var rol = inputs[3].value;

        if (cedula == "" || nombre == "" || apellido == ""|| rol == "" ){
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

        if(inp1 == "" || inp2=="" || inp3=="" || inp4==""){
            alert("Los datos no pueden estar vacios");
        }

        else if (inp1 == dato1 && inp2 == dato2 && inp3 == dato3 && inp4 == dato4){
            alert("Los datos no pueden ser iguales");
        }

        else{
            document.getElementById('origin').value=dato1;
            alert("Este dato ha sido modificado exitosamente");
            document.pantalla.submit();
        }
    }
}
