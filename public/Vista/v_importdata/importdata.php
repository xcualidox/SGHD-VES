<?php
// index.php
// Requisitos: composer require phpoffice/phpspreadsheet:"^1.28"
require 'vendor/autoload.php';
use PhpOffice\PhpSpreadsheet\IOFactory;

// ----- Configuración -----
date_default_timezone_set('America/Caracas'); // ajusta si hace falta

// ----- Helpers de parsing -----
function textRowToString(array $row) {
    // row keys like 'A'=>'valor', 'B'=>...
    $parts = [];
    foreach ($row as $c) {
        if (is_null($c)) continue;
        $s = trim((string)$c);
        if ($s !== '') $parts[] = $s;
    }
    return implode(' ', $parts);
}

function extractKeyValue($text, $key) {
    // intenta extraer "Key:valor" en formas variadas
    $pattern = '/'.preg_quote($key, '/').'\s*[:\-]\s*([^\s]+)/iu';
    if (preg_match($pattern, $text, $m)) return trim($m[1]);
    // alternativa: Key: valor con espacios hasta siguiente Key2
    $pattern2 = '/'.preg_quote($key, '/').'\s*[:\-]\s*([^\n\r]+)/iu';
    if (preg_match($pattern2, $text, $m)) return trim($m[1]);
    return null;
}

function extractAllTotals($text) {
    $res = [
        'plan' => null,
        'real' => null,
        'tardio' => null,
        'temprano' => null,
        'falta' => null,
        'horas' => null,
        'enfermo' => null,
        'tema' => null
    ];
    // numeros en la forma Plan:22(D) o Plan:22
    if (preg_match('/Plan\s*[:\-]\s*(\d+)/iu', $text, $m)) $res['plan'] = (int)$m[1];
    if (preg_match('/Real\s*[:\-]\s*(\d+)/iu', $text, $m)) $res['real'] = (int)$m[1];
    if (preg_match('/Tard[ií]o\s*[:\-]\s*(\d+)/iu', $text, $m)) $res['tardio'] = (int)$m[1];
    if (preg_match('/Temprano\s*[:\-]\s*(\d+)/iu', $text, $m)) $res['temprano'] = (int)$m[1];
    if (preg_match('/Falta\s*[:\-]\s*(\d+)/iu', $text, $m)) $res['falta'] = (int)$m[1];
    // algunas variantes: Plan(22D) Real(19D) ...
    if ($res['plan'] === null && preg_match('/Plan\s*\(?\s*(\d+)\s*/iu', $text, $m)) $res['plan'] = (int)$m[1];
    if ($res['real'] === null && preg_match('/Real\s*\(?\s*(\d+)\s*/iu', $text, $m)) $res['real'] = (int)$m[1];
    if ($res['tardio'] === null && preg_match('/Tard[ií]o\s*\(?\s*(\d+)\s*/iu', $text, $m)) $res['tardio'] = (int)$m[1];
    if ($res['temprano'] === null && preg_match('/Temprano\s*\(?\s*(\d+)\s*/iu', $text, $m)) $res['temprano'] = (int)$m[1];
    if ($res['falta'] === null && preg_match('/Falta\s*\(?\s*(\d+)\s*/iu', $text, $m)) $res['falta'] = (int)$m[1];
   if (preg_match('/Horas\s*[:\-]\s*([\d\.]+)/iu', $text, $m)) $res['horas'] = (float)$m[1];

    // Enfermo y Tema (puede estar vacío)
    if (preg_match('/Enfermo\s*[:\-]?\s*([^\s\(]*)/iu', $text, $m)) $res['enfermo'] = $m[1] ?? null;
    if (preg_match('/Tema\s*[:\-]?\s*([^\s\(]*)/iu', $text, $m)) $res['tema'] = $m[1] ?? null;

    return $res;
}

