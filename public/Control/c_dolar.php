<?php
require_once('../Modelo/m_dolar.php');

// Instancia del modelo
$dolarModel = new Dolar();

function obtenerDolarDesdeBCV() {
    $html = @file_get_contents("https://www.bcv.org.ve/");
    if ($html === false) return null;

    libxml_use_internal_errors(true);
    $doc = new DOMDocument();
    $doc->loadHTML($html);
    $xpath = new DOMXPath($doc);

    // Buscar el valor en el contenedor con ID "dolar"
    $nodos = $xpath->query('//*[@id="dolar"]//strong');

    if ($nodos->length > 0) {
        $valor = trim($nodos[0]->nodeValue);
        return number_format((float) str_replace(',', '.', $valor), 2, '.', '');
    }

    return null;
}


// Solo sincroniza con BCV si se manda un GET y el parámetro 'accion=sincronizar'
if ($_SERVER['REQUEST_METHOD'] === 'GET' && isset($_GET['accion']) && $_GET['accion'] === 'sincronizar') {
    // Intentar obtener desde BCV primero
    $precioBCV = obtenerDolarDesdeBCV();

    if ($precioBCV !== null) {
        // Insertar el valor obtenido del BCV en la base de datos local
        $dolarModel->setDatos(1, $precioBCV);  // Asumiendo que el ID del registro es 1
        $dolarModel->modificar();  // Actualiza el valor en la base de datos

        // Responder con éxito
        echo json_encode(['DolarBCV' => $precioBCV, 'fuente' => 'web']);
    } else {
        // Si falla, usar la tasa local
        $precioLocal = $dolarModel->obtenerPrecio();

        if ($precioLocal !== null) {
            echo json_encode(['DolarBCV' => $precioLocal, 'fuente' => 'local']);
        } else {
            echo json_encode(['error' => 'No se pudo obtener el precio del dólar']);
        }
    }
    exit();
}
if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    // Obtener el precio del dólar
    $precio = $dolarModel->obtenerPrecio();

    // Verificar si se obtuvo un resultado
    if ($precio !== null) {
        echo json_encode(['DolarBCV' => $precio]);
    } else {
        echo json_encode(['error' => 'No se pudo obtener el precio del dólar']);
    }
    exit();
}

// POST: guardar/modificar precio en la BD
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $data = json_decode(file_get_contents("php://input"), true);

    if (isset($data['DolarBCV']) && is_numeric($data['DolarBCV'])) {
        $dolarModel->setDatos(1, $data['DolarBCV']);  // ID fijo

        

        $resultado = $dolarModel->modificar();
        $precio = $dolarModel->obtenerPrecio();

        if ($resultado) {
            echo json_encode(['success' => 'El precio del dólar se ha actualizado a: '.$precio.'Bs']);
            require_once("c_bitacora.php");
            insertBitacora($_SESSION['username'], "modificar", "El precio del Dólar se ha actualizado a: ".$precio."Bs");
        } else {
            echo json_encode(['error' => 'Error al actualizar el precio del dólar']);
        }
    } else {
        echo json_encode(['error' => 'Datos inválidos']);
    }
    exit();
}
?>