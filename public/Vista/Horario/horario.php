<?php
session_start();
include_once("../../Control/horario_tabla.php");

if ($_SESSION["sesion"] == "admin" || $_SESSION["sesion"] == "administrador" || $_SESSION["sesion"] == "coordinador" || $_SESSION["sesion"] == "profesor") {
} else {
    header("Location: ../../../index.php");
}
$title = 'Horario';
include_once('../v_Sidebar/v_Sidebar.php');
?>

<meta name="viewport" content="1024">

<link rel="stylesheet" type="text/css" href="../../../styles/horario.css">

<script type="text/javascript" src="../../../javascript/horario/mostrarModal.js"></script>

<script type="text/javascript" src="../../../javascript/horario/a_escolar.js"></script>
<script type="text/javascript" src="../../../javascript/horario/horario.js"></script>

<?php
$objeto = new query();
$ano_escolar = $objeto->SelectAno_Escolar();
$ano_seccion = $objeto->SelectAno_Seccion();

$ano_seccionSelect= $objeto->SelectAno_SeccionHorarioController();

$docente = $objeto->SelectDocente();
$aula = $objeto->SelectAula();
$aula2 = $objeto->SelectAula();
$materia = $objeto->SelectAsignatura();
$materia2 = $objeto->SelectAsignatura();
$horario = $objeto->SelectHorario();
$profesores = $objeto->SelectProfesores();
$profesores2 = $objeto->SelectProfesores();
$intervalo = $objeto->SelectIntervalo();


while ($mostrar = mysqli_fetch_array($intervalo)) {
    $tiempo = $mostrar["intervalo"];
    $id = $mostrar["id"];
    $hora_inicio = $mostrar["hora_inicio"];
    $hora_final = $mostrar["hora_final"];
}

?>


<div class="main-content">

    <?php
    // Comprobamos si existen las variables de sesión antes de compararlas
    if (isset($_SESSION["sesion"]) && ($_SESSION["sesion"] == "admin" || $_SESSION["sesion"] == "administrador" || (isset($_SESSION["coordinador"]) && $_SESSION["coordinador"] == "coordinador"))) {
        echo "<button type='button' class='button_crear'>Crear Horario</button>";
    }
    ?>

    <!-- <button type='button' class='button_crear' >Crear Horario</button> -->

    <div class="absolute right-0  top-0 flex  justify-end items-start gap-4 bg-slate-300 p-1  z-50 ">
        <div class="grid grid-cols-1 gap-2">
            <button type="button" class="volver hidden z-50 w-48 text-xl text-white bg-gray-800 transition-all ease-in-out duration-500 cursor-pointer" onclick="Volver()">Volver</button>
            <button type="button" class="guardar hidden z-50 w-48 text-xl text-white bg-gray-800 transition-all ease-in-out duration-500 cursor-pointer" onclick="GuardarHorario()">Guardar Horario</button>
        </div>
    </div>

    <div class='table-wrapper min-w-full'>
        <table class="fl-table">
            <thead>
                <tr>
                    <td>Cedula</td>
                    <td>Nombre</td>
                    <td>Año Escolar</td>
                    <td>Acciones</td>
                </tr>
            </thead>
            <tbody>
                <?php while ($mostrar = mysqli_fetch_array($horario)) {
                    //Para debuguear datos del horario
                    // echo '<pre>';
                    // var_dump($mostrar);
                    // echo '</pre>'; 

                    ?>
                    <tr>
                        <td><?php echo $mostrar["cedula"]; ?></td>
                        <td><?php echo $mostrar["nombre"]; ?></td>
                        <td><?php echo $mostrar["ano_escolar"]; ?></td>

                    
                        <td>

                            <div class="flex justify-center items-center space-x-4">
                                <?php if ($_SESSION["sesion"] == "admin" || $_SESSION["sesion"] == "administrador") {
                                        echo '<img src="../../../images/icons/papelera.svg" class="w-8 h-8 filtro-rojo cursor-pointer" alt="Borrar" title="Borrar" 
                               onclick=\'EliminarHorario("' . $mostrar["cedula"] . '", "' . $mostrar["ano_codigo"] . '")\'>';

                                } ?>

                                <?php
                                if ($_SESSION["sesion"] == "admin" || $_SESSION["sesion"] == "administrador" || $_SESSION["sesion"] == "coordinador") {


                                    echo '<img src="../../../images/icons/modificar.svg" class="w-8 h-8 filtro-azul cursor-pointer" alt="Modificar" title="Modificar" 
                                    onclick="ModificarBloques(\'' . $mostrar["cedula"] . '\', \'' . $mostrar["ano_codigo"] . '\',\'' . $mostrar["ano_escolar"] . '\',\'' . $mostrar["nombre"] . '\' )" />';
                                }
                                ?>





                           <a href="../pdf/horarioDocentePDF.php?cedula=<?= $mostrar['cedula'] ?>&anoEscolar=<?= $mostrar['ano_codigo'] ?>" target="_blank">
    <img src="../../../images/icons/pdf.svg" class="w-10 filtro-verde" alt="PDF Horario">
</a>
                            </div>



                        </td>
                    </tr>
                <?php } ?>
            </tbody>
        </table>
    </div>


