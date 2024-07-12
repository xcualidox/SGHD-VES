<!DOCTYPE html>
<?php session_start(); 
$conexion=mysqli_connect("localhost", "root", "", "proyecto");
$consulta="SELECT * from `preguntas_seguridad`";
$resultado=mysqli_query($conexion, $consulta);
?>
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
		<h1 align="center">Bienvenido, Por favor cree su clave</h1><br>
		<select name="pregunta" id="pregunta" class="input">
			<option value="">Seleccione su pregunta de seguridad</option>
			<?php 
			 while ($mostrar=mysqli_fetch_array($resultado)) { 
				echo "<option value=".$mostrar["id"].">".$mostrar["pregunta"]."</option>";
			 }
			?>
		</select><br><br>
		<label for="respuesta">Respuesta:</label>
		<input name="respuesta" placeholder="Coloque su respuesta a la pregunta" id="respuesta" class="formulario__input input"><br><br>
		<label for="usuario">Clave:</label>
		<input type="password" name="usuario" placeholder="Coloque su Clave" id="usuario" class="formulario__input input"><br>
		<b>La clave debe contener al menos 8 caracteres</b><br><br>

		<label for="clave">Confirmar Clave:</label>
		<input type="password" name="clave" placeholder="Confirme su Clave" id="clave" class="formulario__input input"><br><br>

		<p align="center">
			<input type="button" name="Buscar" value="Crear Clave" onclick="enviarClave()"><br><br>
		</p>
	</form>
		<a href="../../index.html">Volver al inicio</a><br>
	</div>
</body>
<script>
	<?php 
	?>
</script>
</html>