<?php 
include_once(__DIR__ . '/../Modelo/m_datosInst.php');

$objCDatosInst = new ControladorDatosInst();
$obteniendoData = $objCDatosInst->obtenerDataInstitucion();

class ControladorDatosInst{

    public function obtenerDataInstitucion(){            
        $datosInst = new datosInst();
        $obteniendoData = $datosInst->obtenerDataInst();
        return $obteniendoData;
    }
}
?>