// ----- Procesamiento al subir archivos (soporta múltiples archivos) -----
$result = [
    'blocks' => [],   // lista de bloques por persona (con file/month)
    'global' => [ 'plan'=>0,'real'=>0,'tardio'=>0,'temprano'=>0,'falta'=>0 ],
    'by_month' => []  // month => aggregated totals
];
$errors = [];

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_FILES['files'])) {
    $files = $_FILES['files'];
    // soporta múltiples archivos
    for ($f = 0; $f < count($files['name']); $f++) {
        if ($files['error'][$f] !== UPLOAD_ERR_OK) {
            $errors[] = "Error subiendo {$files['name'][$f]} (code {$files['error'][$f]}).";
            continue;
        }
        $tmp = $files['tmp_name'][$f];
        $filename = $files['name'][$f];

        // intentar deducir mes del archivo: preferir linea "Fecha:" si existe, sino filemtime
        $monthKey = date('Y-m', filemtime($tmp));

        try {
            $spreadsheet = IOFactory::load($tmp);
            $sheet = $spreadsheet->getActiveSheet();
            $rows = $sheet->toArray(null, true, true, true);

            // recorrer filas buscando "Sector:" que indica inicio de bloque (variante B vertical)
            $currentBlock = null;
            foreach ($rows as $rIndex => $row) {
                $line = textRowToString($row);

                if ($line === '') continue;

                // detectar inicio bloque
               if (preg_match('/\bSector\s*[:\-]/iu', $line)) {
    $currentBlock = [
        'sector' => null, 'nombre' => null, 'id' => null,
        'plan' => null, 'real' => null, 'tardio' => null, 'temprano' => null, 'falta' => null,
        'source_file' => $filename,
        'month' => $monthKey,
        'found_plan_line' => false,
        'start_row' => $rIndex
    ];
    if (preg_match('/Sector\s*[:\-]\s*([^\s]+)/iu', $line, $m)) $currentBlock['sector'] = trim($m[1]);
    if (preg_match('/Nombre\s*[:\-]\s*([^\s]+)/iu', $line, $m)) $currentBlock['nombre'] = trim($m[1]);
    if (preg_match('/ID\s*[:\-]\s*([0-9]+)/iu', $line, $m)) $currentBlock['id'] = trim($m[1]);
   if (preg_match('/Fecha\s*[:\-]\s*([\d\.~]+)/iu', $line, $m)) {
    $rawFecha = trim($m[1]); // "25.05.01~25.05.31"

    // Separar rango si existe "~"
    $fechas = explode('~', $rawFecha);
    $fechasFormateadas = [];
    foreach ($fechas as $f) {
        // cambiar puntos por slash
        $f = str_replace('.', '/', $f);
        $fechasFormateadas[] = $f; // ej. "25/05/01"
    }

    // Guardar como string final: "25/05/01 ~ 25/05/31"
    $currentBlock['fecha'] = implode(' ~ ', $fechasFormateadas);
}  // NO hacer push todavía
    continue;
}

                // si estamos dentro de un bloque, intentar completar sector/nombre/id si aparecieron en filas siguientes
             if ($currentBlock !== null) {
                    // extraer Nombre o ID si no están aún
                    // if ($currentBlock['nombre'] === null && preg_match('/Nombre\s*[:\-]\s*([^\n\r]+)/iu', $line, $m)) {
                    //     $currentBlock['nombre'] = trim($m[1]);
                    // }
                    // if ($currentBlock['id'] === null && preg_match('/\bID\s*[:\-]\s*([0-9]+)/iu', $line, $m)) {
                    //     $currentBlock['id'] = trim($m[1]);

                    // }

                    // detectar la línea de totales
               // detectar la línea de totales
if (preg_match('/\bPlan\s*[:\-].*\bFalta\s*[:\-]/iu', $line) 
    || preg_match('/\bPlan\s*[:\-].*\bReal\s*[:\-]/iu', $line)
    || preg_match('/\bFalta\s*[:\-]\s*\d+/iu', $line)) {

    $totals = extractAllTotals($line);

    foreach (['plan','real','tardio','temprano','falta','horas','enfermo','tema'] as $k) {
        if (isset($totals[$k])) $currentBlock[$k] = $totals[$k];
    }

    // actualizar agregados globales
    foreach (['plan','real','tardio','temprano','falta'] as $k) {
        if (!is_null($currentBlock[$k])) $result['global'][$k] += $currentBlock[$k];
    }

    // actualizar agregados por mes
    if (!isset($result['by_month'][$currentBlock['month']])) {
        $result['by_month'][$currentBlock['month']] = ['plan'=>0,'real'=>0,'tardio'=>0,'temprano'=>0,'falta'=>0,'horas'=>0];
    }
    foreach (['plan','real','tardio','temprano','falta','horas'] as $k) {
        if (!is_null($currentBlock[$k])) $result['by_month'][$currentBlock['month']][$k] += $currentBlock[$k];
    }

    // **push al array de bloques** para tabla individual
    $result['blocks'][] = $currentBlock;

    // cerrar bloque
    $currentBlock = null;
    continue;
}

            
                }
            } // end foreach rows

            // If some block still open without a plan line, keep it but mark as incomplete
            // (we already added it to $result['blocks'] by reference)
            // Remove temporary references to avoid issues
            foreach ($result['blocks'] as &$b) {
                unset($b); break;
            }

        } catch (Exception $e) {
            $errors[] = "Error procesando {$filename}: " . $e->getMessage();
        }
    } // end for files
} // end POST

