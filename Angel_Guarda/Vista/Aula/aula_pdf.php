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
$sql = "SELECT * FROM aula";
$result = mysqli_query($conn, $sql);

// Crea un nuevo archivo PDF
$pdf = new FPDF();
$pdf->AddPage();
$pdf->SetFont('Arial', '', 18);
$pdf->Cell(40, 10, "");
$pdf->SetX(($pdf->GetPageWidth() - $pdf->GetStringWidth("aula")) / 2);
$pdf->Cell(120, 10, "AULA");
$pdf->Ln();
$pdf->SetFont('Arial', '', 14);
$pdf->Cell(40, 10, "NOMBRE", "LTRB");
$pdf->Cell(110, 10, "DESCRIPCION", "LTRB");
$pdf->Cell(40, 10, "DISPONIBILIDAD", "LTRB");
$pdf->Ln();
$pdf->SetFont('Arial', '', 12);
// Agrega los datos de la tabla al archivo PDF
while($row = mysqli_fetch_assoc($result)) {
  $pdf->Cell(40, 10, $row["nombre"], "LTRB");
  $pdf->Cell(110, 10, $row["descripcion"], "LTRB");
  if ($row["disponibilidad"]==0) {
    $pdf->Cell(40, 10, "INACTIVA", "LTRB");
  }
  else {
    $pdf->Cell(40, 10, "ACTIVA", "LTRB");
  }
  $pdf->Ln();
}

// Descarga el archivo PDF
$pdf->Output("aula.pdf", "D");
?>