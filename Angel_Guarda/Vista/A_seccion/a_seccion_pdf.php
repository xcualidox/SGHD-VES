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
$sql = "SELECT * FROM ano_seccion";
$result = mysqli_query($conn, $sql);

// Crea un nuevo archivo PDF
$pdf = new FPDF();
$pdf->AddPage();
$pdf->SetFont('Arial', '', 16);
$pdf->Cell(40, 10, "");
$pdf->SetX(($pdf->GetPageWidth() - $pdf->GetStringWidth("ANO SECCION")) / 2);
$pdf->Cell(120, 10, "ANO SECCION");
$pdf->Ln();
$pdf->SetFont('Arial', '', 14);
$pdf->Cell(40, 10, "");
$pdf->Cell(40, 10, "ANO", "LTRB");
$pdf->Cell(40, 10, "SECCION", "LTRB");
$pdf->Ln();
$pdf->SetFont('Arial', '', 12);
// Agrega los datos de la tabla al archivo PDF
while($row = mysqli_fetch_assoc($result)) {
    $pdf->Cell(40, 10, "");
  $pdf->Cell(40, 10, $row["ano"], "LTRB");
  $pdf->Cell(40, 10, $row["seccion"], "LTRB");
  $pdf->Ln();
}

// Descarga el archivo PDF
$pdf->Output("ano_seccion.pdf", "D");
?>