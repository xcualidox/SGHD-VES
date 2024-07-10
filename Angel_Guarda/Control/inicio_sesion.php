<?php 
session_start();
include_once("../Modelo/inicio_sesion.php");
$operacion = new zona();

if (isset($_SESSION["usuario"])) {
    $operacion->setDatos($_SESSION["usuario"]);
    $operacion->CrearClave($_POST["clave"], $_POST["pregunta"], $_POST["respuesta"]);
    unset($_SESSION["usuario"]);
    $_SESSION["error"]="alert('Su clave ha sido creada exitosamente. Ya puede ingresar')";
    header("Location: ../../../index.php");
}
else {
    $operacion->setDatos($_POST["usuario"]);
    $validar=$operacion->validar();
    if (count($validar)==0) {
        $_SESSION["error"]="alert('La cedula que ingreso no existe, por favor intente otra vez')";
        header("Location: ../../../index.php");
     }
     else if (count($validar)>0 && $validar[0][6]==""){
         header("Location: ../Vista/crear_clave.php");
         $_SESSION["usuario"]=$_POST["usuario"];
     }
     else {
         if ($validar[0][7]=="ANGEL2023" && $_POST["clave"]=="ANGEL2023") {
             header("Location: ../Vista/Asignatura/asignatura.php");
             $_SESSION["sesion"]="admin";
         }
         else if($validar[0][7]!=$_POST["clave"]) {
             $_SESSION["error"]="alert('La clave que ingreso es incorrecta, vuelva a intentarlo')";
             header("Location: ../../../index.php");
         }
         else {
            $_SESSION["sesion"]="usuario";
            header("Location: ../Vista/Horario/horario_usuario.php");
         }
     }
}

?>