<?php
require_once("basedatos.php");

class Bitacora extends database_connect
{
    private $username;
    private $date;
    private $type;
    private $description;
    private $user_computer;
    // pagination properties
    private $filter_op;
    private $filter_date;
    private $filter_input;
    private $offset;

    public function __construct() {
        $this->username = 0;
        $this->date = "";
        $this->type = "";
        $this->description = "";
        $this->user_computer = "";
        $this->filter_op = "";
        $this->filter_date = "";
        $this->filter_input = "";
        $this->offset = "";
    }
    public function setData($username, $type, $description, $user_computer) {
        $this->username = $username;
        // $this->date = $date;
        $this->type = $type;
        $this->description = $description;
        $this->user_computer = $user_computer;
    }
    public function setPaginationFilter($filter)
    {
        $this->filter_op = $filter["op_type"];
        $this->filter_date = $filter["date"];
        $this->filter_input = $filter["input_filter"];
 
    }
    public function setPagination($offset)
    {
        $this->offset = $offset;
    }
    public function countAll()
    {
        $query = "SELECT COUNT(*) AS n_records 
                    FROM bitacora 
                    INNER JOIN personas ON bitacora.cedula = personas.cedula";
        $params = [];
        if(!empty($this->filter_op) || !empty($this->filter_date) || !empty($this->filter_input))
        {
            $query.= " WHERE";
            if (!empty($this->filter_op))
            {
                $query.= " bitacora.type = ?";
                $query.=  !empty($this->filter_date) || !empty($this->filter_input) ? " AND" : "";
                array_push($params, $this->filter_op);
            }
            if (!empty($this->filter_date))
            {
                if(count($this->filter_date) > 1)
                {
                    $query.= " DATE(bitacora.fecha_hora) BETWEEN '?' AND '?'";
                    array_push($params, $this->filter_date["inicio"], $this->filter_date["final"]);
                }
                else
                {
                    $query.= array_key_first($this->filter_date) == "inicio"? " DATE(bitacora.fecha_hora) >= ?" : " DATE(bitacora.fecha_hora) <= ?";

                    array_push($params, array_values($this->filter_date)[0]);
                }
                $query.=  !empty($this->filter_input) ? " AND" : "";
            }
            if (!empty($this->filter_input))
            {
                $query.= " CONCAT(personas.primer_nombre,' ',personas.primer_apellido) LIKE CONCAT('%', ?, '%')
                OR bitacora.cedula = ?";
                array_push($params, $this->filter_input, $this->filter_input);
            }
            
        }
        else{
            $params = "";
        }
        $result = $this->query($query, $params);
        return $result ? $this->fetch_query($result) : false;
    }
    public function getAll()
    {
        $query = "SELECT bitacora.fecha_hora, bitacora.type, bitacora.cedula, CONCAT(personas.primer_nombre,' ',personas.primer_apellido) AS full_name, bitacora.description, bitacora.user_computer
                    FROM bitacora 
                    INNER JOIN personas ON bitacora.cedula = personas.cedula";
        $params = [];
        if(!empty($this->filter_op) || !empty($this->filter_date) || !empty($this->filter_input))
        {
            $query.= " WHERE";
            if (!empty($this->filter_op))
            {
                $query.= " bitacora.type = ?";
                $query.=  !empty($this->filter_date) || !empty($this->filter_input) ? " AND" : "";
                array_push($params, $this->filter_op);
            }
            if (!empty($this->filter_date))
            {
                if(count($this->filter_date) > 1)
                {
                    $query.= " DATE(bitacora.fecha_hora) BETWEEN '?' AND '?'";
                    array_push($params, $this->filter_date["inicio"], $this->filter_date["final"]);
                }
                else
                {
                    $query.= array_key_first($this->filter_date) == "inicio"? " DATE(bitacora.fecha_hora) >= ?" : " DATE(bitacora.fecha_hora) <= ?";

                    array_push($params, array_values($this->filter_date)[0]);
                }
                $query.=  !empty($this->filter_input) ? " AND" : "";
            }
            if (!empty($this->filter_input))
            {
                $query.= " CONCAT(personas.primer_nombre,' ',personas.primer_apellido) LIKE CONCAT('%', ?, '%')
                OR bitacora.cedula = ?";
                array_push($params, $this->filter_input, $this->filter_input);
            }
            
        }
        else{
            $params = "";
        }
        $result = $this->query($query, $params);
        return $result ? $this->fetch_all_query($result) : false;
    }


    public function insertBitacora()
    {
        $query = "INSERT INTO bitacora(cedula, type, description, user_computer)
        VALUES (?,?,?,?)";
        $result = $this->query($query,[$this->username, $this->type, $this->description, $this->user_computer]);
        if ($result)
        {
            return true;
        }
        return false;

    }
}
?>