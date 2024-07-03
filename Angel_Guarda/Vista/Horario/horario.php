<?php
session_start();
$conexion=mysqli_connect("localhost", "root", "", "proyecto");
if ($_SESSION["sesion"]!="admin") {
    header("Location: ../Vista/inicio_sesion.php");
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../Css/a_escolar.css">
    <link rel="stylesheet" type="text/css" href="../Css/horario.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <script type="text/javascript" src="../Js/a_escolar.js"></script>
    <script type="text/javascript" src="../Js/horario.js"></script>
    <title>Horario Estudiantil</title>
</head>
<body>

<div class="sidebar">
        <div class="top">
            <div class="logo"> 
            </div>
            <i class="bx bx-menu" id="btn"></i>
        </div>

        <div class="user">
            <img src="../Imagen/Index/Angel_guarda.png" alt="no deberias estar viendo esto" class="user-img">
            <div>
                <p class="bold">Angel de la Guarda</p>
            </div>
        </div>

        <ul>
            <li>
                <a href="../Asignatura/asignatura.php" placeholder='Asignatura' title='Asignatura'>
                    <i class='bx bxs-book-alt'></i>
                    <span class="nav-item">Asignatura</span>
                </a>
                <span class="tooltip">Asignatura</span>
            </li>

            <li>
                <a href="../Profesor/profesor.php" title='Profesor'>
                    <i class='bx bx-user'></i>
                    <span class="nav-item">Profesor</span>
                </a>
                <span class="tooltip">Profesor</span>
            </li>
            
            <li>
                <a href="../Profesores_Materias/profesor_materia.php" title='Profesor PENSUM'>
                    <i class='bx bxs-bookmark-star'></i>
                    <span class="nav-item">Clases</span>
                </a>
                <span class="tooltip">PENSUM</span>
            </li>

            <li>
                <a href="../Aula/aula.php" title='Aula'>
                    <i class='bx bx-chair' ></i>
                    <span class="nav-item">Aula</span>
                </a>
                <span class="tooltip">Aula</span>
            </li>

            <li>
                <a href="../A_seccion/a_seccion.php" title='Año Seccion'>
                    <i class='bx bxs-user-check'></i>
                    <span class="nav-item">A.seccion</span>
                </a>
                <span class="tooltip">A.seccion</span>
            </li>

            <li>
                <a href="../A_escolar/a_escolar.php" title='Año Escolar'>
                    <i class='bx bxs-calendar'></i>
                    <span class="nav-item">A.Escolar</span>
                </a>
                <span class="tooltip">A.Escolar</span>
            </li>

            <li>
                <a href="../Intervalo/intervalo.php" title='Intervalo'>
                    <i class='bx bx-expand-vertical'></i>
                    <span class="nav-item">Intervalo</span>
                </a>
                <span class="tooltip">Intervalo</span>
            </li>

            <li>
                <a href="../Horario/horario.php" title='Horario'>
                    <i class='bx bx-calendar-plus'></i>
                    <span class="nav-item">Horario</span>
                </a>
                <span class="tooltip">Horario</span>
            </li>
            
            <li>
                <a href="../Usuarios/usuario.php" title='Usuario'>
                    <i class='bx bxs-cog'></i>
                    <span class="nav-item">Usuarios</span>
                </a>
                <span class="tooltip">Usuarios</span>
            </li>

            <li>
                <a href="..\..\index.html">
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
    $consulta="SELECT profesores.cedula, profesores.primer_nombre, profesores.primer_apellido, profesores.segundo_nombre, profesores.segundo_apellido FROM profesores WHERE EXISTS ( SELECT * FROM profesores_materias WHERE profesores.cedula = profesores_materias.profesor)";
    $profesores=mysqli_query($conexion, $consulta);
    $profesores2=mysqli_query($conexion, $consulta);
    $consulta="SELECT intervalo, id from intervalo WHERE `estado`=1";
    $intervalo=mysqli_query($conexion, $consulta);
    while ($mostrar=mysqli_fetch_array($intervalo)) {
        $tiempo=$mostrar["intervalo"];
        $id=$mostrar["id"];
    }
    ?>
    <button type='button' class='button_crear' onclick='CalcularHora(<?php echo $tiempo.",".$id?>)'>Crear Horario</button>
    <div class='tabla'>
        <div style='background-color:rgb(65, 105, 225);font-size:20px;color:white;border: 1px solid black;'>Año Escolar</div>
        <div style='background-color:rgb(65, 105, 225);font-size:20px;color:white;border: 1px solid black;'>Año</div>
        <div style='background-color:rgb(65, 105, 225);font-size:20px;color:white;border: 1px solid black;'>Seccion</div>
        <span></span>
        <span></span>
        <span></span>
        <?php 
        while ($mostrar=mysqli_fetch_array($horario)) { 
            echo "<div>".$mostrar["nombre"]."</div>";
            echo "<div>".$mostrar["ano"]."</div>";
            echo "<div>".$mostrar["seccion"]."</div>";
            echo " <button type='button' onclick='ModificarBloques(`".$mostrar["codigo_a_escolar"].
            "`,`".$mostrar["codigo_a_y_seccion"]."`,`".$mostrar["nombre"]."`,`".$mostrar["ano"]." ".$mostrar["seccion"]."`,".$mostrar["intervalo"].")'>Mostrar</button>";
            echo " <button type='button' onclick='EliminarHorario(`".$mostrar["codigo_a_escolar"].
            "`,`".$mostrar["codigo_a_y_seccion"]."`)'>Eliminar</button>";
            echo "<a href='horario_pdf.php?codigo_escolar=".$mostrar["codigo_a_escolar"]."&codigo_seccion=".$mostrar["codigo_a_y_seccion"]."&nombre=".$mostrar["nombre"]."&ano=".$mostrar["ano"]."&seccion=".$mostrar["seccion"]."&intervalo=".$mostrar["intervalo"]."'><button type='button'>PDF</button></a>";
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
    <button type="button" class='guardar' onclick='GuardarHorario()'>Guardar Horario</button>
    <div class='tabla_horario' style=" grid-column-gap: -10px;">
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
    <div class='registrar_materia'>
    <div class='cerrar cerrar_bloque'>X</div>
        <h3>Seleccione el Aula, Materia y Profesor</h3>
        <div class='checkmark_container' style='margin-top:10px;display:inline-block;'>
            <input type="checkbox" name="dividir" id="dividir" onclick='CheckedGrupos(this)' style='cursor:pointer;'><label for="dividir" style='display:inline-block;margin-left:5px;cursor:pointer;'><b>Dividir en Grupos</b></label>
        </div>
        <h3 style='text-align:center; display:none;' class='grupo1'>GRUPO 1</h3>
        <div class='input_container' style='margin-top:5px;'>
            <label for="">Aula</label>
            <select name="aula" id="aula">
                <option value="">Seleccione</option>
                <?php 
                while ($mostrar=mysqli_fetch_array($aula)) {
                    echo "<option value='".$mostrar["codigo"]."'>".$mostrar["nombre"]."</option>";
                }
                ?>
            </select>
        </div>
        <div class='input_container' style='margin-top:5px;'>
            <label for="">Materia</label>
            <select name="materia" id="materia" onclick="ArrayMateria(this, 'profesor', 'profesor2')">
                <option value="">Seleccione</option>
                <?php 
                while ($mostrar=mysqli_fetch_array($materia)) {
                    echo "<option value='".$mostrar["codigo"]."'>".$mostrar["nombre"]."</option>";
                }
                ?>
            </select>
        </div>
        <div class='input_container' style='margin-top:5px;'>
        <label for="">Profesor</label>
        <select name="profesor" id="profesor" class='select_profesor'>
                <option value="">Selecione</option>
                <?php 
                while ($mostrar=mysqli_fetch_array($profesores)) {
                       echo "<option value='".$mostrar["cedula"]."' hidden>".$mostrar["primer_nombre"]." ".$mostrar["segundo_nombre"]." ".$mostrar["primer_apellido"]." ".$mostrar["segundo_apellido"]."</option>";
                }
                ?>
        </select>
        </div>
        <span class='grupo2' style='display:none;'>
            <h3 style='text-align:center;'>GRUPO 2</h3>
            <div class='input_container' style='margin-top:5px;'>
                <label for="">Aula</label>
                <select name="aula2" id="aula2">
                    <option value="">Seleccione</option>
                    <?php 
                    print_r($aula);
                    while ($mostrar2=mysqli_fetch_array($aula2)) {
                        echo "<option value='".$mostrar2["codigo"]."'>".$mostrar2["nombre"]."</option>";
                    }
                    ?>
                </select>
            </div>
            <div class='input_container' style='margin-top:5px;'>
                <label for="">Materia</label>
                <select name="materia2" id="materia2" onclick="ArrayMateria(this, 'profesor2', 'profesor')">
                    <option value="">Seleccione</option>
                    <?php 
                    while ($mostrar2=mysqli_fetch_array($materia2)) {
                        echo "<option value='".$mostrar2["codigo"]."'>".$mostrar2["nombre"]."</option>";
                    }
                    ?>
                </select>
            </div>
            <div class='input_container' style='margin-top:5px;'>
                <label for="">Profesor</label>
                <select name="profesor2" id="profesor2" class='select_profesor'>
                        <option value="">Selecione</option>
                        <?php 
                        while ($mostrar=mysqli_fetch_array($profesores2)) {
                            echo "<option value='".$mostrar["cedula"]."' hidden>".$mostrar["primer_nombre"]." ".$mostrar["segundo_nombre"]." ".$mostrar["primer_apellido"]." ".$mostrar["segundo_apellido"]."</option>";
                        }
                        ?>
                </select>
            </div>
        </span>
        <button type="button" onclick='RegistrarBloque()'>Guardar</button>
        <button type="button" onclick='LimpiarBloque()' style='background-color: rgb(255, 30, 30);margin-left:50px;'>Limpiar</button>
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