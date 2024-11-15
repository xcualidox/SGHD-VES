<?php
require_once('../Modelo/m_dolar.php');

// Instancia del modelo
$dolarModel = new Dolar();

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

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Obtener los datos del cuerpo de la solicitud
    $data = json_decode(file_get_contents("php://input"), true);

    if (isset($data['DolarBCV']) && is_numeric($data['DolarBCV'])) {
        // Establecer los nuevos datos del precio
        $dolarModel->setDatos(1, $data['DolarBCV']);  // Asumiendo que el ID del dólar es 1
       
        
        // Modificar el precio del dólar
        $resultado = $dolarModel->modificar();
        $precio = $dolarModel->obtenerPrecio();

        if ($resultado) {
            echo json_encode(['success' => 'El precio del dólar se ha actualizado a: '.$precio.'Bs']);
            require_once("c_bitacora.php");
            insertBitacora($_SESSION['username'], "modificar", "El precio del Dolar se ha Actualizado a: ".$precio."Bs");
        } else {
            echo json_encode(['error' => 'Error al actualizar el precio del dólar']);
        }
    } else {
        echo json_encode(['error' => 'Datos inválidos']);
    }
    exit();
}
?>
