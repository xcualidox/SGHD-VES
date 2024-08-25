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

<div class="sidebar ">
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
       
            <a href="../Horario/horario.php" title="Horario">
                 <i class="flex  justify-center  items-center ">
                    <img src="../../../images/icons/calendariolapiz.svg" class="w-8  filtro-blanco">
                </i>
                <span class="nav-item">Horario</span>
            </a>
            <span class="tooltip">Horario</span>
        </li>
        <li>
      
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

    btn.onclick = function () {
        sidebar.classList.toggle('active');
    };
</script>

</body>
</html>
