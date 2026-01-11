<?php
session_start();
include_once("../../Control/c_asignatura.php");


if ($_SESSION["sesion"] == "admin" || $_SESSION["sesion"] == "administrador") {
}
 else {
    header("Location: ../../../index.php");
}
$title = 'Respaldo';
include_once('../v_Sidebar/v_Sidebar.php');

?>
<!-- Hereda del Padre Sidebar -->

<script type="text/javascript" src="../../../javascript/horario/mostrarModal.js"></script>

<head>
  <meta charset="UTF-8" />
  <title>Gestión de Backups</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <style>
    * {
      box-sizing: border-box;
    }

    body {
      margin: 0;
      font-family: system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
      background: #020617;
      color: #e5e7eb;
    }

    .app {
      max-width: 800px;
      margin: 40px auto;
      padding: 16px;
    }

    .card {
      background: #020617;
      border-radius: 16px;
      border: 1px solid #1f2937;
      box-shadow: 0 18px 40px rgba(0, 0, 0, 0.5);
      padding: 18px 20px;
    }

    h1 {
      margin: 0 0 4px;
      font-size: 1.4rem;
    }

    p.subtitle {
      margin: 0 0 16px;
      font-size: 0.9rem;
      color: #9ca3af;
    }

    .actions {
      display: flex;
      gap: 8px;
      flex-wrap: wrap;
      margin-bottom: 16px;
    }

    button {
      border-radius: 999px;
      border: none;
      padding: 8px 14px;
      font-size: 0.85rem;
      cursor: pointer;
      display: inline-flex;
      align-items: center;
      justify-content: center;
      gap: 6px;
      transition: transform 0.12s ease-out, box-shadow 0.12s ease-out, opacity 0.12s;
    }

    button:disabled {
      opacity: 0.5;
      cursor: default;
      box-shadow: none;
      transform: none;
    }

    .btn-primary {
      background: #38bdf8;
      color: #020617;
      box-shadow: 0 10px 24px rgba(56, 189, 248, 0.35);
    }

    .btn-primary:hover:not(:disabled) {
      transform: translateY(-1px);
      box-shadow: 0 14px 30px rgba(56, 189, 248, 0.4);
    }

    .btn-secondary {
      background: transparent;
      color: #e5e7eb;
      border: 1px solid #4b5563;
    }

    .btn-secondary:hover:not(:disabled) {
      transform: translateY(-1px);
      box-shadow: 0 10px 24px rgba(15, 23, 42, 0.9);
    }

    table {
      width: 100%;
      border-collapse: collapse;
      font-size: 0.85rem;
      margin-top: 4px;
    }

    thead {
      background: #020617;
    }

    tr{
        background: #020817 !important;
    }

    th, td {
      padding: 8px 6px;
      text-align: left;
      border-bottom: 1px solid #111827;
    }

    th {
      font-weight: 500;
      color: #9ca3af;
      font-size: 0.8rem;
    }
    /*
    tbody tr:hover {
      background: #020817;
    }
    */
    
    td.actions-cell {
      text-align: right;
      white-space: nowrap;
    }

    .badge {
      display: inline-flex;
      align-items: center;
      padding: 2px 8px;
      border-radius: 999px;
      font-size: 0.75rem;
      border: 1px solid #374151;
      color: #9ca3af;
    }

    .status {
      margin-top: 10px;
      font-size: 0.8rem;
      color: #9ca3af;
      display: flex;
      justify-content: space-between;
      flex-wrap: wrap;
      gap: 4px;
    }

    .status strong {
      color: #e5e7eb;
    }

    .empty {
      padding: 12px 0;
      text-align: center;
      font-size: 0.85rem;
      color: #9ca3af;
    }
  </style>
</head>
<body>
  <div class="app">
    <div class="card">
      <h1>Gestión de backups</h1>
      <p class="subtitle">
        Crea una nueva copia de seguridad.
      </p>

      <div class="actions">
        <button class="btn-primary" id="createBackupBtn">
          ➕ Crear backup
        </button>
        <button class="btn-secondary" id="openFolderBtn" type="button">
          📁 Abrir carpeta
        </button>
      </div>
    </div>
  </div>

  <script>
    const createBackupBtn = document.getElementById("createBackupBtn");
    const openFolderBtn = document.getElementById("openFolderBtn");

    
    // 👉 Aquí conectas tu lógica real de creación de backups
    function createBackup() {
      createBackupBtn.disabled = true;
      $.ajax({
      url: '../../Control/c_backup.php', 
      type: 'POST',
      data: { backup: true },
      dataType: 'json',  // Esperamos una respuesta JSON
      success: function(response) {
          // Manejar la respuesta del servidor
          if (response.success) {
              showToast(response.message, true);
              setTimeout(() => {
                  location.reload();
              }, 1000);
          } else {
              showToast(response.message, false);
          }
      },
      error: function(jqXHR, textStatus, errorThrown) {
          console.error('Error en la solicitud AJAX:', textStatus, errorThrown);
          console.log('Respuesta del servidor:', jqXHR.responseText);
          // Aquí puedes agregar más depuración si la respuesta no es JSON válido
          showToast('Error en la comunicación con el servidor.', false);
      }
      });  
    }

    // Eventos
    createBackupBtn.addEventListener("click", createBackup);

    openFolderBtn.addEventListener("click", () => {
      window.location.href = "../../Control/c_backup_open_folder.php";
    });
  </script>
</body>


</html>