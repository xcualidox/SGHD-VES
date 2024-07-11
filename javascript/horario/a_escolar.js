var dato1="";
var dato2="";
var dato3="";

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

function Modificar(nombre, fechaI, fechaF) {
    var div=document.querySelector('#form');
    var inputs=div.querySelectorAll('input');

    document.getElementById('boton1').style.display='none';
    document.getElementById('boton2').style.display='block';
    div.style.display='block';
    inputs[0].value=nombre;
    inputs[1].value=fechaI;
    inputs[2].value=fechaF;

    document.getElementById("ope").value='Modificar';
    
    dato1=nombre;
    dato2=fechaI;
    dato3=fechaF;
    console.log(dato1);
}

function Eliminar(nombre) {
    document.getElementById('origin').value=nombre;
    document.querySelector('#ope').value="Borrar";
    alert('Este dato ha sido eliminado exitosamente');
    document.querySelector('#form').submit();
}

function Enviar(valor){
    var div=document.querySelector('#form');
    var inputs=div.querySelectorAll('input');
    console.log(dato2);

    if (document.getElementById("ope").value=="") {
        document.pantalla.ope.value = valor;
    }

    var x = document.getElementById("ope").value;

    if (x=="Incluir"){
        var nom = document.querySelector('#nom').value;
        var fecI = document.querySelector('#fecI').value;
        var fecF = document.querySelector('#fecF').value;

        if (nom == "" || fecI == "" || fecF == ""){
            alert("No puede dejar los campos vacios");
        }
    
        else if (document.getElementById('fecF').value < document.getElementById('fecI').value){
            alert("La fecha final debe de ser mayor que la fecha inicial");
        }
    
        else if(document.getElementById('fecF').value == document.getElementById('fecI').value){
            alert("Las fechas no pueden ser iguales");
        }
    
        else{
            var nom2 = nom.toLowerCase();
            document.querySelector('#nom').value = nom2;
    
            alert("Los datos han sido introducidos exitosamente");
            document.pantalla.submit();
        }
    }

    else if(x=="Modificar"){

        var inp1 = inputs[0].value;
        var inp2 = inputs[1].value;
        var inp3 = inputs[2].value;
        
        if(inp1 == ""){
            alert("Los datos no pueden estar vacios");
        }

        else if (inp1 == dato1 && inp2 == dato2 && inp3 == dato3){
            alert("Los datos no pueden ser iguales");
            console.log(inp2);
        }

        else if(inp3<inp2){
            alert("La fecha final debe de ser mayor que la fecha inicial");
        }

        else if (inp3 == inp2){
            alert("Las fechas no pueden ser iguales");
        }

        else{
            var nom = document.querySelector('#nom').value;
            var fecI = document.querySelector('#fecI').value;
            var fecF = document.querySelector('#fecF').value;

            var nom2 = nom.toLowerCase();
            document.querySelector('#nom').value = nom2;

            document.getElementById('origin').value=dato1;

            alert("Este dato ha sido modificado exitosamente");
            document.pantalla.submit();
        }
    }
}
