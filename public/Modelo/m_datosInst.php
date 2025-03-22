<?php

include_once("basedatos.php");
class datosInst extends database_connect{


        // Método para obtener el precio actual del dólar
        public function obtenerDataInst()
        {
            $sql = "SELECT * FROM `datos_inst`"; // Asume que el ID es 1
            $result = $this->query($sql, []);  // El array vacío es para cumplir con la estructura del método `query`
            
       
            return $this->fetch_query($result);

       
        }
}

?>