</div>
<form action=" ../../Control/horario.php" method="post" name='guardar_horario' id='guardar_horario'>
    <div class='container_horario'>
        <div class='cerrar cerrar_div' style='left:730px;width:60px;'>X</div>
        <h2 style='text-align:center;'>Crear Horario</h2>
        <p>Para crear el horario nececita ingresar el lapso, año y seccin para comenzar su creacion</p>

        <div class='input_container'>

            <label for="lapso">Año Escolar</label>
            <select name="ano" id="ano" class='select'>
                <option value="">Seleccione</option>
                <?php
                while ($mostrar = mysqli_fetch_array($ano_escolar)) {
                    echo "<option value='" . $mostrar["codigo"] . "'>" . $mostrar["nombre"] . "</option>";
                }
                ?>

            </select>
        </div>
        <div class='input_container'>
            
            <input type="hidden" id="profesor">
            <label for="docenteCedula">Docente</label>
            <select name="docenteCedula" id="docenteCedula" class='select'>
                <option value="">Seleccione</option>
                <?php
                while ($mostrar = mysqli_fetch_array($docente)) {
                    echo "<option value='" . $mostrar["cedula"] . "'>" . $mostrar["nombre_completo"] ."</option>";
                }
                ?>

            </select>




        </div>


    

        <input type="text" id='valores_horario' name='valores_horario' hidden>
        <input type="text" id='id_intervalo' name='id_intervalo' hidden>
        <input type="text" id='CedulaDocenteModificar' name='CedulaDocenteModificar' hidden>


        <button onclick='CrearHorario()' type='button'>Crear</button>

    </div>

</form>
<div class="horario_wrapper"></div>
    <div class='tabla_horario bg-slate-400 p-2' style=" grid-column-gap: -10px;">
        <span class='titulos'>Lapso:</span>
        <span style='grid-column:2/4;' class='titulos' id='span_lapso'></span>
        <span class='titulos'>Docente:</span>
        <span style='grid-column:5/7;' class='titulos' id='span_docente'></span>
        <div style='height:40px;text-align:center;font-size:22px;background-color:#058671;color:white;cursor: inherit; overflow-y: hidden;'>Hora</div>
        <div style='height:40px;text-align:center;font-size:22px;background-color:#058671;color:white;cursor: inherit;overflow-y: hidden;'>Lunes</div>
        <div style='height:40px;text-align:center;font-size:22px;background-color:#058671;color:white;cursor: inherit;overflow-y: hidden;'>Martes</div>
        <div style='height:40px;text-align:center;font-size:22px;background-color:#058671;color:white;cursor: inherit;overflow-y: hidden;'>Miercoles</div>
        <div style='height:40px;text-align:center;font-size:22px;background-color:#058671;color:white;cursor: inherit;overflow-y: hidden;'>Jueves</div>
        <span style='height:40px;text-align:center;font-size:22px;background-color:#058671;color:white;cursor: inherit;overflow-y: hidden;'>Viernes</span>
    </div>
</div>

