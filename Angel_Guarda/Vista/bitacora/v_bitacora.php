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
    
    <header style="box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px; padding:1rem;">
        <form action="" style="display: flex;  gap:1rem" id="filterFormBitacora">
            <select name="op_type" id="op_type" style="border:1px solid #ddd; max-width:30%">
                <option value="" default>Seleccione el tipo de operacion</option>
                <option value="login">Inicios de sesión</option>
                <option value="error">Errores</option>
                <option value="actualizar">Datos actualizados</option>
                <option value="eliminar">Datos eliminados</option>
                <option value="insertar">Datos agregados</option>
            </select>
            <div>
                Fecha de inicio:
                <input type="date" name="initial_date" id="initial_date"  style="border:1px solid #ddd">
            </div>
            <div>
                Fecha de final:
                <input type="date" name="final_date" id="final_date"  style="border:1px solid #ddd">
            </div>
            
            <input type="text" id="searchBar" name="input_filter" style="border:1px solid #ddd" placeholder="Ingrese el parametro">

            <button type="button" id="searchBarBtn" style="border:1px solid #ddd" >Buscar</button>
        </form>
    </header>
    <table style="margin-top: 2rem; margin-inline:auto;box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px;" id="bitacoraTable">
  <thead>
    <tr>
      <th style="padding: 1rem;">Fecha y Hora</th>
      <th style="padding: 1rem;">Tipo de operación</th>
      <th style="padding: 1rem;">Cédula del usuario</th>
      <th style="padding: 1rem;">Nombre y apellido del usuario</th>
      <th style="padding: 1rem;">Descripción de la operación</th>
      <th style="padding: 1rem;">Computador</th>
    </tr>
  </thead>
  <tbody>
   
  </tbody>
</table>
    <button id="test_button">Get data!</button>
    
</div>
<script type="text/javascript" src="../../../javascript/bitacora.js"></script>

</body>


</html>