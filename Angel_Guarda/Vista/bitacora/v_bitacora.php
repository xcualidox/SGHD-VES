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
        <form action="#" method="POST" style="display: flex;  gap:1rem" id="filterFormBitacora">
            <select name="op_type" id="op_type" style="border:1px solid #ddd; max-width:30%">
                <option value="" default>Seleccione el tipo de operacion</option>
                <option value="login">Inicios de sesión</option>
                <option value="error">Errores</option>
                <option value="modificar">Datos actualizados</option>
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
            <button type="button" id="resetFilterBtn" style="border:1px solid #ddd" >Limpiar</button>
        </form>
    </header>
    <div class="table-wrapper min-w-full">
    <table style="margin-top: 2rem; margin-inline:auto;box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px;" id="bitacoraTable">
  <thead>
    <tr>
      <th style="color:white; padding: 1rem; background-color:#058671;">Fecha y Hora</th>
      <th style="color:white;padding: 1rem;background-color:#058671;">Tipo de operación</th>
      <th style="color:white;padding: 1rem;background-color:#058671;">Cédula del usuario</th>
      <th style="color:white; padding: 1rem;background-color:#058671;; ">Nombre y apellido del usuario</th>
      <th style="color:white;padding: 1rem;background-color:#058671;;">Descripción de la operación</th>
      <th style="color:white;padding: 1rem; background-color:#058671;;">Computador</th>
    </tr>
  </thead>
  <tbody>
   
  </tbody>
</table>
<!-- Aparecera cuando no se encuentren resultados -->
<p class="mx-auto text-center hidden" style="margin-top:5rem;" id="noResultMsg">No se encontraron resultados...</p>
<!-- Aqui va los controles del paginado -->
<div id="pagination-container" class="mx-auto flex justify-center mt-8"></div> 

    
</div>
<!-- Jquery y pluign de paginado -->
<script src="../../../javascript/jquery-3.7.1.min.js"></script>
<script src="../../../javascript/pagination.js"></script>
<!-- Js principal de la vista paginado -->
<script type="text/javascript" src="../../../javascript/bitacora.js"></script>

</body>


</html>