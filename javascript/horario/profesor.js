var dato1="";
var dato2="";
var dato3="";
var dato4="";
var dato5="";
var dato6="";
var dato7="";
var dato8="";

function Modificar(cedula, p_nombre, s_nombre, p_apellido, s_apellido, direccion, telefono, correo) {
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
    inputs[5].value=direccion;
    inputs[6].value=telefono;
    inputs[7].value=correo;

    document.getElementById("ope").value='Modificar';
    
    dato1=cedula;
    dato2=p_nombre;
    dato3=s_nombre;
    dato4=p_apellido;
    dato5=s_apellido;
    dato6=direccion;
    dato7=telefono;
    dato8=correo;
    console.log(dato1);
}

function Eliminar(nombre) {
    showConfirm("¿Está seguro de que desea eliminar este dato?",()=>{
    document.getElementById('origin').value=nombre;
    document.querySelector('#ope').value="Borrar";

    document.querySelector('#form').submit();
    });
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
        var direccion = inputs[5].value;
        var telefono = inputs[6].value;
        var correo = inputs[7].value;

        if (cedula == "" || p_nombre == "" || s_nombre == ""|| p_apellido == "" || s_apellido == "" || direccion == "" || telefono == "" || correo == ""){
            showToast("No puede dejar los campos vacios", false);
        }
    
        else if (regex.test(cedula)==false){
          
            showToast("La cedula no es correcta deben ser solo numeros",false);
        }
    
        else{
            showToast("Los datos han sido introducidos exitosamente",true);
            
           setTimeout(() => {
            document.pantalla.submit();
           }, 1000);
        }
    }

    else if(x=="Modificar"){

        var inp1 = inputs[0].value;
        var inp2 = inputs[1].value;
        var inp3 = inputs[2].value;
        var inp4 = inputs[3].value;
        var inp5 = inputs[4].value;
        var inp6 = inputs[5].value;
        var inp7 = inputs[6].value;
        var inp8 = inputs[7].value;

        if(inp1 == "" || inp2=="" || inp3=="" || inp4=="" || inp5=="" || inp6=="" || inp7=="" || inp8==""){
          
            showToast("No puede dejar los campos vacios", false);
        }

        else if (inp1 == dato1 && inp2 == dato2 && inp3 == dato3 && inp4 == dato4 && inp5 == dato5 && inp6 == dato6 && inp7 == dato7 && inp8 == dato8){
       
            showToast("Los datos no pueden ser iguales", false);
        }

        else{

            
            document.getElementById('origin').value=dato1;
            showToast("Este dato ha sido modificado exitosamente", true);
            setTimeout(() => {
                document.pantalla.submit();
            }, 1000);
        }
    }
}
