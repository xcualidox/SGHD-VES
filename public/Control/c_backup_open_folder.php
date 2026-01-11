<?php
session_start();

if (!isset($_SESSION["sesion"]) || !($_SESSION["sesion"] === "admin" || $_SESSION["sesion"] === "administrador")) {
    header("Location: ../../../index.php");
    exit;
}

$backupDir = realpath(__DIR__ . DIRECTORY_SEPARATOR . '..' . DIRECTORY_SEPARATOR . '..' . DIRECTORY_SEPARATOR . 'backups');

if ($backupDir && is_dir($backupDir)) {
    // Windows-safe quoting for explorer
    $quotedPath = '"' . str_replace('"', '""', $backupDir) . '"';

    // Fire-and-forget
    @pclose(@popen('explorer ' . $quotedPath, 'r'));
}

header("Location: ../Vista/backup/v_backup.php");
exit;
