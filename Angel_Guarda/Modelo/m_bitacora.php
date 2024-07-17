<?php
require_once("basedatos.php");

class Bitacora extends database_connect
{
    private $username;
    private $date;
    private $type;
    private $description;
    private $user_computer;

    public function __construct() {
        $this->username = 0;
        $this->date = "";
        $this->type = "";
        $this->description = "";
        $this->user_computer = "";
    }
    public function setData($username, $type, $description, $user_computer) {
        $this->username = $username;
        // $this->date = $date;
        $this->type = $type;
        $this->description = $description;
        $this->user_computer = $user_computer;
    }
    public function insertBitacora()
    {
        $query = "INSERT INTO bitacora(cedula, type, description, user_computer)
        VALUES (?,?,?,?)";
        $result = $this->query($query,[$this->username, $this->type, $this->description, $this->user_computer]);
        if ($result)
        {
            return true;
        }
        return false;

    }
}
?>