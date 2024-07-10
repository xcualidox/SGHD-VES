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
$sql = "SELECT * FROM profesores";
$result = mysqli_query($conn, $sql);

// Crea un nuevo archivo PDF
$pdf = new FPDF();
$pdf->AddPage();
$pdf->SetFont('Arial', '', 18);
$pdf->Cell(40, 10, "");
$pdf->SetX(($pdf->GetPageWidth() - $pdf->GetStringWidth("PROFESOR")) / 2);
$pdf->Cell(120, 10, "PROFESORES");
$pdf->Ln();
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(40, 10, "CEDULA", "LTRB");
$pdf->Cell(40, 10, "PRIMER NOMBRE", "LTRB");
$pdf->Cell(40, 10, "SEGUNDO NOMBRE", "LTRB");
$pdf->Cell(40, 10, "PRIMER APELLIDO", "LTRB");
$pdf->Cell(40, 10, "SEGUNDO APELLIDO", "LTRB");
$pdf->Ln();
$pdf->SetFont('Arial', '', 12);
// Agrega los datos de la tabla al archivo PDF
while($row = mysqli_fetch_assoc($result)) {
  $pdf->Cell(40, 10, $row["cedula"], "LTRB");
  $pdf->Cell(40, 10, $row["primer_nombre"], "LTRB");
  $pdf->Cell(40, 10, $row["segundo_nombre"], "LTRB");
  $pdf->Cell(40, 10, $row["primer_apellido"], "LTRB");
  $pdf->Cell(40, 10, $row["segundo_apellido"], "LTRB");
  $pdf->Ln();
}

// Descarga el archivo PDF
$pdf->Output("profesores.pdf", "D");
?>