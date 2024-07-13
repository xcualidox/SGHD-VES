<!DOCTYPE html>
<?php session_start(); ?>
<html>
<head>
	<title>Iniciar sesion</title>
	<link rel="stylesheet" type="text/css" href="Css/inicioses.css">
	<link rel="shortcut icon" type="image/x-icon" href="Imagen/Icon/Inicio_sesion.ico">
	<script type="text/javascript" src="../javascript/horario/inicio_ses.js"></script>
	<meta name="viewport" content="width=decive-width, user-scalable=no, initial-scale=0.7, maximun-scale=1.0, minimun-scale=1.0">
</head>
<body>
	<div class="area">
	<form name="pantalla" id='pantalla'method="POST" action="../Control/inicio_sesion.php">
		<h1 align="center">Inicio de sesion</h1><br>
		<label for="usuario">Usuario:</label>
		<input type="text" name="usuario" placeholder="Coloque su nombre de usuario" id="usuario" class="formulario__input"><br><br>

		<label for="clave">Clave:</label>
		<input type="password" name="clave" placeholder="Coloque su clave" id="clave" class="formulario__input"><br><br>

		<p align="center">
			<input type="button" name="Buscar" value="Iniciar sesion" onclick="enviar()"><br><br>
		</p>
	</form>
		<a href="../../index.html">Volver al inicio</a><br>
	</div>
</body>
<script>
	<?php 
	if (isset($_SESSION["error"])) {
		echo $_SESSION["error"];
		unset($_SESSION["error"]);
	}
	?>
</script>
</html>