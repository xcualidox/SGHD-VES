var dato1="";
var dato2="";
var dato3="";



function Modificar(nombre, fechaI, fechaF) {
    var div=document.querySelector('#form');
    var inputs=div.querySelectorAll('input');

    document.getElementById('boton1').style.display='block';
    document.getElementById('boton2').style.display='none';
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



    showConfirm("¿Está seguro de que desea eliminar este dato?", () => {
        document.getElementById('origin').value=nombre;
        document.querySelector('#ope').value="Borrar";
       
        document.querySelector('#form').submit();
    });
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
        
            showToast("No puede dejar los campos vacio",false);
        }
    
        else if (document.getElementById('fecF').value < document.getElementById('fecI').value){
           
            showToast("La fecha final debe de ser mayor que la fecha inicial",false);
        }
    
        else if(document.getElementById('fecF').value == document.getElementById('fecI').value){
          
            showToast("Las fechas no pueden ser iguales",false);
        }
    
        else{
            var nom2 = nom.toLowerCase();
            document.querySelector('#nom').value = nom2;
    
            
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
        
        if(inp1 == ""){
 
            showToast("Los datos no pueden estar vacios",false);
        }

        else if (inp1 == dato1 && inp2 == dato2 && inp3 == dato3){
           
            showToast("Los datos no pueden ser iguales",false);
            console.log(inp2);
        }

        else if(inp3<inp2){
          
            showToast("La fecha final debe de ser mayor que la fecha inicial",false);
        }

        else if (inp3 == inp2){
          
            showToast("Las fechas no pueden ser iguales",false);
        }

        else{
            var nom = document.querySelector('#nom').value;
            var fecI = document.querySelector('#fecI').value;
            var fecF = document.querySelector('#fecF').value;

            var nom2 = nom.toLowerCase();
            document.querySelector('#nom').value = nom2;

            document.getElementById('origin').value=dato1;

          
            showToast("Este dato ha sido modificado exitosamente",true);
            setTimeout(() => {
                document.pantalla.submit();
            }, 1000);
        }
    }
}
