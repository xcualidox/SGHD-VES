<?php
require_once("basedatos.php");

class mensualidad extends database_connect
{

    public function obtenerAnoEscolar($activo)
    {
        $sql = "SELECT `nombre` FROM `ano_Escolar` WHERE `activo` = ?";
        $result = $this->query($sql, [$activo]); // $activo es bool

        return $result;
    }
    
    public function obtenerMensualidad($ano)
    {
        $sql = "SELECT `ano_escolar`.`nombre`,`mensualidad`.`mes`,`mensualidad`.`monto`,`mensualidad`.`id`
                FROM `mensualidad`
                JOIN `ano_escolar`
                ON `ano_escolar`.`codigo` = `mensualidad`.`ano_escolar`
                WHERE `mensualidad`.`ano_escolar` LIKE ?"; 
        $result = $this->fetch_all_query($this->query($sql, [$ano]));  // id de ano_escolar

        return $result;
    }  

    public function insertarMensualidad($ano,$mes,$monto)
    {
        $sql = "INSERT INTO `mensualidad` (`ano_escolar`, `mes`, `monto`) VALUES (?, ?, ?)"; 
        $result = $this->query($sql, [$ano,$mes,$monto]);  // id de ano_escolar

        return $result;
    }

    public function actualizarMensualidad($ano,$mes,$monto,$id)
    {
        $sql = "UPDATE `mensualidad` SET `ano_escolar` = ?, mes = ?, monto = ? WHERE id = ?"; 
        $result = $this->query($sql, [$ano,$mes,$monto,$id]);  // id de ano_escolar

        return $result;
    }

    public function eliminarMensualidad($id)
    {
        $sql = "DELETE FROM `mensualidad` WHERE `id`=?"; 
        $result = $this->query($sql, [$id]);  // id de ano_escolar

        return $result;
    }

}
?>
