<?php
class Pagination 
{
    private $filter_type;
    private $filter_value;
    private $offset;
    private $table_name;
    public function __construct()
    {
        $this->filter_type = "";
        $this->filter_value = "";
        $this->offset = "";
        $this->table_name = "";
    }
    public function setFilter($filter_type, $filter_value, $table_name)
    {
        $this->filter_type = $filter_type;
        $this->filter_value = $filter_value;
        $this->table_name = $table_name;
    }
    public function setPagination($offset)
    {
        $this->offset = $offset;
    }
    public function countAll()
    {
        $filter = $this->filter_type ==""?"": " WHERE $this->table_name.$this->filter_type LIKE  CONCAT('%',?,'%')";
        $query = "SELECT COUNT(*) AS n_records FROM $this->table_name".$filter;
        $result = $this->query($query,$this->filterValue);
        return $result->queryString  ? $this->fetch_query($result): false;

    }
}
?>