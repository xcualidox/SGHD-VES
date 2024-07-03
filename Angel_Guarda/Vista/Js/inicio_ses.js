function enviar(){
	const regex = /^[0-9]*$/;
	input_ini=document.querySelector('#pantalla').querySelectorAll('input');
	console.log(input_ini);
	if (input_ini[0].value=="" || input_ini[1].value=="") 
	{
		alert('Los campos no pueden quedar vacios');
	}
	else if (regex.test(input_ini[0].value)==false) {
		alert('El usuario deben ser solo numeros');
	}
	else {
		document.querySelector('#pantalla').submit();
	}

}
function enviarClave(){
	input_ini=document.querySelector('#pantalla').querySelectorAll('.input');
	if (input_ini[0].value=="" || input_ini[1].value=="" || input_ini[2].value=="" || input_ini[3].value=="") 
	{
		alert('Los campos no pueden quedar vacios');
	}
	else if (input_ini[2].value.length<8) {
		alert('La clave tiene que tener al menos 8 caracteres');
	}
	else if (input_ini[2].value!=input_ini[3].value) {
		alert('La contraseñas no coinciden');
	}
	else {
		document.querySelector('#pantalla').submit();
	}

}