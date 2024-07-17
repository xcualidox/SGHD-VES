<?php
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}
if ($_SESSION["sesion"])
{
   
    // $bitacoraOp = $_POST["op"];

    function insertBitacora($username, $type, $description)
    {
        // Refactorizar instanciacion de la clase Bitacora
        require_once(dirname(__DIR__)."\Modelo\m_bitacora.php");
        $bitacora = new Bitacora();
        $bitacora->setData($username, $type, $description, gethostname());
        $bitacora->insertBitacora();

    }

    // switch ($bitacoraOp) {
    //     case "insert":
    //         login($_POST["username"], $_POST["password"], $_POST["op"]);
    //         break;
    //     case "get":
    //         logout();
    //         break;
    // }
}
?>