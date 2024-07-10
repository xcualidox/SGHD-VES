<?php
if (isset($_POST["op"]))
{
require_once("../model/m_login.php");
$login = new Login();
$loginOp = $_POST["op"];
function setFirstLogin($username)
{
    $GLOBALS["login"]->setUsername($username);
    $options = [
        'pet' => '¿Cuál es el nombre de tu primera mascota?',
        'school' => '¿Cuál es el nombre de tu escuela primaria?',
        'city' => '¿En qué ciudad naciste?',
        'friend' => '¿Cuál es el nombre de tu mejor amigo de la infancia?',
    ];
    $hasError = false;
    $errorLocation = "../../index.php?result=error";

    if (!emptyValues($_POST["username"], $_POST["firstLogin_q_1"], $_POST["firstLogin_a_1"], $_POST["firstLogin_q_2"], $_POST["firstLogin_a_2"], $_POST["firstLogin_q_3"] ,$_POST["firstLogin_a_3"], $_POST["firstPw"], $_POST["firstPwConfirm"], $_POST["firstLogin_a_2"])) {
        $hasError = true;
    } 
    elseif (!validateInput($username, $_POST["firstPw"]) || !validText($_POST["firstLogin_q_1"], $_POST["firstLogin_a_1"], $_POST["firstLogin_q_2"], $_POST["firstLogin_a_2"], $_POST["firstLogin_q_3"] ,$_POST["firstLogin_a_3"])) {
        $hasError = true;
    }
    elseif ($_POST["firstPw"] != $_POST["firstPwConfirm"])
    {
        $hasError = true;
    } 
    elseif (!getUserData($username) || getUserData($username)["status"] != "new") {
        $hasError = true;
    }
    if ($hasError) {
        header("Location: $errorLocation");
        exit;
    }
    $password = passwordEncrypt($_POST['firstPw']);
    $security_q_1 = $options[$_POST['firstLogin_q_1']];
    $security_q_2 = $options[$_POST['firstLogin_q_2']];
    $security_q_3 = $options[$_POST['firstLogin_q_3']];
    $security_a_1 = passwordEncrypt(trim($_POST['firstLogin_a_1']));
    $security_a_2 = passwordEncrypt(trim($_POST['firstLogin_a_2']));
    $security_a_3 = passwordEncrypt(trim($_POST['firstLogin_a_3']));
    $status = "active";
    $GLOBALS["login"]->setData($username, $password, $security_q_1, $security_q_2, $security_q_3, $security_a_1, $security_a_2, $security_a_3, $status);
    if ($GLOBALS["login"]->setPwSQ())
    {
        login($username, $_POST["firstPw"], "login");
    }
    else
    {
        header("Location: $errorLocation");
        exit;
    }
}

function getLogin($username, $pw)
{
    $GLOBALS["login"]->setUsername($username);
    $result =  $GLOBALS["login"]->checkLogin();
    if ($result) {
        return [password_verify($pw, $result["password"]), $result["rol"], $result["status"]];
    }
    return [false];
}
function getUserData($username)
{
    $GLOBALS["login"]->setUsername($username);
    return $GLOBALS["login"]->getUserData();
}
// validate text inputs
function validText(...$values)
{
    foreach ($values as $value)
    {
        $textRegex = '/^[^$%&|<>#]*$/';
        if (!preg_match($textRegex, $value))
        {
            return false;
        }
    }
    return true;
}
// esta funcion se puede refactorizar
function emptyValues(...$values)
{
    foreach ($values as $value)
    {
        if (empty(trim($value)))
        {
            return false;
        }
    }
    return true;
}
function getSecurityQuestions($username)
{
    if (!emptyValues($username))
    {
        echo json_encode(array("result" => false, "msg" => "Por favor ingrese su cédula!"));
        exit();
    }
    if (validateUserInput($username))
    {
        $GLOBALS["login"]->setUsername($username);
        $result = $GLOBALS["login"]->getSecurityQuestions($username);
        $status = $GLOBALS["login"]->getStatus();
        if (!$result)
        {
            echo json_encode(array("result" => false, "msg" => "Este usuario no se encuentra registrado!"));
            exit();
        }
        elseif ($status["status"] == "new")
        {
            echo json_encode(array("result" => false, "msg" => "Debe iniciar sesión por primera vez!"));
            exit();
        }
        echo json_encode(array("result" => true, "data" =>$result));
        exit();
    }
    echo json_encode(array("result" => false, "msg" => "Cédula no valida!"));
    exit();


}
function validateSecurityA($username, $securityA1, $securityA2, $securityA3)
{
    if (!emptyValues($securityA1, $securityA2, $securityA3))
    {
        echo json_encode(array("result" => false, "msg" => "Por favor rellene todos los campos!"));
        exit();
    }
    if (!validText($securityA1, $securityA2, $securityA3))
    {
        echo json_encode(array("result" => false, "msg" => "Las respuestas contienen caracteres no permitidos!"));
        exit();
    }
    $GLOBALS["login"]->setUsername($username);
    $result = $GLOBALS["login"]->getSecurityAnswers($username);
    if ($result)
    {
        if (password_verify($securityA1, $result["security_a_1"]) && password_verify($securityA2, $result["security_a_2"]) && password_verify($securityA3, $result["security_a_3"]))
        {
            echo json_encode(array("result" => true, "msg" => "ok"));
            exit();
        }
        echo json_encode(array("result" => false, "msg" => "Respuestas incorrectas!"));
        exit();
    }
}
function changePw($username, $pw)
{
    $GLOBALS["login"]->setUsername($username);
    $checkAnswers = $GLOBALS["login"]->getSecurityAnswers($username);

    $hasError = false;
    $errorLocation = "../../index.php?result=error";

    if (!emptyValues($_POST["username"], $_POST["security_a_1"], $_POST["security_a_2"], $_POST["security_a_3"], $_POST["newPw"])) {
        $hasError = true;
    } 
    elseif (!validateInput($username, $pw) || !validText($_POST["security_a_1"], $_POST["security_a_2"], $_POST["security_a_3"])) {
        $hasError = true;
    } 
    elseif (!getUserData($_POST["username"])) {
        $hasError = true;
    } 
    elseif (!password_verify($_POST["security_a_1"], $checkAnswers["security_a_1"]) || 
              !password_verify($_POST["security_a_2"], $checkAnswers["security_a_2"]) || 
              !password_verify($_POST["security_a_3"], $checkAnswers["security_a_3"])) {
        $hasError = true;
    }

    if ($hasError) {
        header("Location: $errorLocation");
        exit;
    }

    $GLOBALS["login"]->setPassword(passwordEncrypt($pw));
    $GLOBALS["login"]->changePw();
    header("Location: ../../index.php?result=ok");
    exit;
}

function passwordEncrypt($pw)
{
    return password_hash($pw, PASSWORD_DEFAULT);
}
function validateInput($username, $pw)
{
    $pwRegex = '/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()\-_])[A-Za-z\d!@#$%^&*()\-_]{8,20}$/';
    $usernameRegex = '/^\d{7,10}$/';
    return preg_match($usernameRegex, $username) && preg_match($pwRegex, $pw);
}

function validateUserInput($username)
{
    $usernameRegex = '/^\d{7,10}$/';
    return preg_match($usernameRegex, $username);
}

function login($username, $pw, $op)
{
    if (!emptyValues($pw, $username))
    {
        echo json_encode(array("result" => false, "msg" => "Por favor rellene todos los campos!"));
        exit();
    }
    if (validateInput($username, $pw) || (validateUserInput($username) && $username == $pw)) {
        $loginResult = getLogin($username, $pw);
        if ($loginResult[0] && $loginResult[2] == "active") {
            if ($op == "check") {
                echo json_encode(array("result" => true, "msg" => "ok"));
                exit();
            }
            session_start();
            // $_SESSION['username'] = getUserData($username)["fullname"];
            $_SESSION['sesion'] = $loginResult[1];
            if ($_SESSION['sesion'] == "admin"){
                header("Location: ../../Angel_guarda/Vista/Asignatura/asignatura.php");
                // echo "angel";
            }
            else if ($_SESSION['sesion'] == "usuario"){
                header("Location: ../..//Angel_guarda/Vista/Horario/horario_usuario.php");
            }
            exit();
        }
        else if($loginResult[0] && $loginResult[2] == "new")
        {
            echo json_encode(array("result" => true, "msg" => "new"));
            exit();
        }
        else {
            echo json_encode(array("result" => false, "msg" => "Usuario o contraseña incorrectos!"));
            exit();
        }
    } else {
        if ($op == "check") {
            echo json_encode(array("result" => false, "msg" => "Los datos ingresados no son validos!"));
            exit();
        }
        header("Location: ../../index.php");
        exit();
    }
}
function logout()
{
    session_start();
    // $_SESSION['username'] = "";
    $_SESSION['sesion'] = "";
    session_destroy();
    header("Location: ../../index.php");
    exit();
}
switch ($loginOp) {
    case "check":
    case "login":
        login($_POST["username"], $_POST["password"], $_POST["op"]);
        break;
    case "logout":
        logout();
        break;
    case "securityQ":
        getSecurityQuestions($_POST["username"]);
        break;
    case "validateSecurityA":
        validateSecurityA($_POST["username"], $_POST["security_a_1"], $_POST["security_a_2"], $_POST["security_a_3"]);
        break;
    case "changePw":
        changePw($_POST["username"], $_POST["newPw"]);
        break;
    case "firstLogin":
        setFirstLogin($_POST["username"]);
        break;
}
}
if (isset($_GET["op"]))
{
    function logout()
{
    session_start();
    // $_SESSION['username'] = "";
    $_SESSION['sesion'] = "";
    session_destroy();
    header("Location: ../../index.php");
    exit();
}
logout();
}