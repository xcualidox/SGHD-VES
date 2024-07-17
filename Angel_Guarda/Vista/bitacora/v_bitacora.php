<?php
session_start();
// include_once("../../control/asignatura_tabla.php");


if ($_SESSION["sesion"]!="admin") {
    header("Location: ../../../index.php");
}
$title = 'Historial de Sistema';
include_once('../v_Sidebar/v_Sidebar.php');

?>
<!-- Hereda del Padre Sidebar -->


<div class="main-content">
    
    <h1>Hola UWU</h1>
    <?php
    echo gethostname();
    ?>
    
    
</div>
<script type="text/javascript" src="../../../javascript/bitacora.js"></script>

</body>


</html>