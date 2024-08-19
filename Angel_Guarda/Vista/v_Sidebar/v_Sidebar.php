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
</head>
<body>

<div class="sidebar active">
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
        <li>
            <a href="../Asignatura/asignatura.php" class="flex items-center" title="Asignatura">
                <i class="w-10 p-2">
                    <img src="../../../images/icons/documento.svg" class="filtro-blanco">
                </i>
                <span class="nav-item">Asignatura</span>
            </a>
            <span class="tooltip">Asignatura</span>
        </li>
        <li>
            <a href="../Profesor/profesor.php" title="Profesor">
                <i class="w-10 p-2">
                    <img src="../../../images/icons/persona.svg" class="filtro-blanco">
                </i>
                <span class="nav-item">Profesor</span>
            </a>
            <span class="tooltip">Profesor</span>
        </li>
        <li>
            <a href="../Profesores_Materias/profesor_materia.php" title="Profesor PENSUM">
                <i class="w-10 p-2">
                    <img src="../../../images/icons/pensum3.svg" class="filtro-blanco">
                </i>
                <span class="nav-item">PEMSUN</span>
            </a>
            <span class="tooltip">PENSUM</span>
        </li>
        <li>
            <a href="../Aula/aula.php" title="Aula">
                <i class="w-10 p-2">
                    <img src="../../../images/icons/classroom.svg" class="filtro-blanco">
                </i>
                <span class="nav-item">Aula</span>
            </a>
            <span class="tooltip">Aula</span>
        </li>
        <li>
            <a href="../A_seccion/a_seccion.php" title="Año Seccion">
                <i class="w-10 p-2">
                    <img src="../../../images/icons/seccion.svg" class="filtro-blanco">
                </i>
                <span class="nav-item">Grado</span>
            </a>
            <span class="tooltip">Grado</span>
        </li>
        <li>
            <a href="../A_escolar/a_escolar.php" title="Año Escolar">
                <i class="w-10 p-2">
                    <img src="../../../images/icons/calendario.svg" class="filtro-blanco">
                </i>
                <span class="nav-item">Periodo</span>
            </a>
            <span class="tooltip">Periodo</span>
        </li>
        <li>
            <a href="../Intervalo/intervalo.php" title="Intervalo">
                <i class="w-10 p-2">
                    <img src="../../../images/icons/intervalo.svg" class="filtro-blanco">
                </i>
                <span class="nav-item">Intervalo</span>
            </a>
            <span class="tooltip">Intervalo</span>
        </li>
        <li>
            <a href="../Horario/horario.php" title="Horario">
                <i class="w-10 p-2">
                    <img src="../../../images/icons/calendariolapiz.svg" class="filtro-blanco">
                </i>
                <span class="nav-item">Horario</span>
            </a>
            <span class="tooltip">Horario</span>
        </li>
        <li>
            <a href="../bitacora/v_bitacora.php" title="Historial de Sistema">
                <i class="w-10 p-2">
                    <img src="../../../images/icons/logs.svg" class="filtro-blanco">
                </i>
                <span class="nav-item">Historial</span>
            </a>
            <span class="tooltip">Historial</span>
        </li>
        <li>
            <a href="../../../php/controller/c_login.php?op=logout">
                <i class="w-10 p-2">
                    <img src="../../../images/icons/logOut.svg" class="filtro-blanco">
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

    btn.onclick = function () {
        sidebar.classList.toggle('active');
    };
</script>

</body>
</html>
