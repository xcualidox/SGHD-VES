<?php
class bdmysql{
	private $conexion; 
	function conectar()
	{
		$this->conexion = mysqli_connect("localhost", "root", "", "proyecto");
		if ( $this->conexion )
			return true;
		else
			die("No se conecta: " . mysqli_connect_error());
	}

	function ejecutar($sql)
	{
		$this->conectar();
		return mysqli_query( $this->conexion, $sql); 
	}
	function list($sql)
	{
	return mysqli_fetch_array($sql);
	}
	function Cantidad($sql)  {
		return mysqli_num_rows($sql);
	}
	function ListAll($sql, $type)
	{
		//MYSQLI_ASSOC
		//MYSQLI_NUM (this is default)
		$array = mysqli_fetch_all($sql, $type);
	   return $array;
	}
}
?>
<?php
class database_connect{
    protected $connection;
    protected $dsn;
    protected $host;
    protected $user;
    protected $dbName;
    protected $password;
    // Constructor de la clase
    public function __construct()
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
        $this->connection->exec("SET time_zone = '-04:00'");
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
            if (strpos($query, '?') !== false)
            {
                $query_exec->execute(is_array($data)?$data:[$data]);
            }
            else
            {
                 $query_exec->execute();
            }
            if( $query_exec->rowCount()>0){
                return $query_exec;
            }
            //$query_exec->debugDumpParams();
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
        if ($record === null || empty($record)) {
            return $record;
        }
        else {
            return $record->fetchAll(PDO::FETCH_ASSOC);
        }
       
    }

}
?>
