<?php
session_start();
include_once("../../Control/c_asignatura.php");

// Validación de sesión
if ($_SESSION["sesion"] == "admin" || $_SESSION["sesion"] == "administrador") {
} else {
    header("Location: ../../../index.php");
    exit(); // Es buena práctica agregar exit después de un header location
}

$title = 'Manuales del Sistema';
include_once('../v_Sidebar/v_Sidebar.php');

// --- LOGICA PARA OBTENER ARCHIVOS ---
// Definimos la ruta relativa a la carpeta pdf
$directorio = "pdf/";

// Usamos glob para buscar solo archivos .pdf en esa carpeta
// Si no hay archivos, devuelve un array vacío o false
$archivos = glob($directorio . "*.pdf");
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <title>Gestión de Manuales</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    
    <link rel="stylesheet" href="styles/main.css">
    
    <script type="text/javascript" src="../../../javascript/horario/mostrarModal.js"></script>
</head>

<body class="bg-gray-100 text-gray-800">

    <div class="container mx-auto px-6 py-8">
        
        <div class="mb-8 border-b border-gray-300 pb-4">
            <h1 class="text-3xl font-bold text-gray-700">
                <span class="text-blue-600">Manuales</span>
            </h1>
            <p class="text-gray-500 mt-2">Descargue o visualice los manuales disponibles del sistema.</p>
        </div>

        <?php if ($archivos && count($archivos) > 0): ?>
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
                
                <?php foreach ($archivos as $archivo): ?>
                    <?php 
                        // Obtener solo el nombre del archivo sin la ruta "pdf/"
                        $nombreArchivo = basename($archivo);
                        
                        // Crear un nombre "bonito" para mostrar (quitar guiones bajos y extensión)
                        $nombreMostrar = str_replace(['_', '-'], ' ', pathinfo($nombreArchivo, PATHINFO_FILENAME));
                        $nombreMostrar = ucwords($nombreMostrar); // Poner mayúsculas iniciales
                    ?>

                    <div class="bg-white rounded-xl shadow-md overflow-hidden hover:shadow-lg transition-shadow duration-300 border border-gray-200 group">
                        <div class="p-6 flex flex-col items-center text-center">
                            
                            <div class="p-4 bg-red-50 rounded-full mb-4 group-hover:bg-red-100 transition-colors">
                                <svg class="w-10 h-10 text-red-500" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 21h10a2 2 0 002-2V9.414a1 1 0 00-.293-.707l-5.414-5.414A1 1 0 0012.586 2H7a2 2 0 00-2 2v15a2 2 0 002 2z"></path>
                                </svg>
                            </div>

                            <h3 class="text-lg font-semibold text-gray-800 mb-2 truncate w-full" title="<?php echo $nombreMostrar; ?>">
                                <?php echo $nombreMostrar; ?>
                            </h3>
                            
                            <p class="text-sm text-gray-500 mb-6">Archivo PDF</p>

                            <div class="flex space-x-2 w-full">
                                <a href="<?php echo $archivo; ?>" target="_blank" class="flex-1 bg-blue-600 hover:bg-blue-700 text-white text-sm font-medium py-2 px-4 rounded transition-colors flex justify-center items-center">
                                    <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"></path><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z"></path></svg>
                                    Ver
                                </a>
                                <a href="<?php echo $archivo; ?>" download class="flex-none bg-gray-100 hover:bg-gray-200 text-gray-700 text-sm font-medium py-2 px-3 rounded transition-colors border border-gray-300" title="Descargar">
                                    <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-4l-4 4m0 0l-4-4m4 4V4"></path></svg>
                                </a>
                            </div>

                        </div>
                    </div>
                <?php endforeach; ?>
                
            </div>
        <?php else: ?>
            <div class="flex flex-col items-center justify-center py-20 bg-white rounded-lg border-2 border-dashed border-gray-300">
                <svg class="w-16 h-16 text-gray-300 mb-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 13h6m-3-3v6m5 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"></path></svg>
                <p class="text-xl text-gray-500 font-medium">No se encontraron manuales.</p>
                <p class="text-gray-400 text-sm">Asegúrese de agregar archivos .pdf en la carpeta "manual/pdf".</p>
            </div>
        <?php endif; ?>

    </div>

</body>
</html>