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
    

<!-- Sidebar -->
<div class="sidebar collapsed" id="sidebar">
  <div class="top">
    <div class="logo">
    </div>
    <button class="toggle-btn" id="toggleSidebar">
      <img src="../../../images/icons/menu.svg" class="filtro-blanco" alt="Menu">
    </button>
  </div>

  <div class="user">
    <img src="../../../images/LogoWhite.jpg" alt="Logo" class="user-img" style="width:40px;border-radius:50%;">
    <p class="bold" style="color:white;">Vicente Emilio Sojo</p>
  </div>

  <ul>
    <!-- Aquí sigue tu PHP dinámico para roles -->
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
        </li> 
             
                    
                    
                    <li>
                        <a href="../Asignatura/v_asignatura.php" class="flex items-center" title="Asignatura">
                            <i class="flex  justify-center  items-center ">
                                <img src="../../../images/icons/documento.svg" class="w-8  filtro-blanco">
                            </i>
                            <span class="nav-item">Asignatura</span>
                        </a>
                    </li>
                    <li>
                        <a href="../profesor/v_profesor.php" title="Profesor">
                            <i class="flex  justify-center  items-center ">
                        
                                <img src="../../../images/icons/persona.svg" class=" w-8 filtro-blanco">
                        
                            </i>
                            <span class="nav-item">Profesor</span>
                        </a>
                    </li>
                    <li>
                        <a href="../Profesores_Materias/profesor_materia.php" title="Asignar Materias docentes">
                            <i class="flex  justify-center  items-center ">
                                <img src="../../../images/icons/pensum3.svg" class="w-8  filtro-blanco">
                            </i>
                            <span class="nav-item">Asignar_Materias</span>
                        </a>
                    </li>
                    <li>
                        <a href="../aula/v_aula.php" title="Aula">
                            <i class="flex  justify-center  items-center ">
                                <img src="../../../images/icons/classroom.svg" class="w-8  filtro-blanco">
                            </i>
                            <span class="nav-item">Aula</span>
                        </a>
                    </li>
                    <li>
                        <a href="../seccion/v_seccion.php" title="Año Seccion">
                            <i class="flex  justify-center  items-center ">
                                <img src="../../../images/icons/seccion.svg" class="w-8  filtro-blanco">
                            </i>
                            <span class="nav-item">Grado</span>
                        </a>
                    </li>
                    <li>
                        <a href="../escolar/v_escolar.php" title="Año Escolar">
                            <i class="flex  justify-center  items-center ">
                                <img src="../../../images/icons/calendario.svg" class="w-8  filtro-blanco">
                            </i>
                            <span class="nav-item">Periodo</span>
                        </a>
                    </li>
                    <li>
                        <a href="../intervalo/v_intervalo.php" title="Intervalo">
                            <i class="flex  justify-center  items-center ">
                                <img src="../../../images/icons/intervalo.svg" class="w-8  filtro-blanco">
                            </i>
                            <span class="nav-item">Intervalo</span>
                        </a>
                    </li>
                    <li>
                        <a href="../Horario/horario.php" title="Horario">
                            <i class="flex  justify-center  items-center ">
                                <img src="../../../images/icons/calendariolapiz.svg" class="w-8  filtro-blanco">
                            </i>
                            <span class="nav-item">Horario</span>
                        </a>
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
            </li> ';
                }

               
            }
            ?>
    <li>
      <a href="../../../php/controller/c_login.php?op=logout">
        <img src="../../../images/icons/logOut.svg"> <span class="nav-item">Cerrar</span>
      </a>
    </li>
  </ul>
</div>

<!-- Main Content -->
<div class="main-content" id="mainContent">
  <!-- Aquí va tu contenido principal -->
</div>

<script>
  const sidebar = document.getElementById('sidebar');
  const toggleBtn = document.getElementById('toggleSidebar');

  toggleBtn.addEventListener('click', () => {
    if (window.innerWidth > 768) {
      sidebar.classList.toggle('collapsed');
    } else {
      sidebar.classList.toggle('active');
    }
  });

  // Cerrar sidebar móvil al hacer click afuera (opcional)
  document.addEventListener('click', (e) => {
    if (!sidebar.contains(e.target) && !toggleBtn.contains(e.target) && window.innerWidth <= 768) {
      sidebar.classList.remove('active');
    }
  });


</script>

</body>
<div class="center__preload hidden">
<div class="lds-spinner"><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div></div>
</div>
</html>