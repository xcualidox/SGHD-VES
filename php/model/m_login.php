<?php
require_once("m_db.php");
class Login extends db_connect
{
    private $username;
    private $password;
    private $security_q_1;
    private $security_q_2;
    private $security_q_3;
    private $security_a_1;
    private $security_a_2;
    private $security_a_3;
    private $rol;
    private $status;

    public function __construct() {
        $this->username = 0;
        $this->password = "";
        $this->security_q_1 = "";
        $this->security_q_2 = "";
        $this->security_q_3 = "";
        $this->security_a_1 = "";
        $this->security_a_2 = "";
        $this->security_a_3 = "";
        $this->rol = "";
        $this->status = "";
    }
    public function setData($username, $password, $security_q_1, $security_q_2, $security_q_3, $security_a_1, $security_a_2, $security_a_3, $status) {
        $this->username = $username;
        $this->password = $password;
        $this->security_q_1 = $security_q_1;
        $this->security_q_2 = $security_q_2;
        $this->security_q_3 = $security_q_3;
        $this->security_a_1 = $security_a_1;
        $this->security_a_2 = $security_a_2;
        $this->security_a_3 = $security_a_3;
        $this->status = $status;
    }
    public function setUsername($username)
    {
        $this->username = $username;
    }
    public function setPassword($password)
    {
        $this->password = $password;
    }
    public function setRol($rol)
    {
        $this->rol = $rol;
    }
    public function checkLogin()
    {
        $query = "SELECT `username`, `password`, `rol`, `status` FROM login WHERE `username` = ? ";
        $result = $this->query($query, $this->username);
        return $result ? $this->fetch_query($result) : false;
    }

    public function createLogin()
    {
        $query = "INSERT INTO `login`(`username`, `password`, `security_q_1`, `security_q_2`, `security_q_3`, `security_a_1`, `security_a_2`, `security_a_3`, `rol`, `status`) VALUES
        (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        $params = [$this->username, $this->password, '', '', '', '', '', '', $this->rol, "new"];   
        return $this->query($query, $params);
    }
    public function getStatus()
    {
        $query = "SELECT `status` FROM login WHERE `username` = ? ";
        $result = $this->query($query, $this->username);
        return $result ? $this->fetch_query($result) : false;
    }
    public function getSecurityQuestions()
    {
        $query = "SELECT `security_q_1`, `security_q_2`, `security_q_3` FROM login WHERE `username` = ? ";
        $result = $this->query($query, $this->username);
        return $result ? $this->fetch_query($result) : false;
    }
    public function getSecurityAnswers()
    {
        $query = "SELECT `security_a_1`, `security_a_2`, `security_a_3` FROM login WHERE `username` = ? ";
        $result = $this->query($query, $this->username);
        return $result ? $this->fetch_query($result) : false;
    }
    public function getUserData()
    {
        $query = "SELECT CONCAT(p.`nombres`,' ', p.`apellidos`)  as fullname, l.`status` FROM personas AS p INNER JOIN login AS l ON p.cedula = l.username WHERE p.`cedula` = ? ";
        $result = $this->query($query, $this->username);
        return $result ? $this->fetch_query($result) : false;
    }

    public function modificarRol($username, $rol) {
        $query = "UPDATE `login` SET `rol` = ? WHERE `username` = ?";
        return $this->query($query, [$rol, $username]);
    }
    
    public function changePw()
    {
        $query = "UPDATE login SET `password` = ? WHERE `username` = ?";
        $result = $this->query($query, [$this->password, $this->username]);
        return $result;
    }
    public function setPwSQ()
    {
        $query = "UPDATE login SET 
        `password` = ?, 
        `security_q_1` = ?, 
        `security_q_2` = ?, 
        `security_q_3` = ?, 
        `security_a_1` = ?, 
        `security_a_2` = ?, 
        `security_a_3` = ?, 
        `status` = ? 
        WHERE `username` = ?";
        $params = [
                $this->password,
                $this->security_q_1,
                $this->security_q_2,
                $this->security_q_3,
                $this->security_a_1,
                $this->security_a_2,
                $this->security_a_3,
                $this->status,
                $this->username
            ];
        return $this->query($query, $params);
    }

}
?>