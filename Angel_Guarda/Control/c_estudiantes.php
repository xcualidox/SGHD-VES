<?php

require_once(__DIR__ . "/../Modelo/m_estudiantes.php");

$estudiante = new estudiante();

// Obtener los años escolares
$anosEscolares = $estudiante->obtenerAnoEscolar();
$anoSeccion = $estudiante->obtenerAnoSeccion();

$resultados = [];  // Inicializar una variable vacía para los resultados


$pagina_actual = isset($_GET['pagina']) ? (int)$_GET['pagina'] : 1;

$resultados_por_pagina = 10;
$offset = 0;

if (isset($_GET['pagina'])){
    $pagina=$_GET['pagina']-1;

    $offset= $resultados_por_pagina*$pagina;  
}

$parametros_extra = '';



if (isset($_GET['campo']) && isset($_GET['buscar'])) {
    $campo = $_GET['campo'];
    $buscar = $_GET['buscar'];
    $parametros_extra = "&campo=$campo&buscar=$buscar";
}
else{
    $campo = '';
    $buscar = '';
    $parametros_extras = '';
}

// Dividir el término de búsqueda en palabras
$palabras = explode(' ', trim($buscar));

$resultados = []; // Inicializa el arreglo de resultados

switch ($campo) {
    case 'cedula_estudiante':
        $resultados = $estudiante->consultarEstudianteRepresentante($buscar, null, null, null, $resultados_por_pagina, $offset);
        $resultados_totales=$estudiante->cantidadResultados($buscar, null, null, null);
        break;
    case 'nombre_estudiante':
        foreach ($palabras as $palabra) {
            $resultadosPalabra = $estudiante->consultarEstudianteRepresentante(null, null, $palabra, null, $resultados_por_pagina, $offset);
            $resultados = array_merge($resultados, $resultadosPalabra);
        }
        $resultados_totales=$estudiante->cantidadResultados(null, null, $palabra, null);
        break;
    case 'cedula_representante':
        $resultados = $estudiante->consultarEstudianteRepresentante(null, $buscar, null, null, $resultados_por_pagina, $offset);
        $resultados_totales=$estudiante->cantidadResultados(null, $buscar, null, null);
        break;
    case 'nombre_representante':
        foreach ($palabras as $palabra) {
            $resultadosPalabra = $estudiante->consultarEstudianteRepresentante(null, null, null, $palabra, $resultados_por_pagina, $offset);
            $resultados = array_merge($resultados, $resultadosPalabra);
        }
        $resultados_totales=$estudiante->cantidadResultados(null, null, $palabra, null);
        break;
    default:
        $resultados = $estudiante->consultarEstudianteRepresentante(null, null, null, null, $resultados_por_pagina, $offset);
        $resultados_totales=$estudiante->cantidadResultados(null, null, null, null);
        break;
}

    

    // Filtrar resultados duplicados basados en un campo único, como 'cedula_estudiante'
    $resultados = array_unique(array_map('serialize', $resultados)); // Serialize para hacer único
    $resultados = array_map('unserialize', $resultados);
    $tablaHTML = generarTabla($resultados, $pagina_actual, $resultados_por_pagina,$parametros_extra, $resultados_totales);


