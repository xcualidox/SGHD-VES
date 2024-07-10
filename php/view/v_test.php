<?php
session_start();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>prueba</title>
</head>
<body>
    <h1>
       Binviendo <?php echo $_SESSION["rol"]?>, <?php echo $_SESSION["username"]; ?>
    </h1>
    <form action="../controller/c_login.php" method="post">
        <input type="hidden" name="op" value="logout">
        <button type="submit">Cerrar sesion</button>
    </form>
    
</body>
</html>