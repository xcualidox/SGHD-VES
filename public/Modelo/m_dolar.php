<?php
require_once("basedatos.php");

class Dolar extends database_connect
{
    private $id;
    private $precio;

    // Método para asignar los valores del dólar
    public function setDatos($id, $precio)
    {
        $this->id = $id;
        $this->precio = $precio;
    }

    // Método para modificar el precio del dólar
    public function modificar()
    {
        $sql = "UPDATE `dolar` SET `precio`=? WHERE `id`=?";
        return $this->query($sql, [$this->precio, $this->id]);
    }

    // Método para obtener el precio actual del dólar
    public function obtenerPrecio()
    {
        $sql = "SELECT `precio` FROM `dolar` WHERE `id` = 1"; // Asume que el ID es 1
        $result = $this->query($sql, []);  // El array vacío es para cumplir con la estructura del método `query`
        
        if ($result) {
            return $this->fetch_query($result)['precio'];
        }
        return null;
    }
}
?>
