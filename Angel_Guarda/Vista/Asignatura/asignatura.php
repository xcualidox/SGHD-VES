<?php
session_start();
include_once("../../control/asignatura_tabla.php");
if ($_SESSION["sesion"]!="admin") {
    header("Location: ../../../index.php");
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Asignaturas</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../Css/asignatura.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <script type="text/javascript" src="../Js/asignatura.js"></script>
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
                <a href="..\..\..\php\controller\c_login.php?op=logout">
                <i class='bx bxs-left-arrow-alt'></i>
                    <span class="nav-item">Inicio</span>
                </a>
                <span class="tooltip">Inicio</span>
            </li>
        </ul>
    </div>

    <div class="main-content">
        <div class="container">
            <h1>Asignaturas</h1>
        </div>
        <a href="asignatura_pdf.php"><button class='table_button' style='margin-left:20px;'>PDF</button></a>
        <div class="tabla"> 
            <table>
                <thead>
    				<td align="center">Codigo</td>
    				<td align="center">Nombre</td>
                    <td class='no_style'></td>
    			</thead>

                <?php
                if (isset($_GET["pag_asig"])==false) {
                    $paginaActual=1;
                }
                else {
                    $paginaActual=$_GET["pag_asig"];
                }

                $limit=$paginaActual*5;
                $offset=$limit-5;
                $objeto= new query();
                $resultado=$objeto->GenerarTabla($offset,$limit);
                $numFilas =$objeto->TotalPaginas();
                for ($i=0; $i < count($resultado); $i++) { 
                ?>

                <tr>
    			    <td class="limitado1"><?php echo $resultado[$i]["codigo"]?></td>
    			    <td class="limitado2"><?php echo $resultado[$i]["nombre"]?></td>
                    <td class="no_style">
                        <button onclick='Eliminar(`<?php echo $resultado[$i]["codigo"]; ?>`)' class='table_button'>Eliminar</button>
                        <button onclick='Modificar(`<?php echo $resultado[$i]["codigo"]; ?>`,`<?php echo $resultado[$i]["nombre"];?>`)' class='table_button'>Modificar</button>
                    </td>
    			</tr>
                
                <?php 
    		    }
                //se calcula el total de paginas diviendolo por la cantidad que quieres que se muestre en este caso que se muestre 6 elementos de la tabla 
                $totalpag=ceil($numFilas/5);
                //Si en tal caso hay un solo elemento igualmente se mostrara una pagina, esto es asi porque al redondear dividir 1 entre 6 siempre dara 0 asi por eso este if  
                echo "<br> <div class='paginacion'>";
                //Esto es tal caso la paginacion siga siendo menor a 10 sigue su curso normal mostrando del 1 al 10
                if ($totalpag<=10) {
                    for ($i=1; $i < $totalpag+1; $i++) {
                        if ($paginaActual==$i) {
                            echo "<a href=?pag_asig=".$i." class='seleccionado' style='color:white;'>".$i."</a>";
                        }
                        else {
                            echo "<a href=?pag_asig=".$i.">".$i."</a>";
                        } 
                    }
                }
                else {
                    //en caso omiso se mostrara los numeros 4 menores al que antes de la pagina actual y 7 numeros mayores a la pagina actual
                    for ($i=$paginaActual-4; $i < $paginaActual+7; $i++) {
                        //este if es en tal caso al seleccionar 1, 2, 3 o 4 no aparezcan numeros negativos o 0
                        if ($i<=0) {
                            $i=1;
                        }
                        //si el $i es mayor al total de paginas se rompe el for
                        if ($i>$totalpag) {
                            break;
                        }
                        if ($paginaActual==$i) {
                            echo "<a href=?pag_asig=".$i." class='seleccionado' style='color:white;'>".$i."</a>";
                        }
                        else {
                            echo "<a href=?pag_asig=".$i.">".$i."</a>";
                        } 
                    }
                    if ($paginaActual+7<$totalpag) {
                        echo "...";
                    }
                }
                
                echo "</div>";
    		    ?>
            </table>
        </div>

        <br>
        <div class="boton1" id="boton1">
                <input type="button" id="btn" onclick="Mostrar()" value="Agregar" class="form">
            </div>

            <div class="boton2" style="display: none;" id="boton2">
                <input type="button" id="btn2" onclick="Mostrar()" value="Cerrar" class="form">
            </div>
        <div class="formulario">
            

            <br>

            <form id="form" style="display: none;" name="pantalla" class='pantalla' method="POST" action="../../Control/asignatura.php">
                <br>

                <label for="cod">Codigo: </label><br>
                <input type="text" id="cod" name="cod" placeholder="Codigo de asignatura" class="formulario__input"> 
    
                <br><br>
                <label for="nom">Nombre: </label><br>
                <input type="text" id="nom" name="nom" placeholder="Nombre de asignatura" class="formulario__input">

                <br><br>

                <input type="hidden" name="ope" id='ope'>
                <input type="hidden" name="origin" id='origin'>
                <input type="button" id="btn3" onclick="Enviar(this.value)" value="Incluir" class="table_button">
            </form>
        </div>
    </div>

</body>

<script>
    let btn = document.querySelector('#btn');
    let sidebar = document.querySelector('.sidebar');

    btn.onclick = function (){
        sidebar.classList.toggle('active')
    };
</script>
</html>