// ----- Preparar datos para la vista -----
$blocks = $result['blocks'];
$global = $result['global'];
$by_month = $result['by_month'];


// ordenar bloques por nombre si existe
usort($blocks, function($a,$b){
    $na = $a['nombre'] ?? ($a['id'] ?? '');
    $nb = $b['nombre'] ?? ($b['id'] ?? '');
    return strcasecmp($na,$nb);
});

// Preparamos arrays para gráficos
$labels_person = [];
$real_values = [];
$falta_values = [];
$tardio_values = [];
$temprano_values = [];
foreach ($blocks as $blk) {
    $label = ($blk['nombre'] ?? '') ?: ('ID:'.($blk['id'] ?? ''));
    $labels_person[] = $label;
    $real_values[] = (int)($blk['real'] ?? 0);
    $falta_values[] = (int)($blk['falta'] ?? 0);
    $tardio_values[] = (int)($blk['tardio'] ?? 0);
    $temprano_values[] = (int)($blk['temprano'] ?? 0);
}

// by month for line chart (G3)
$months = array_keys($by_month);
sort($months);
$month_totals_present = [];
foreach ($months as $m) {
    // define present as real + tardio + temprano (según tu preferencia)
    $month_totals_present[] = 
        ($by_month[$m]['real'] ?? 0) + ($by_month[$m]['tardio'] ?? 0) + ($by_month[$m]['temprano'] ?? 0);
}

