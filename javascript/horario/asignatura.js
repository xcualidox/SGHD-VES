var dato1="";
var dato2="";


function Modificar(codigo, nombre) {
    var div=document.querySelector('#form');
    var inputs=div.querySelectorAll('input');
    document.getElementById('boton1').style.display='block';
    document.getElementById('boton2').style.display='none';
    div.style.display='block';
    inputs[0].value=codigo;
    inputs[1].value=nombre;
    document.getElementById("ope").value='Modificar';
    
    dato1=codigo;
    dato2=nombre;
    console.log(dato1);
}

function Eliminar(codigo) {
    document.getElementById('origin').value=codigo;
    document.querySelector('#ope').value="Borrar";
    alert('Este dato ha sido eliminado exitosamente');
    document.querySelector('#form').submit();
    
}
function Enviar(valor){
    var div=document.querySelector('#form');
    var inputs=div.querySelectorAll('input');
    console.log(dato1);

    if (document.getElementById("ope").value=="") {
        document.pantalla.ope.value = valor;
    }

    var x = document.pantalla.ope.value;   

    if (x=="Incluir"){
        
        var cod = document.querySelector('#cod').value; 
        var nom = document.querySelector('#nom').value;

        if (cod == "" || nom == ""){
            alert("No puede dejar los campos vacios");
        }
        else if (cod.length > 3){
            alert("El codigo de la asignatura no puede tener mas de 3 letras");
        }

        else if (nom.length > 25){
            alert("El nombre de la asignatura es muy largo");
        }

        else{
            var cod2 = cod.toLowerCase();

            var primL = nom.charAt(0);
            var primLM = primL.toUpperCase();
            var rest = nom.slice(1);
            var restM = rest.toLowerCase();
        
            var nom2 = primLM + restM;

            document.querySelector('#cod').value = cod2;
            document.querySelector('#nom').value = nom2;
            alert("Los datos han sido introducidos exitosamente");
            document.pantalla.submit();
        }
    }
    
    else if(x=="Modificar") {

        var inp1 = inputs[0].value;
        var inp2 = inputs[1].value;

        if (inp1 == "" || inp2 == ""){
            alert("No puede dejar los campos vacios");
        }

        else if (inp1 == dato1 &&  inp2 == dato2){
            alert("No puede dejar los mismos datos");
        }

        else{
            var cod = document.querySelector('#cod').value; 
            var nom = document.querySelector('#nom').value;

            if (cod.length > 3){
                alert("El codigo de la asignatura no puede tener mas de 3 letras");
            }

            else if (nom.length > 25){
                alert("El nombre de la asignatura es muy largo");
            }
    
            else{

                var cod2 = cod.toLowerCase();

                var primL = nom.charAt(0);
                var primLM = primL.toUpperCase();
                var rest = nom.slice(1);
                var restM = rest.toLowerCase();
            
                var nom2 = primLM + restM;
    
                document.querySelector('#cod').value = cod2;
                document.querySelector('#nom').value = nom2;
                
                alert("Este dato ha sido modificado exitosamente");
                document.getElementById('origin').value=dato1;
                div.submit();
            }
        }
    }
    
}