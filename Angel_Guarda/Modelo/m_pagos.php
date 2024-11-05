<?php
require_once("basedatos.php");

class pagos extends database_connect{

    public function obtenerColumnasPagos(){
        $sql="SELECT COLUMN_NAME
              FROM INFORMATION_SCHEMA.COLUMNS
              WHERE TABLE_NAME = 'pagos'";
        $query=$this->query($sql,[]);
        $result=$this->fetch_all_query($query);
        return $result;
    }

    public function obtenerPagos($parametros,$limit,$offset){

        $sql='SELECT * from pagos WHERE 1=1';
        $parameters=[];

        //Recorrer cada parametro y añadirlo a la lista

        if (isset($parametros)) {

            foreach ($parametros as $clave => $valor) {
                $sql.=' AND '.$clave.' LIKE ?';
                $parameters[]=$valor;
            }

        }
        
        if ($limit !== null and $offset !== null) { // !== es importante para que reconozca 0 diferente a null
            $sql.=' LIMIT '.intval($limit).' OFFSET '.intval($offset);
        }

        $query=$this->query($sql,$parameters);
        $result=$this->fetch_all_query($query);
        return $result;

    }

    public function obtenerPagosOG( //parametros
    $idPago = null,
    $cedEstudiante = null,
    $cedRepresentante = null,
    $fecha = null,
    $refId = null,
    $anoEscolar = null,
    $mes = null,
    $detalles = null,
    $descuento = null,
    $nombresE = null,
    $nombresR = null,
    $telefono = null,
    $direccion = null,
    $monto = null,
    $tipoPago = null,
    $dolarBCV = null,
    $limit = null,
    $offset = null,)
    {

        $sql='SELECT * FROM pagos WHERE 1=1';

        $parameters=[];

        if ($idPago != null) {
            $sql.=' AND  idPago LIKE ?';
            $parameters[]=$idPago;
        }
        if ($cedEstudiante != null) {
            $sql.=' AND  cedula_estudiante LIKE ?';
            $parameters[]=$cedEstudiante;
        }
        if ($cedRepresentante != null) {
            $sql.=' AND  cedula_representante LIKE ?';
            $parameters[]=$cedRepresentante;
        }
        if ($fecha != null) {
            $sql.=' AND  fecha LIKE ?';
            $parameters[]=$fecha;
        }
        if ($refId != null) {
            $sql.=' AND  referencia_id LIKE ?';
            $parameters[]=$refId;
        }
        if ($anoEscolar != null) {
            $sql.=' AND  ano_escolar LIKE ?';
            $parameters[]=$anoEscolar;
        }
        if ($mes != null) {
            $sql.=' AND  mes LIKE ?';
            $parameters[]=$mes;
        }
        if ($detalles != null) {
            $sql.=' AND  detalles LIKE ?';
            $parameters[]=$detalles;
        }
        if ($descuento != null) {
            $sql.=' AND  descuento LIKE ?';
            $parameters[]=$descuento;
        }
        if ($nombresE != null) {
            $sql.=' AND  nombresE LIKE ?';
            $parameters[]=$nombresE;
        }
        if ($nombresR != null) {
            $sql.=' AND  nombresR LIKE ?';
            $parameters[]=$nombresR;
        }
        if ($telefono != null) {
            $sql.=' AND  telefono LIKE ?';
            $parameters[]=$telefono;
        }
        if ($direccion != null) {
            $sql.=' AND  direccion LIKE ?';
            $parameters[]=$direccion;
        }
        if ($monto != null) {
            $sql.=' AND  monto LIKE ?';
            $parameters[]=$monto;
        }
        if ($tipoPago != null) {
            $sql.=' AND  tipo_pago LIKE ?';
            $parameters[]=$tipoPago;
        }
        if ($dolarBCV != null) {
            $sql.=' AND  monto LIKE ?';
            $parameters[]=$dolarBCV;
        }
        if ($limit != null and $offset != null) {
            $sql.=' LIMIT ? OFFSET ?';
            $parameters[]=$limit;
            $parameters[]=$offset;
        }

        $query=$this->query($sql,[$parameters]);
        $result=$this->fetch_all_query($query);
        return $result;

    }

}
?>