</div>
<div class='registrar_materia'>
    <div class='cerrar cerrar_bloque'>X</div>
    <h3>Seleccione el Aula y las seccion  </h3>
    <div class='checkmark_container' style='margin-top:10px;display:inline-block;'>
        <input type="hidden" name="dividir" id="dividir" onclick='CheckedGrupos(this)' style='cursor:pointer;'>
<label for="dividir" style='display:inline-block;margin-left:5px;cursor:pointer;'><b>Dividir en Grupos</b></label>
    </div>
    <h3 style='text-align:center; display:none;' class='grupo1'>GRUPO 1</h3>
    <div class='input_container' style='margin-top:5px;'>
        <label for="">Aula</label>
        <select name="aula" id="aula" onclick=DeshabilitarAulaGrupo();>
            <option value="">Seleccione</option>
            <?php
            while ($mostrar = mysqli_fetch_array($aula)) {
                echo "<option value='" . $mostrar["codigo"] . "'>" . $mostrar["nombre"] . "</option>";
            }
            ?>
        </select>
    </div>
    <div class='input_container' style='margin-top:5px;'>
        <label for="">Año y Sección</label>
      <select name="ano_seccionSelect" id="ano_seccionSelect" class='ano_seccionSelect'>
             <option value="">Seleccione</option>
            <?php
            foreach ($ano_seccionSelect as $mostrarValue) {
                echo "<option value='" . $mostrarValue["codigo"] . "'>" . $mostrarValue["nombresAnoSeccion"] . "</option>";
            }
            ?>
        </select>
    </div>
    <div class='input_container' style='margin-top:5px;'>
        <label for="">Materia</label>
        <select name="materia" id="materia" onclick="ArrayMateria(this, 'profesor', 'profesor2')">
            <option value="">Seleccione</option>
            <?php
            while ($mostrar = mysqli_fetch_array($materia)) {
                echo "<option value='" . $mostrar["codigo"] . "'>" . $mostrar["nombre"] . "</option>";
            }
            ?>
        </select>
    </div>

    <span class='grupo2' style='display:none;'>
        <h3 style='text-align:center;'>GRUPO 2</h3>
        <div class='input_container' style='margin-top:5px;'>
            <label for="">Aula</label>
            <select name="aula2" id="aula2" onclick=DeshabilitarAulaGrupo();>
                <option value="">Seleccione</option>
                <?php
                print_r($aula);
                while ($mostrar2 = mysqli_fetch_array($aula2)) {
                    echo "<option value='" . $mostrar2["codigo"] . "'>" . $mostrar2["nombre"] . "</option>";
                }
                ?>
            </select>
        </div>
        <div class='input_container' style='margin-top:5px;'>
            <label for="">Materia</label>
            <select name="materia2" id="materia2" onclick="ArrayMateria(this, 'profesor2', 'profesor')">
                <option value="">Seleccione</option>
                <?php
                while ($mostrar2 = mysqli_fetch_array($materia2)) {
                    echo "<option value='" . $mostrar2["codigo"] . "'>" . $mostrar2["nombre"] . "</option>";
                }
                ?>
            </select>
        </div>
        <div class='input_container' style='margin-top:5px;'>
            <label for="">Profesor</label>
            <select name="profesor2" id="profesor2" class='select_profesor'>
                <option value="">Selecione</option>
                <?php
                while ($mostrar = mysqli_fetch_array($profesores2)) {
                    echo "<option value='" . $mostrar["cedula"] . "' hidden>" . $mostrar["nombres"] . " " . $mostrar["apellidos"] . "</option>";
                }
                ?>
            </select>
        </div>
    </span>
    <button type="button" onclick='RegistrarBloque()'>Guardar</button>
    <button type="button" onclick='LimpiarBloque()' style='background-color: rgb(255, 30, 30);margin-left:50px;'>Limpiar</button>
</div>
</div>
</body>
<script src="../../../javascript/libquery.js"></script>
<script>

CalcularHora(<?php echo $tiempo . ", '" . $id . "', '" . $hora_inicio . "', '" . $hora_final . "'"; ?>);
</script>

</html>