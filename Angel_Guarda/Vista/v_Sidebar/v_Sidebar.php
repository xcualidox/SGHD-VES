
    

<!DOCTYPE html>
<html lang="en">
<head>
<title><?php echo htmlspecialchars($title); ?></title>



    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../../../styles/a_escolar.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" href="../../../styles/main.css">
</head>
<body>
<div class="sidebar active ">
        <div class="top">
            <div class="logo"> 
            </div>
            <i class="bx bx-menu " id="btn"></i>
        </div>

      

        <div class="user">
            <img src="../../../images/LogoWhite.jpg" alt="Logo" class="user-img">
            <div>
                <p class="bold ">Vicente Emilio Sojo</p>
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
  



<script>
    let btn = document.querySelector('#btn');
    let sidebar = document.querySelector('.sidebar');

    btn.onclick = function (){
        sidebar.classList.toggle('active')
    };
</script>