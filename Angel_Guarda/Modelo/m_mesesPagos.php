<?php
require_once("basedatos.php");

class mesesPagos extends database_connect
{
    public function obtenerMesesPagos($cedEstudiante = null,$mes = null,$anoEscolar = null,$abonado = null,$maximo = null,$limit = null,$offset = null){
        $sql="
        SELECT meses_pagos.cedula_estudiante,
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