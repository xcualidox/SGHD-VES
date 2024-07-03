<?php 
require("../fpdf/fpdf.php");
// Conecta a la base de datos
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "proyecto";

$conn = mysqli_connect($servername, $username, $password, $dbname);

// Verifica la conexión
if (!$conn) {
  die("Connection failed: " . mysqli_connect_error());
}

// Ejecuta una consulta SQL para obtener los datos de la tabla
$sql = "SELECT * FROM ano_escolar";
$result = mysqli_query($conn, $sql);

// Crea un nuevo archivo PDF
$pdf = new FPDF();
$pdf->AddPage();
$pdf->SetFont('Arial', '', 16);
$pdf->Cell(40, 10, "");
$pdf->SetX(($pdf->GetPageWidth() - $pdf->GetStringWidth("ANO ESCOLAR")) / 2);
$pdf->Cell(120, 10, "ANO ESCOLAR");
$pdf->Ln();
$pdf->SetFont('Arial', '', 14);
$pdf->Cell(40, 10, "");
$pdf->Cell(40, 10, "NOMBRE", "LTRB");
$pdf->Cell(40, 10, "FECHA DE INICIO", "LTRB");
$pdf->Cell(40, 10, "FECHA FINAL", "LTRB");
$pdf->Ln();
$pdf->SetFont('Arial', '', 12);
// Agrega los datos de la tabla al archivo PDF
while($row = mysqli_fetch_assoc($result)) {
    $pdf->Cell(40, 10, "");
  $pdf->Cell(40, 10, $row["nombre"], "LTRB");
  $pdf->Cell(40, 10, $row["fecha_inicio"], "LTRB");
  $pdf->Cell(40, 10, $row["fecha_fin"], "LTRB");
  $pdf->Ln();
}

// Descarga el archivo PDF
$pdf->Output("ano_escolar.pdf", "D");
?>