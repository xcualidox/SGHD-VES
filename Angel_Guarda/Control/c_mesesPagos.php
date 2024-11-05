<?php

require_once(__DIR__ . "/../Modelo/m_mesesPagos.php");

$mesespagos = new mesesPagos();

if ($_POST['obtenerMesesPagos']) {
    return 'something';
}

?>