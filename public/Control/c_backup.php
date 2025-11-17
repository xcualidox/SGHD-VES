<?php

require_once(__DIR__ . "/../Modelo/m_backup.php");

$backupObject = new backup();

if(isset($_POST['backup'])){
    
    $tryBackup = $backupObject->backup();

    if ($tryBackup['code'] === 0) {
        $response = [
            'success' => true,
            'message' => 'Backup realizado correctamente.',
            'command' => $tryBackup['command']
        ];
    }
    else {
        $response = [
            'success' => false,
            'message' => 'Falló al realizar backup:',
            'details' => $tryBackup['output'],
            'command' => $tryBackup['command']
        ];
    }


    // Responder con los datos procesados
    echo json_encode($response);

    /*

    */

}


if(isset($_POST['loadBackups'])){
    
}

$backupObject = new backup();

// ... existing code for $_POST['backup'] ...

if(isset($_POST['list'])){
    
    $backupsList = $backupObject->listBackups();

    // Prepare response data
    $response = [
        'success' => true,
        'data' => $backupsList,
        'message' => 'Lista de backups recuperada.'
    ];

    // Respond with the processed data
    echo json_encode($response);
    exit; // Stop execution after sending JSON response
}

// ... rest of your controller code