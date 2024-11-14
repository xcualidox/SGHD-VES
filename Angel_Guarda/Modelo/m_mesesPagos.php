<?php
require_once("basedatos.php");

class mesesPagos extends database_connect
{

    public function obtenerColumnasMesesPagos(){
        $sql="SELECT COLUMN_NAME
              FROM INFORMATION_SCHEMA.COLUMNS
              WHERE TABLE_NAME = 'meses_pagos'
              ORDER BY ORDINAL_POSITION"; //ORDER BY ORDINAL_POSITION preserva el orden de las columnas
        $query=$this->query($sql,[]);
        $result=$this->fetch_all_query($query);
        return $result;
    }

    public function obtenerMayorMesPago($idMes,$ano){
        $sql='SELECT MAX(abonado) as maximo FROM meses_pagos
        WHERE mes = ?
        AND ano_escolar = ?';

        $query=$this->query($sql,[$idMes,$ano]);
        $result=$this->fetch_query($query);
        return $result;
    }

    public function verificarMesPago($parametros){
        
        $sql="SELECT * FROM meses_pagos WHERE 1=1";
        $parameters=[];

        //Recorrer cada parametro y añadirlo a la lista

        if (isset($parametros)) {

            foreach ($parametros as $clave => $valor) {
                if($clave!='' and $valor!=''){
                    $sql.=' AND '.$clave.' LIKE ?';
                    $parameters[]=$valor;
                }
            }

        }

        $query=$this->query($sql,$parameters);
        $result=$this->fetch_all_query($query);
        return $result;

    }

    public function obtenerMesesPagos($parametros,$limit = 1,$offset = 0){

        $sql="SELECT
        meses_pagos.cedula_estudiante,
		mensualidad.mes,
		ano_escolar.nombre AS ano_escolar,
		CONCAT(ano_seccion.ano,' ',ano_seccion.seccion) AS 'ano_seccion',
		meses_pagos.abonado,
		mensualidad.monto as maximo
		FROM meses_pagos
		LEFT JOIN mensualidad ON mensualidad.id = meses_pagos.mes
		LEFT JOIN ano_escolar ON ano_escolar.codigo = meses_pagos.ano_escolar
		LEFT JOIN ano_seccion ON ano_seccion.codigo = meses_pagos.ano_seccion
		WHERE 1=1";
        $parameters=[];

        //Recorrer cada parametro y añadirlo a la lista

        if (isset($parametros)) {

            foreach ($parametros as $clave => $valor) {
                if($clave!='' and $valor!=''){
                    $sql.=' AND '.$clave.' LIKE ?';
                    $parameters[]=$valor;
                }
            }

        }
        
        if ($limit !== null and $offset !== null) { // !== es importante para que reconozca 0 diferente a null
            $sql.=' LIMIT '.intval($limit).' OFFSET '.intval($offset);
        }

        $query=$this->query($sql,$parameters);
        $result=$this->fetch_all_query($query);
        return $result;

    }
    

    public function insertarMesesPagos($data){
        $sql='INSERT INTO meses_pagos
        (cedula_estudiante,
        mes,
        ano_escolar,
        ano_seccion,
        abonado)
        VALUES (?,?,?,?,?)';
        $query=$this->query($sql,$data);
        return $query;
    }

    public function actualizarAbonado($data){
        $sql='UPDATE meses_pagos
        SET
        abonado = ?
        WHERE cedula_estudiante = ?
        AND mes = ?
        AND ano_escolar = ?';
        $query=$this->query($sql,$data);
        return $query;
    }

    

    public function obtenerMesesPagosOG($cedEstudiante = null,$mes = null,$anoEscolar = null,$abonado = null,$maximo = null,$limit = null,$offset = null){
        $sql="SELECT
        meses_pagos.cedula_estudiante,
		mensualidad.mes,
		ano_escolar.nombre AS ano_escolar,
		CONCAT(ano_seccion.ano,' ',ano_seccion.seccion) AS 'ano_seccion',
		meses_pagos.abonado,
		meses_pagos.maximo
		FROM meses_pagos
		LEFT JOIN mensualidad ON mensualidad.id = meses_pagos.mes
		LEFT JOIN ano_escolar ON ano_escolar.codigo = meses_pagos.ano_escolar
		LEFT JOIN ano_seccion ON ano_seccion.codigo = meses_pagos.ano_seccion
		WHERE 1=1";

        $parameters=[];

        if ($cedEstudiante != null) {
            $sql.=' AND cedula_estudiante LIKE ?';
            $parameters[]=$cedEstudiante;
        }

        if ($mes != null) {
            $sql.=' AND mes LIKE ?';
            $parameters[]=$mes;
        }

        if ($anoEscolar != null) {
            $sql.=' AND ano_escolar LIKE ?';
            $parameters[]=$anoEscolar;
        }

        if ($abonado != null) {
            $sql.=' AND abonado LIKE ?';
            $parameters[]=$abonado;
        }

        if ($maximo != null) {
            $sql.=' AND maximo LIKE ?';
            $parameters[]=$maximo;
        }

        if ($limit != null and $offset != null) {
            $sql.=' LIMIT ? OFFSET ?';
            $parameters[]=$limit;
        }

        $query=$this->query($sql,[$parameters]);
        $result=$this->fetch_all_query($query);
        return $result;
    }

}

?>