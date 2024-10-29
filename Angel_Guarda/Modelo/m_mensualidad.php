<?php
require_once("basedatos.php");

class mensualidad extends database_connect
{

    public function obtenerAnoEscolar()
    {
        $sql = "SELECT `codigo`,`nombre`,`activo` FROM `ano_Escolar` ORDER BY `activo` DESC";
        $result = $this->fetch_all_query($this->query($sql, []));

        return $result;
    }

    public function verificarMensualidad($ano,$mes,$monto,$id){

        $sql = "SELECT `ano_escolar`.`nombre`,`mensualidad`.`mes`,`mensualidad`.`monto`,`mensualidad`.`id`
                FROM `mensualidad`
                JOIN `ano_escolar`
                ON `ano_escolar`.`codigo` = `mensualidad`.`ano_escolar`
                WHERE 
                `mensualidad`.`ano_escolar`LIKE ? AND
                `mensualidad`.`mes` LIKE ? AND
                `mensualidad`.`monto` LIKE ? AND
                `mensualidad`.`id` LIKE ?"; 
        $result = $this->fetch_all_query($this->query($sql, [$ano,$mes,$monto,$id]));  // id de ano_escolar

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
