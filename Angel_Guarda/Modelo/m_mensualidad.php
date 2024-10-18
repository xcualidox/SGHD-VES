<?php
require_once("basedatos.php");

class mensualidad extends database_connect
{
    private $anoEscolar;
    private $mes;
    private $monto;

    // Método para asignar los valores del dólar
    public function setDatosMensualidad($anoEscolar, $mes)
    {
        $this->anoEscolar = $anoEscolar;
        $this->mes = $mes;
    }

    // Método para modificar el precio del dólar
    public function modificarMensualidad()
    {
        $sql = "UPDATE `Monto` SET `precio`=? WHERE `id`=?";
        return $this->query($sql, [$this->monto, $this->mes]);
    }

    // Método para obtener el precio actual del dólar
    public function obtenerPrecioMensualidad()
    {
        $sql = "SELECT `monto` FROM `ano_Escolar` WHERE `id` = ?"; // Asume que el ID es 1
        $result = $this->query($sql, []);  // El array vacío es para cumplir con la estructura del método `query`
        

    }
}
?>
