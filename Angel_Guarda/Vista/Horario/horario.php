<?php
session_start();
$conexion=mysqli_connect("localhost", "root", "", "proyecto");
if ($_SESSION["sesion"]!="admin") {
    header("Location: ../../../index.php");
}
$title='Horario';
include_once('../v_Sidebar/v_Sidebar.php');
?>

    <link rel="stylesheet" type="text/css" href="../../../styles/a_escolar.css">
    <link rel="stylesheet" type="text/css" href="../../../styles/horario.css">
 
    <script type="text/javascript" src="../Js/a_escolar.js"></script>
    <script type="text/javascript" src="../Js/horario.js"></script>

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