if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    //Eliminar
    if (isset($_POST['cedulaEliminar'])){
        $cedulaEliminar=$_POST['cedulaEliminar'];

        $datosBitacora=$estudiante->verificarEstudiante($cedulaEliminar);

        $eliminaRelacion=$estudiante->eliminarRelacion($cedulaEliminar);
        $eliminaEstudiante=$estudiante->eliminarEstudiante($cedulaEliminar);

        require_once("c_bitacora.php");
        $nombres=ucFirst($datosBitacora['nombres']);
        $apellidos=ucFirst($datosBitacora['apellidos']);
        $cedula=$datosBitacora['cedula_estudiante'];
        $status='success';
        $message='Fino señores';

        if($eliminaEstudiante){
            insertBitacora($_SESSION['username'], "eliminar", ' Eliminó al estudiante '.$nombres.' '.$apellidos.'('. $cedula .') correctamente.');
        }
        else{
            $status='error';
            $message='No se pudo eliminar';
        }

        echo json_encode([
        'status' => $status,
        'message' => $message
        ]);
        exit();

    }

    if (isset($_POST['datosRepresentantes']) && isset($_POST['datosEstudiantes'])) {
        $datosRepresentantes = $_POST['datosRepresentantes'];
        $datosEstudiantes = $_POST['datosEstudiantes'];
      
        $representantesVacío=false;

     
            $estudiante->insertEstudiante(
                $datosEstudiantes['cedulaEstudianteActual'],
                $datosEstudiantes['cedulaEstudiante'],
                $datosEstudiantes['nombres'],
                $datosEstudiantes['apellidos'],
                $datosEstudiantes['anoSeccion'],
                $datosEstudiantes['anoEscolar'],
                $datosRepresentantes['cedulaRepresentante']
            );
        
            // Insertar los datos del representante
            $estudiante->insertRepresentante(
                $datosRepresentantes['cedulaRepresentante'],
                $datosRepresentantes['nombresRepresentante'],
                $datosRepresentantes['apellidosRepresentante'],
                $datosRepresentantes['correo'],
                $datosRepresentantes['direccion'],
                $datosRepresentantes['telefono'],
                $datosRepresentantes['telefonoDomicilio']
            );
            

        
            // Insertar la relación entre representante y estudiante
          // Insertar la relación entre representante y estudiante
            
            if (!empty($datosEstudiantes['cedulaEstudianteActual'])) {

                $verificarRelacion=$estudiante->verificarRelacionEstudiante($datosEstudiantes['cedulaEstudiante']);

                if (count($verificarRelacion)<1) {
                        $accion=$estudiante->insertarRelacionRepresentanteEstudiante(
                        $datosEstudiantes['cedulaEstudiante'],
                        $datosRepresentantes['cedulaRepresentante']
                    );
                }
                else{
                    // Actualizar la relación entre el estudiante y el nuevo representante
                    $accion=$estudiante->actualizarRepresentanteEstudiante(
                    $datosEstudiantes['cedulaEstudiante'],
                    $datosRepresentantes['cedulaRepresentante']
                    );

                }

                //Bitacora Actualizar
                if ($accion){

                    require_once("c_bitacora.php");
                    $nombres=ucFirst($datosEstudiantes['nombres']);
                    $apellidos=ucFirst($datosEstudiantes['apellidos']);
                    $cedula=$datosEstudiantes['cedulaEstudiante'];
                    $string1='';
                
                    foreach ($datosEstudiantes as $clave => $valor) {
                        $string1.='<br>'.$clave.': "'.$valor.'"';
                    }

                    $string1.='<br>';
    
                    foreach ($datosRepresentantes as $clave => $valor){
                        $string1.='<br>'.$clave.': "'.$valor.'"';
                    }
                    //insertBitacora($_SESSION['username'], "modificar", ' Modificó al estudiante: <br> '.$nombres.' '.$apellidos.'('. $cedula .') correctamente.');
                    insertBitacora($_SESSION['username'], "modificar", ' Modificó al estudiante '.$string1.' correctamente.');
                }

   

                

            }

            else{

                //Bitacora Insertar

                $estudiante->insertarRelacionRepresentanteEstudiante(
                    $datosEstudiantes['cedulaEstudiante'],
                    $datosRepresentantes['cedulaRepresentante']
                );

                $exitos=[];

                $correctoEstudiante=$estudiante->verificarEstudiante($datosEstudiantes['cedulaEstudiante']);
                $correctoRepresentante=$estudiante->verificarRepresentante($datosRepresentantes['cedulaRepresentante']);
                $correctoRelacion=$estudiante->verificarRelacion($datosEstudiantes['cedulaEstudiante'],$datosRepresentantes['cedulaRepresentante']);

                $exitos[0]=$correctoEstudiante;
                $exitos[1]=$correctoRepresentante;
                $exitos[2]=$correctoRelacion;
                $correcto=true;

                for ($i=0; $i < count($exitos); $i++) { 
                    if(!$exitos[$i]){
                        $correcto=false;
                    }
                }

                require_once("c_bitacora.php");
                $nombres=ucFirst($datosEstudiantes['nombres']);
                $apellidos=ucFirst($datosEstudiantes['apellidos']);
                $cedula=$datosEstudiantes['cedulaEstudiante'];

                if ($correcto) {
                    insertBitacora($_SESSION['username'], "insertar", ' Insertó al estudiante '.$nombres.' '.$apellidos.'('. $cedula .') correctamente.');
                }

                else{
                    insertBitacora($_SESSION['username'], "insertar", ' Insertó al estudiante '.$nombres.' '.$apellidos.'('. $cedula .') con problemas.');
                }

            }
            
           
                $resultados = $estudiante->consultarEstudianteRepresentante(null, null, null, null, $resultados_por_pagina, $offset);
            
            
                $tablaHTML = generarTabla($resultados, $pagina_actual, $resultados_por_pagina,$parametros_extra, $resultados_totales);

                if (!isset($exitos)) {
                    $exitos='';
                }
        
            // Enviar una respuesta JSON al cliente
            echo json_encode([
                'status' => 'success',
                'message' => 'Datos insertados correctamente',
                'html' => $tablaHTML,
                'resultados' => $datosEstudiantes['cedulaEstudiante']
            ]);

         
        }
    else {
        echo json_encode([
            'status' => 'error',
            'message' => 'Ha habido Algun Error'
        ]);
    exit();
    }

}