?><!doctype html>
<html lang="es">
<head>
<meta charset="utf-8">
<title>Importador Asistencias (bloques)</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
.container{max-width:1100px;margin:20px auto;}
.table-fixed{max-height:420px;overflow:auto;}
canvas{height:300px !important;}
.small-note{font-size:0.9rem;color:#444;}
</style>
</head>
<body>
<div class="container">
  <h3>Importar Asistencias (formato bloques)</h3>
  <p class="small-note">Carga archivos .xls/.xlsx. Detecta bloques que empiezan con "Sector:" y extrae Plan/Real/Tardío/Temprano/Falta.</p>

  <div class="card p-3 mb-3">
    <form method="post" enctype="multipart/form-data">
      <div class="mb-3">
        <label class="form-label">Selecciona uno o varios archivos</label>
        <input type="file" name="files[]" accept=".xls,.xlsx" multiple required class="form-control">
      </div>
      <button class="btn btn-primary">Subir y procesar</button>
    </form>
  </div>

  <?php if (!empty($errors)): ?>
    <div class="alert alert-danger">
      <ul><?php foreach ($errors as $e) echo "<li>".htmlspecialchars($e)."</li>"; ?></ul>
    </div>
  <?php endif; ?>

  <?php if (count($blocks) > 0): ?>
    <div class="card p-3 mb-3">
      <h5>Resumen Global (sumados todos los archivos)</h5>
      <div class="row">
        <div class="col-sm-2"><strong>Plan:</strong> <?=$global['plan']?></div>
        <div class="col-sm-2"><strong>Real:</strong> <?=$global['real']?></div>
        <div class="col-sm-2"><strong>Tardíos:</strong> <?=$global['tardio']?></div>
        <div class="col-sm-2"><strong>Tempranos:</strong> <?=$global['temprano']?></div>
        <div class="col-sm-2"><strong>Faltas:</strong> <?=$global['falta']?></div>
      </div>
    </div>

    <!-- Tabla por persona -->
    <div class="card p-3 mb-3">
      <h5>Tabla por persona</h5>
      <div class="table-responsive table-fixed">
        <table class="table table-striped table-sm">
          <thead class="table-dark">
            <tr><th>Nombre / ID</th><th>Sector</th><th>Plan</th><th>Real</th><th>Tardío</th><th>Temprano</th><th>Falta</th><th>Fecha</th></tr>
          </thead>
          <tbody>
            <?php foreach ($blocks as $b): ?>

              <tr>
                <td><?=htmlspecialchars($b['nombre'] ?? ('ID:'.($b['id'] ?? ''))) ?></td>
                <td><?=htmlspecialchars($b['sector'] ?? '')?></td>
                <td><?=htmlspecialchars($b['plan'] ?? '')?></td>
                <td><?=htmlspecialchars($b['real'] ?? '')?></td>
                <td><?=htmlspecialchars($b['tardio'] ?? '')?></td>
                <td><?=htmlspecialchars($b['temprano'] ?? '')?></td>
                <td><?=htmlspecialchars($b['falta'] ?? '')?></td>
                <td><?=htmlspecialchars($b['fecha'] ?? '')?></td>
              </tr>
            <?php endforeach; ?>
          </tbody>
        </table>
      </div>
    </div>

    <!-- Gráficos -->
    <div class="card p-3 mb-3">
      <h5>Gráficos</h5>
      <div class="row">
        <div class="col-md-6 mb-3">
          <canvas id="barChart"></canvas>
        </div>
        <div class="col-md-6 mb-3">
          <canvas id="pieChart"></canvas>
        </div>
        <div class="col-md-12">
          <canvas id="lineChart"></canvas>
        </div>
      </div>
    </div>

    <!-- Detalle por mes -->
    <div class="card p-3 mb-3">
      <h5>Detalle por mes (archivos procesados)</h5>
      <table class="table table-sm table-striped">
        <thead><tr><th>Mes</th><th>Plan</th><th>Real</th><th>Tardío</th><th>Temprano</th><th>Falta</th><th>Presentes (Real+T+E)</th></tr></thead>
        <tbody>
        <?php foreach ($by_month as $m=>$vals): ?>
          <tr>
            <td><?=htmlspecialchars($m)?></td>
            <td><?=($vals['plan'] ?? 0)?></td>
            <td><?=($vals['real'] ?? 0)?></td>
            <td><?=($vals['tardio'] ?? 0)?></td>
            <td><?=($vals['temprano'] ?? 0)?></td>
            <td><?=($vals['falta'] ?? 0)?></td>
            <td><?= (($vals['real'] ?? 0) + ($vals['tardio'] ?? 0) + ($vals['temprano'] ?? 0)) ?></td>
          </tr>
        <?php endforeach; ?>
        </tbody>
      </table>
    </div>

  <?php elseif ($_SERVER['REQUEST_METHOD']==='POST'): ?>
    <div class="alert alert-warning">No se detectaron bloques "Sector:" o líneas de totales en los archivos subidos.</div>
  <?php endif; ?>

</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
<?php if (count($labels_person)>0): ?>
// Bar chart - Real vs Faltas por persona (G1)
const ctxBar = document.getElementById('barChart').getContext('2d');
new Chart(ctxBar, {
    type: 'bar',
    data: {
        labels: <?= json_encode($labels_person) ?>,
        datasets: [
            { label: 'Real', data: <?= json_encode($real_values) ?>, stack: 'stack1' },
            { label: 'Falta', data: <?= json_encode($falta_values) ?>, stack: 'stack1' },
            { label: 'Tardío', data: <?= json_encode($tardio_values) ?>, stack: 'stack1' },
            { label: 'Temprano', data: <?= json_encode($temprano_values) ?>, stack: 'stack1' }
        ]
    },
    options: { responsive:true, maintainAspectRatio:false }
});

// Pie chart - distribución global (G2)
const ctxPie = document.getElementById('pieChart').getContext('2d');
new Chart(ctxPie, {
    type: 'pie',
    data: {
        labels: ['Real','Tardío','Temprano','Falta'],
        datasets: [{ data: [<?= (int)$global['real'] ?>, <?= (int)$global['tardio'] ?>, <?= (int)$global['temprano'] ?>, <?= (int)$global['falta'] ?>] }]
    },
    options: { responsive:true, maintainAspectRatio:false }
});

// Line chart - evolución por mes (G3)
const ctxLine = document.getElementById('lineChart').getContext('2d');
new Chart(ctxLine, {
    type: 'line',
    data: {
        labels: <?= json_encode($months) ?>,
        datasets: [{
            label: 'Presentes (Real+Tardío+Temprano)',
            data: <?= json_encode($month_totals_present) ?>,
            fill: false,
            tension: 0.2,
            borderWidth: 2
        }]
    },
    options: { responsive:true, maintainAspectRatio:false }
});
<?php endif; ?>
</script>
</body>
</html>
