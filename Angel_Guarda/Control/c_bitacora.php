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
    if(isset($_POST["op"]))
    {
        $bitacoraOp = $_POST["op"];
        switch ($bitacoraOp) 
        {
            case "get_all":
                include_once("utilities/pagination.php");
                $op_type = $_POST["op_type"];
                $date_filter = (empty($_POST["initial_date"]) && empty($_POST["final_date"]) ? "" : 
                (empty($_POST["final_date"]) ? ["inicio" => $_POST["initial_date"]] : 
                (empty($_POST["initial_date"] ? ["final" => $_POST["final_date"]] : 
                ["inicio" => $_POST["initial_date"], "final" => $_POST["final_date"]]))));
                $input_filter = $_POST["input_filter"];
                echo pagination($bitacora = new Bitacora(), 1, ["op_type" => $op_type , "date"=>  $date_filter , "input_filter"=> $input_filter ]);
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