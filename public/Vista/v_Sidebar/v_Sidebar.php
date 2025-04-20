<!DOCTYPE html>
<html lang="en">

<head>
    <title><?php echo htmlspecialchars($title); ?></title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../../../styles/a_escolar.css">

    <script src="../../../javascript/libquery.js"></script>
    <link rel="stylesheet" href="../../../styles/main.css">
    <link rel="stylesheet" href="../../../styles/tablas.css">
    <link rel="stylesheet" href="../../../styles/pagination.css">
</head>

<body>

    <div class="sidebar">
        <div class="top">
            <div class="logo"></div>

            <img src="../../../images/icons/menu.svg" id="btn" class=" w-10  filtro-blanco">

        </div>
        <div class="user">
            <img src="../../../images/LogoWhite.jpg" alt="Logo" class="user-img">
            <div>
                <p class="bold">Vicente Emilio Sojo</p>
            </div>
        </div>
        <ul>
            <!-- Representante -->
     
            <?php
            if ($_SESSION["sesion"] == "admin" || $_SESSION["sesion"] == "administrador" || $_SESSION["sesion"] == 'coordinador') {


                if ($_SESSION["sesion"] == "admin" || $_SESSION["sesion"] == "administrador") {
                    echo ' 
                        <li>
            <a href="../v_estudiante/v_estudiante.php" class="flex items-center" title="Estudiante y Representante">
                 <i class="flex  justify-center  items-center ">
                    <img src="../../../images/icons/estudianteRepresentante.svg" class="w-8  filtro-blanco">
                </i>
                <span class="nav-item">Estudiante/Reg</span>
            </a>
            <span class="tooltip">Estudiante/Reg</span>
        </li> 
             
                    
                    
                    <li>
                        <a href="../Asignatura/v_asignatura.php" class="flex items-center" title="Asignatura">
                            <i class="flex  justify-center  items-center ">
                                <img src="../../../images/icons/documento.svg" class="w-8  filtro-blanco">
                            </i>
                            <span class="nav-item">Asignatura</span>
                        </a>
                        <span class="tooltip">Asignatura</span>
                    </li>
                    <li>
                        <a href="../profesor/v_profesor.php" title="Profesor">
                            <i class="flex  justify-center  items-center ">
                        
                                <img src="../../../images/icons/persona.svg" class=" w-8 filtro-blanco">
                        
                            </i>
                            <span class="nav-item">Profesor</span>
                        </a>
                        <span class="tooltip">Profesor</span>
                    </li>
                    <li>
                        <a href="../Profesores_Materias/profesor_materia.php" title="Asignar Materias docentes">
                            <i class="flex  justify-center  items-center ">
                                <img src="../../../images/icons/pensum3.svg" class="w-8  filtro-blanco">
                            </i>
                            <span class="nav-item">Asignar_Materias</span>
                        </a>
                        <span class="tooltip">Asignar_Materias</span>
                    </li>
                    <li>
                        <a href="../aula/v_aula.php" title="Aula">
                            <i class="flex  justify-center  items-center ">
                                <img src="../../../images/icons/classroom.svg" class="w-8  filtro-blanco">
                            </i>
                            <span class="nav-item">Aula</span>
                        </a>
                        <span class="tooltip">Aula</span>
                    </li>
                    <li>
                        <a href="../seccion/v_seccion.php" title="Año Seccion">
                            <i class="flex  justify-center  items-center ">
                                <img src="../../../images/icons/seccion.svg" class="w-8  filtro-blanco">
                            </i>
                            <span class="nav-item">Grado</span>
                        </a>
                        <span class="tooltip">Grado</span>
                    </li>
                    <li>
                        <a href="../escolar/v_escolar.php" title="Año Escolar">
                            <i class="flex  justify-center  items-center ">
                                <img src="../../../images/icons/calendario.svg" class="w-8  filtro-blanco">
                            </i>
                            <span class="nav-item">Periodo</span>
                        </a>
                        <span class="tooltip">Periodo</span>
                    </li>
                    <li>
                        <a href="../intervalo/v_intervalo.php" title="Intervalo">
                            <i class="flex  justify-center  items-center ">
                                <img src="../../../images/icons/intervalo.svg" class="w-8  filtro-blanco">
                            </i>
                            <span class="nav-item">Intervalo</span>
                        </a>
                        <span class="tooltip">Intervalo</span>
                    </li>
                    <li>
                        <a href="../Horario/horario.php" title="Horario">
                            <i class="flex  justify-center  items-center ">
                                <img src="../../../images/icons/calendariolapiz.svg" class="w-8  filtro-blanco">
                            </i>
                            <span class="nav-item">Horario</span>
                        </a>
                        <span class="tooltip">Horario</span>
                    </li>';
                }


                if ($_SESSION["sesion"] == "admin") {
                    echo ' <li>
                    <a href="../bitacora/v_bitacora.php" title="Historial de Sistema">
                        <i class="flex  justify-center  items-center ">
                            <img src="../../../images/icons/logs.svg" class="w-8  filtro-blanco">
                        </i>
                        <span class="nav-item">Historial</span>
                    </a>
                    <span class="tooltip">Historial</span>
                </li>';
                }
                if ($_SESSION["sesion"] == "coordinador") {
                    echo '  <li>
                        <a href="../Horario/horario.php" title="Horario">
                            <i class="flex  justify-center  items-center ">
                                <img src="../../../images/icons/calendariolapiz.svg" class="w-8  filtro-blanco">
                            </i>
                            <span class="nav-item">Horario</span>
                        </a>
                        <span class="tooltip">Horario</span>
                    </li>';
                }
                if ($_SESSION["sesion"] == "secretario") {
                    echo '             
                    <li>
                <a href="../v_estudiante/v_estudiante.php" class="flex items-center" title="Estudiante y Representante">
                     <i class="flex  justify-center  items-center ">
                        <img src="../../../images/icons/estudianteRepresentante.svg" class="w-8  filtro-blanco">
                    </i>
                    <span class="nav-item">Estudiante/Reg</span>
                </a>
                <span class="tooltip">Estudiante/Reg</span>
            </li> ';
                }

               
            }
            ?>


            <li>
                <a href="../../../php/controller/c_login.php?op=logout">
                    <i class="flex  justify-center  items-center ">
                        <img src="../../../images/icons/logOut.svg" class="w-8  filtro-blanco">
                    </i>
                    <span class="nav-item">Cerrar</span>
                </a>
                <span class="tooltip">Cerrar</span>
            </li>
        </ul>

    </div>


    <script>
        let btn = document.querySelector('#btn');
        let sidebar = document.querySelector('.sidebar');

        btn.onclick = function() {
            sidebar.classList.toggle('active');
        };
    </script>





</body>
<div class="center__preload hidden">
<div class="lds-spinner"><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div></div>
</div>
</html>