function generarTabla($resultados, $pagina_actual, $resultados_por_pagina,$parametros_extra, $resultados_totales) {

    $html = '';
    
    $total_resultados = $resultados_totales[0]["COUNT(*)"];
    $total_paginas = ceil($total_resultados / $resultados_por_pagina);

    //Convertir NULL en String Vacía para evitar errores de deprecated de PHP
    foreach ($resultados as $i => $dato) {

        foreach ($dato as $clave => $valor) {
            if ($valor === null) {
                $resultados[$i][$clave] = '';
            }
        }

    }


    if (!empty($resultados)) {
        foreach ($resultados as $dato) {
            $html .= "<tr>";
            $html .= "<td class='numeroCedula border px-4 py-2'>" . htmlspecialchars($dato['cedula_estudiante']) . "</td>";
            $html .= "<td class='border px-4 py-2'>" . htmlspecialchars($dato['nombres_estudiante']) . " " . htmlspecialchars($dato['apellidos_estudiante']) . "</td>";
            $html .= "<td class='border px-4 py-2'>" . htmlspecialchars($dato['nombres_representante']) . " " . htmlspecialchars($dato['apellidos_representante']) . "</td>";
            $html .= "<td class='numeroCedula border px-4 py-2'>" . htmlspecialchars($dato['cedula_representante']) . "</td>";
            $html .= "<td class='numeroCelular border px-4 py-2'>" . htmlspecialchars($dato['telefono']) . "</td>";
            $html .= "<td class='border px-4 py-2 text-center'>
                <div class='flex justify-center items-center space-x-4'>
                    <img src='../../../images/icons/papelera.svg' class='w-8 h-8 filtro-rojo cursor-pointer' alt='Borrar' title='Borrar' onclick='EliminarEstudiante(".'"'.$dato['cedula_estudiante'].'"'.")'>
                    <img src='../../../images/icons/pdf.svg' class='w-8 h-8 filtro-verde cursor-pointer' alt='Borrar' title='Borrar'>
                    <img src='../../../images/icons/modificar.svg' class='w-8 h-8 filtro-azul cursor-pointer' title='Modificar' data-datos='" . htmlspecialchars(json_encode($dato), ENT_QUOTES, 'UTF-8') . "' onclick='llenarFormulario(this)'>
                    <img src='../../../images/icons/moreGrid.svg' class='w-8 h-8 filtro-negro cursor-pointer' title='Mostrar Más' data-datos='" . htmlspecialchars(json_encode($dato), ENT_QUOTES, 'UTF-8') . "' onclick='openModalMostrarMasDatos(event)'>
                    <img src='../../../images/icons/credit-card.svg' class='w-8 h-8 filtro-negro cursor-pointer hidden' 
                    data-datos='" . htmlspecialchars(json_encode($dato), ENT_QUOTES, 'UTF-8') . "'
                    onclick='openPagoEspecificoModal( event)' alt='Pago Especifico' title='Pago Especifico'>
                </div>
            </td>";
            $html .= "</tr>";
        }
    } else {
        $html .= "<tr><td colspan='6' class='border px-4 py-2 text-center'>No se encontraron resultados.</td></tr>";
    }

    // Agregar paginación al final de la tabla
    $html .= "<tr><td colspan='6' class='paginacion text-center'>";

    if ($total_paginas > 1) {

        // Mostrar botón de "Anterior"
    

        // Determinar las páginas a mostrar
        $mostrar_paginas = 7; // Máximo de páginas a mostrar
        $rango_inicio = max(1, $pagina_actual - 3);
        $rango_fin = min($total_paginas, $pagina_actual + 3);

        if ($rango_inicio > 1) {
            $html .= "<a href='?pagina=1$parametros_extra'>1</a>";
            if ($rango_inicio > 2) {
                $html .= "... ";
            }
        }

        // Mostrar las páginas en el rango
        for ($i = $rango_inicio; $i <= $rango_fin; $i++) {
            $clase = ($i == $pagina_actual) ? 'seleccionado' : '';
            $html .= "<a href='?pagina=$i$parametros_extra' class='$clase'>$i</a>  ";
        }

        // Mostrar salto hacia adelante si es necesario
        if ($rango_fin < $total_paginas) {
            if ($rango_fin < $total_paginas - 1) {
                $html .= "... ";
            }
            $html .= "<a href='?pagina=$total_paginas$parametros_extra'>$total_paginas</a>";
        }

        // Mostrar botón de "Siguiente"
     
    }

    $html .= "</td></tr>";

    return $html;
}
