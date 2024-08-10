<?php
session_start();
$conexion=mysqli_connect("localhost", "root", "", "proyecto");
if ($_SESSION["sesion"]!="profesor") {
    header("Location: ../../../index.php");
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../../../Css/a_escolar.css">
    <link rel="stylesheet" type="text/css" href="../../../Css/horario.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <script type="text/javascript" src="../../../javascript/horario/a_escolar.js"></script>
    <script type="text/javascript" src="../../../javascript/horario/horario_usuario.js"></script>
    <title>Horarios Estudiantiles</title>
</head>
<body>

<div class="sidebar">
        <div class="top">
            <div class="logo"> 
            </div>
            <i class="bx bx-menu" id="btn"></i>
        </div>

        <div class="user">
            <img src="../../../Imagen/Index/Angel_guarda.png" alt="no deberias estar viendo esto" class="user-img">
            <div>
                <p class="bold">Angel de la Guarda</p>
            </div>
        </div>

        <ul>
            <li>
                <a href="../Horario/Aula.php" title='Horario'>
                <i class='bx bx-calendar-plus'></i>
                    <span class="nav-item">Horario</span>
                </a>
                <span class="tooltip">Horario</span>
            </li>
            <br><br><br><br><br><br><br><br>

            <li>
                <a href="..\..\..\index.html">
                <i class='bx bxs-left-arrow-alt'></i>
                    <span class="nav-item">Inicio</span>
                </a>
                <span class="tooltip">Inicio</span>
            </li>
        </ul>
    </div>
    <?php 
   $consulta="SELECT `codigo`, `nombre` from ano_escolar";
   $ano_escolar=mysqli_query($conexion, $consulta);
   $consulta="SELECT * from ano_seccion";
   $ano_seccion=mysqli_query($conexion, $consulta);
   $consulta="SELECT * from aula WHERE `disponibilidad`=1";
   $aula=mysqli_query($conexion, $consulta);
   $aula2=mysqli_query($conexion, $consulta);
   $consulta="SELECT * from asignatura";
   $materia=mysqli_query($conexion, $consulta);
   $materia2=mysqli_query($conexion, $consulta);
   $consulta="SELECT DISTINCT  ano_escolar.nombre, ano_seccion.ano, ano_seccion.seccion, horario_estudiante.codigo_a_escolar, horario_estudiante.codigo_a_y_seccion, intervalo.intervalo
   FROM horario_estudiante
   JOIN ano_escolar ON horario_estudiante.codigo_a_escolar = ano_escolar.codigo
   JOIN ano_seccion ON horario_estudiante.codigo_a_y_seccion = ano_seccion.codigo
   JOIN intervalo ON horario_estudiante.intervalo = intervalo.id";

   $horario=mysqli_query($conexion, $consulta);
   $consulta="SELECT personas.cedula, personas.primer_nombre, personas.primer_apellido, personas.segundo_nombre, personas.segundo_apellido FROM personas WHERE EXISTS ( SELECT * FROM profesores_materias WHERE personas.cedula = profesores_materias.profesor)";
   $profesores=mysqli_query($conexion, $consulta);
   $profesores2=mysqli_query($conexion, $consulta);
   $consulta="SELECT intervalo, id from intervalo WHERE `estado`=1";
   $intervalo=mysqli_query($conexion, $consulta);
   while ($mostrar=mysqli_fetch_array($intervalo)) {
       $tiempo=$mostrar["intervalo"];
       $id=$mostrar["id"];
   }
    ?>
    <div class='tabla' style='grid-template-columns:130px 200px 200px 200px;'>
        <div style='background-color:rgb(65, 105, 225);font-size:20px;color:white;border: 1px solid black;'>Año Escolar</div>
        <div style='background-color:rgb(65, 105, 225);font-size:20px;color:white;border: 1px solid black;'>Año</div>
        <div style='background-color:rgb(65, 105, 225);font-size:20px;color:white;border: 1px solid black;'>Seccion</div>
        <span></span>
        <?php 
         while ($mostrar=mysqli_fetch_array($horario)) { 
            echo "<div>".$mostrar["nombre"]."</div>";
            echo "<div>".$mostrar["ano"]."</div>";
            echo "<div>".$mostrar["seccion"]."</div>";
            echo " <button type='button' onclick='ModificarBloques(`".$mostrar["codigo_a_escolar"].
            "`,`".$mostrar["codigo_a_y_seccion"]."`,`".$mostrar["nombre"]."`,`".$mostrar["ano"]." ".$mostrar["seccion"]."`,".$mostrar["intervalo"].")'>Mostrar</button>";
        }
        ?>
    </div>
    <form action="../../Control/horario.php" method="post" name='guardar_horario' id='guardar_horario'>
    <div class='container_horario'>
        <div class='cerrar cerrar_div' style='left:730px;width:60px;'>X</div>
        <h2 style='text-align:center;'>Crear Horario</h2>
        <p>Para crear el horario nececita ingresar el lapso, año y seccion para comenzar su creacion</p>
        <div class='input_container'>
            <label for="lapso">Año Escolar</label>
            <select name="ano" id="ano" class='select'>
            <option value="">Seleccione</option>
            <?php 
            while ($mostrar=mysqli_fetch_array($ano_escolar)) {
                echo "<option value='".$mostrar["codigo"]."'>".$mostrar["nombre"]."</option>";
            }
            ?>

            </select>
        </div>
        <div class='input_container'>
            
            <label for="ano">Año y Seccion</label>
            <select name="seccion" id="seccion" class='select'>
                <option value="">Seleccione</option>
            <?php 
            while ($mostrar=mysqli_fetch_array($ano_seccion)) {
                echo "<option value='".$mostrar["codigo"]."'>".$mostrar["ano"]." ".$mostrar["seccion"]."</option>";
            }
            ?>

            </select>
        </div>
        <input type="text" id='valores_horario' name='valores_horario' hidden>
        <input type="text" id='id_intervalo' name='id_intervalo' hidden>
        <button onclick='CrearHorario()' type='button'>Crear</button>
       
    </div>
    </form>
    <div></div>
    <button type="button" class='volver' onclick='Volver()'>Volver</button>
    <div class='tabla_horario'>
        <span class='titulos'>Lapso:</span>
        <span style='grid-column:2/4;' class='titulos'></span>
        <span class='titulos'>Seccion:</span>
        <span style='grid-column:5/7;' class='titulos'></span>
        <div style='height:40px;text-align:center;font-size:22px;background-color:rgb(74, 96, 219);color:white;cursor: inherit;'>Hora</div>
        <div style='height:40px;text-align:center;font-size:22px;background-color:rgb(74, 96, 219);color:white;cursor: inherit;'>Lunes</div>
        <div style='height:40px;text-align:center;font-size:22px;background-color:rgb(74, 96, 219);color:white;cursor: inherit;'>Martes</div>
        <div style='height:40px;text-align:center;font-size:22px;background-color:rgb(74, 96, 219);color:white;cursor: inherit;'>Miercoles</div>
        <div style='height:40px;text-align:center;font-size:22px;background-color:rgb(74, 96, 219);color:white;cursor: inherit;'>Jueves</div>
        <span style='height:40px;text-align:center;font-size:22px;background-color:rgb(74, 96, 219);color:white;cursor: inherit;' >Viernes</span>
    </div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
    let btn = document.querySelector('#btn');
    let sidebar = document.querySelector('.sidebar');
    console.log(document.querySelector('.button_crear'));
    btn.onclick = function (){
        sidebar.classList.toggle('active')
    };
    CalcularHora(<?php echo $tiempo ?>);
</script>
</html>