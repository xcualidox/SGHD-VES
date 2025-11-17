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
        Crea una nueva copia de seguridad o restaura una existente de la lista.
      </p>

      <div class="actions">
        <button class="btn-primary" id="createBackupBtn">
          ➕ Crear backup
        </button>
        <button class="btn-secondary" id="refreshBtn">
          🔄 Refrescar lista
        </button>
      </div>

      <table>
        <thead>
          <tr>
            <th>Nombre</th>
            <th>Fecha</th>
            <th>Tamaño</th>
            <th class="actions-cell">Acciones</th>
          </tr>
        </thead>
        <tbody id="backupsTableBody">
          <!-- Filas generadas por JavaScript -->
        </tbody>
      </table>

      <div class="empty" id="emptyState" style="display:none;">
        Todavía no hay backups. Crea el primero con el botón superior.
      </div>

      <div class="status">
        <span id="lastBackupLabel">Último backup: —</span>
        <span class="badge" id="countLabel">0 backups</span>
      </div>
    </div>
  </div>

  <script>
    // Lista de backups simulada (AQUÍ integras tu respuesta real de la BD / API)
    let backups = [
      {
        id: "bkp_001",
        name: "backup-2025-11-10_2300",
        createdAt: "2025-11-10 23:00",
        size: "1.2 GB"
      },
      {
        id: "bkp_002",
        name: "backup-2025-11-12_0800",
        createdAt: "2025-11-12 08:00",
        size: "720 MB"
      }
    ];

    const tbody = document.getElementById("backupsTableBody");
    const emptyState = document.getElementById("emptyState");
    const lastBackupLabel = document.getElementById("lastBackupLabel");
    const countLabel = document.getElementById("countLabel");
    const createBackupBtn = document.getElementById("createBackupBtn");
    const refreshBtn = document.getElementById("refreshBtn");

    function renderBackups() {
      tbody.innerHTML = "";

      if (!backups.length) {
        emptyState.style.display = "block";
        countLabel.textContent = "0 backups";
        lastBackupLabel.textContent = "Último backup: —";
        return;
      }

      emptyState.style.display = "none";

      backups.forEach((bkp) => {
        const tr = document.createElement("tr");

        tr.innerHTML = `
          <td>${bkp.name}</td>
          <td>${bkp.createdAt}</td>
          <td>${bkp.size}</td>
          <td class="actions-cell">
            <button class="btn-secondary btn-restore" data-id="${bkp.id}">
              🔄 Restaurar
            </button>
          </td>
        `;

        tbody.appendChild(tr);
      });

      const last = backups[0];
      lastBackupLabel.textContent = "Último backup: " + last.createdAt;
      countLabel.textContent = backups.length + (backups.length === 1 ? " backup" : " backups");
    }

    // 👉 Aquí conectas tu lógica real de restauración
    function restoreBackup(id) {
      const backup = backups.find((b) => b.id === id);
      if (!backup) return;

      const yes = confirm(
        "¿Restaurar el backup '" + backup.name + "'? \nSe sobrescribirá información actual."
      );
      if (!yes) return;

      // ✅ Aquí llamas a tu API:
      // fetch('/api/backups/' + id + '/restore', { method: 'POST' })
      //   .then(...)

      alert("Simulando restauración de: " + backup.name);
    }

    
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

    refreshBtn.addEventListener("click", () => {
      // Aquí puedes volver a consultar tu API y reemplazar el array `backups`.
      // Ejemplo:
      // fetch('/api/backups')
      //   .then(r => r.json())
      //   .then(data => { backups = data; renderBackups(); });

      alert("Aquí iría la lógica para refrescar desde el servidor.");
    });

    tbody.addEventListener("click", (e) => {
      const btn = e.target.closest(".btn-restore");
      if (!btn) return;
      const id = btn.dataset.id;
      restoreBackup(id);
    });

    // Init
    renderBackups();
  </script>
</body>


</html>