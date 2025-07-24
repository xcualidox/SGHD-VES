var dato1="";
var dato2="";
var dato3="";
function Modificar(codigo, nombre, anos) {
    var div = document.querySelector('#form');
    var inputs = div.querySelectorAll('input');
    document.getElementById('boton1').style.display = 'block';
    document.getElementById('boton2').style.display = 'none';
    div.style.display = 'block';
    inputs[0].value = codigo;
    inputs[1].value = nombre;
    document.getElementById("ope").value = 'Modificar';
    
    dato1 = codigo;
    dato2 = nombre;
    dato3 = anos;
    materiaYearSelector.setSelectedYears(anos);

}

function Eliminar(codigo) {
    showConfirm("¿Está seguro de que desea eliminar este dato?", () => {
        document.getElementById('origin').value = codigo;
        document.querySelector('#ope').value = "Borrar";
      
        document.querySelector('#form').submit();
    });
}

function Enviar(valor) {
    var div = document.querySelector('#form');
    var inputs = div.querySelectorAll('input');
    const years = materiaYearSelector.getSelectedYears();
    if (document.getElementById("ope").value == "") {
        document.pantalla.ope.value = valor;
    }

    var x = document.pantalla.ope.value;

    if (x == "Incluir") {
        var cod = document.querySelector('#cod').value;
        var nom = document.querySelector('#nom').value;

        if (cod == "" || nom == "") {
            showToast("No puede dejar los campos vacios", false);
        } else if (cod.length > 10) {
            showToast("El codigo de la asignatura no puede tener mas de 3 letras", false);
        } else if (years.length == 0) {
            showToast("Debe asociar al menos un año escolar a la materia!", false);
        } else {
            var cod2 = cod.toUpperCase();
            var primL = nom.charAt(0);
            var primLM = primL.toUpperCase();
            var rest = nom.slice(1);
            var restM = rest.toUpperCase();

            var nom2 = primLM + restM;
            // Crear el input hidden
            const hiddenInput = document.createElement('input');
            hiddenInput.type = 'hidden';
            hiddenInput.name = 'year';
            
            // Convertir el array a JSON y asignarlo como valor
            hiddenInput.value = JSON.stringify(years);
            
            // Agregar el input al formulario
            document.getElementById('form').appendChild(hiddenInput);
            document.querySelector('#cod').value = cod2;
            document.querySelector('#nom').value = nom2;
            showToast("Los datos han sido introducidos exitosamente", true);
            setTimeout(() => {
                document.pantalla.submit();
            }, 1000); // Espera 1 segundos antes de enviar el formulario
        }
    } else if (x == "Modificar") {
        var inp1 = inputs[0].value;
        var inp2 = inputs[1].value;

        if (inp1 == "" || inp2 == "") {
            showToast("No puede dejar los campos vacios", false);
        } else if (inp1 == dato1 && inp2 == dato2 && years == dato3) {
            showToast("No puede dejar los mismos datos", false);
        
        }
        else if (years.length == 0) {
            showToast("Debe asociar al menos un año escolar a la materia!", false);}
        else {
            var cod = document.querySelector('#cod').value;
            var nom = document.querySelector('#nom').value;

            if (cod.length > 5) {
                showToast("El codigo de la asignatura no puede tener mas de 3 letras", false);
            }  else {
                var cod2 = cod.toUpperCase();
                var primL = nom.charAt(0);
                var primLM = primL.toUpperCase();
                var rest = nom.slice(1);
                var restM = rest.toUpperCase();

                var nom2 = primLM + restM;

                document.querySelector('#cod').value = cod2;
                document.querySelector('#nom').value = nom2;

                // Crear el input hidden
                const hiddenInput = document.createElement('input');
                hiddenInput.type = 'hidden';
                hiddenInput.name = 'year';
                
                // Convertir el array a JSON y asignarlo como valor
                hiddenInput.value = JSON.stringify(years);
                
                // Agregar el input al formulario
                document.getElementById('form').appendChild(hiddenInput);

                showToast("Este dato ha sido modificado exitosamente", true);
                document.getElementById('origin').value = dato1;

                setTimeout(() => {
                    div.submit();
                }, 1000);
             
            }
        }
    }
}

