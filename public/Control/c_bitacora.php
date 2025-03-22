<?php
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}
if ($_SESSION["sesion"])
{
    require_once(dirname(__DIR__)."\Modelo\m_bitacora.php");
    // $bitacoraOp = $_POST["op"];

    function insertBitacora($username, $type, $description)
    {
        // Refactorizar instanciacion de la clase Bitacora
        $bitacora = new Bitacora();
        $bitacora->setData($username, $type, $description, gethostname());
        $bitacora->insertBitacora();

    }
    if(isset($_GET["op"]))
    {
        $bitacoraOp = $_GET["op"];
        switch ($bitacoraOp) 
        {
            case "get_all":
                include_once("utilities/pagination.php");
                $op_type = $_GET["op_type"];
                $date_filter = (empty($_GET["initial_date"]) && empty($_GET["final_date"])) ? "" : 
               (empty($_GET["final_date"]) ? ["inicio" => $_GET["initial_date"]] : 
               (empty($_GET["initial_date"]) ? ["final" => $_GET["final_date"]] : 
               ["inicio" => $_GET["initial_date"], "final" => $_GET["final_date"]]));
                $input_filter = $_GET["input_filter"];
                echo pagination($bitacora = new Bitacora(), $_GET["pageNumber"], ["op_type" => $op_type , "date"=>  $date_filter , "input_filter"=> $input_filter ]);
                exit();
                break;
        }
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