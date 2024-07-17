<?php
class db_connect{
    private $connection;
    private $dsn;
    private $host;
    private $user;
    private $dbName;
    private $password;
    // Constructor de la clase
    protected function __construct()
    {
        $this->connection = "";
        $this->dsn = "";
        $this->host = "";
        $this->user = "";
        $this->dbName = "";
        $this->password = "";
    }
    // Genera la Conexión con la base de datos
    protected function connect(){
        $this->host="localhost";
        $this->dbName="proyecto";
        $this->user = "root";
        $this->password = "";
        try {
        $this->dsn = "mysql:host =$this->host;dbname=$this->dbName;charset=utf8";
        $this->connection = new PDO($this->dsn, $this->user,$this->password);
        $this->connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $this->connection->exec("SET NAMES 'utf8'");
        return $this->connection;}
        catch( PDOException $e){
            echo "Connection failed: ".$e->getMessage(); 
            return false;
        }
    }
    // Ejecuta queries SQL sencillas
    protected function query($query , $data){
        try{
            $this->connect();
            $query_exec = $this->connect()->prepare("$query");
            $query_exec->execute(is_array($data)?$data:[$data]);
            if( $query_exec->rowCount()>0){
                return $query_exec;
            }
            return false;
        }
       catch(PDOException $e){
        return false;
       }

    }
    // Ejecuta queries SQL en forma de transacción
    protected function queryTransaction($data){
        $this->connect();
        if ($this->connection) {
            try {
                $this->connection->beginTransaction();
                foreach($data as $query => $val) {
                    $query_exec = $this->connection->prepare("$query");
                    $query_exec->execute(is_array($val)?$val:[$val]);
                }
                $this->connection->commit();
                return true;
                
            } catch (PDOException $e) {
                $this->connection->rollBack();
                return false;
            }
        }
        return false;
    }
    // Hace el fetch de registros individuales 
    protected function fetch_query($record){
        return $record->fetch(PDO::FETCH_ASSOC);
    }
    // Hace el fetch de multiples registros
    protected function fetch_all_query($record){
        return $record->fetchAll(PDO::FETCH_ASSOC);
    }

}
?>