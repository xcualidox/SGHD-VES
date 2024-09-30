<?php
// Verificar si los datos fueron enviados correctamente
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Obtener los datos del cuerpo de la solicitud (JSON)
    $data = json_decode(file_get_contents('php://input'), true);

    // Verificar si se envió el valor de "DolarBCV"
    if (isset($data['DolarBCV'])) {
        // Convertir el valor a número flotante (float) para asegurarse de que se guarde como número
        $nuevoValor = floatval($data['DolarBCV']);

        // Ruta del archivo JSON que deseas actualizar
        $archivo = '../../javascript/dolar.json';

        // Leer el contenido actual del archivo JSON
        $jsonActual = file_get_contents($archivo);

        // Decodificar el contenido JSON
        $datos = json_decode($jsonActual, true);

        // Actualizar el valor del dólar en los datos
        $datos['DolarBCV'] = $nuevoValor;

        // Codificar los datos actualizados a formato JSON
        $jsonActualizado = json_encode($datos, JSON_PRETTY_PRINT);

        // Escribir los datos actualizados en el archivo JSON
        if (file_put_contents($archivo, $jsonActualizado)) {
            // Respuesta de éxito
            echo json_encode(['mensaje' => 'Dólar actualizado correctamente']);
        } else {
            // Error al escribir en el archivo
            echo json_encode(['mensaje' => 'Error al actualizar el archivo JSON']);
        }
    } else {
        // Si no se envió el valor de DolarBCV
        echo json_encode(['mensaje' => 'Valor de DolarBCV no proporcionado']);
    }
} else {
    // Si la solicitud no es POST
    echo json_encode(['mensaje' => 'Método no permitido']);
}
?>
