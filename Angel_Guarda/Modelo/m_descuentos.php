<?php

include_once("basedatos.php");

class descuentos extends database_connect{


        // Método para obtener el precio actual del dólar
        public function obtenerDescuento($date)
        {
            $sql = "SELECT descuento FROM descuentos WHERE dia_inicio <= DAY(?) AND dia_fin >= DAY(?)"; // Asume que el ID es 1
            $query = $this->query($sql, [$date,$date]);  // El array vacío es para cumplir con la estructura del método `query`
            $result = $this->fetch_query($query);
       
            return $result;
       
        }
}

?>