<?php

require_once(__DIR__ . "/../Modelo/m_estudiantes.php");

$estudiante = new estudiante();


$total_registrosEstRep=$estudiante->contarTotalEstudiantesRepresentantes(); //Muestra el total de Registros de la pagina
// Obtener los años escolares
$anosEscolares = $estudiante->obtenerAnoEscolar();
$anoSeccion = $estudiante->obtenerAnoSeccion();




$pagina_actual = isset($_GET['pagina']) ? (int)$_GET['pagina'] : 1;
$resultados_por_pagina = 1;
$offset = ($pagina_actual - 1) * $resultados_por_pagina;
$parametros_extra = '';



if (isset($_GET['campo']) && isset($_GET['buscar'])) {
    $campo = $_GET['campo'];
    $buscar = $_GET['buscar'];
    $parametros_extra = "&campo=$campo&buscar=$buscar";

    // Dividir el término de búsqueda en palabras
    $palabras = explode(' ', trim($buscar));

    $resultados = []; // Inicializa el arreglo de resultados

    switch ($campo) {
        case 'cedula_estudiante':
            $resultados = $estudiante->consultarEstudianteRepresentante($buscar, null, null, null);
            break;
        case 'nombre_estudiante':
            foreach ($palabras as $palabra) {
                $resultadosPalabra = $estudiante->consultarEstudianteRepresentante(null, null, $palabra, null);
                $resultados = array_merge($resultados, $resultadosPalabra);
            }
            break;
        case 'cedula_representante':
            $resultados = $estudiante->consultarEstudianteRepresentante(null, $buscar, null, null);
            break;
        case 'nombre_representante':
            foreach ($palabras as $palabra) {
                $resultadosPalabra = $estudiante->consultarEstudianteRepresentante(null, null, null, $palabra);
                $resultados = array_merge($resultados, $resultadosPalabra);
            }
            break;
        default:
            $resultados = []; // Si no se selecciona ningún campo válido
            break;
    }

    // Filtrar resultados duplicados basados en un campo único, como 'cedula_estudiante'
    $resultados = array_unique(array_map('serialize', $resultados)); // Serialize para hacer único
    $resultados = array_map('unserialize', $resultados);
    $tablaHTML =generarTabla($resultados, $pagina_actual, $resultados_por_pagina, $parametros_extra, $total_registrosEstRep);
} else {
    // Si no se está realizando una búsqueda, traer todos los datos

    var_dump($resultados_por_pagina);
    var_dump($offset);
  

    $resultados = $estudiante->obtenerRepresentanteRepresentado($resultados_por_pagina, $offset);
  

    //Le hago Reverse para traermelo de manera de Ultimo que se muestre de Primero
    $resultados = array_reverse($resultados);
    $tablaHTML = generarTabla($resultados, $pagina_actual, $resultados_por_pagina, $parametros_extra, $total_registrosEstRep);

  
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['datosRepresentantes']) && isset($_POST['datosEstudiantes'])) {
        $datosRepresentantes = $_POST['datosRepresentantes'];
        $datosEstudiantes = $_POST['datosEstudiantes'];
        $pagina_actual = intval($_POST['pagina_actual']);
     
    
     
            $estudiante->insertEstudiante(
                $datosEstudiantes['cedulaEstudianteActual'],
                $datosEstudiantes['cedulaEstudiante'],
                $datosEstudiantes['nombres'],
                $datosEstudiantes['apellidos'],
                $datosEstudiantes['anoSeccion'],
                $datosEstudiantes['anoEscolar'],
                $datosRepresentantes['cedulaRepresentante'],
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
        
                 // Actualizar la relación entre el estudiante y el nuevo representante
                 $estudiante->actualizarRepresentanteEstudiante(
                    $datosEstudiantes['cedulaEstudiante'],
                    $datosRepresentantes['cedulaRepresentante']
                );
        }
        
            $estudiante->insertarRelacionRepresentanteEstudiante(
                $datosEstudiantes['cedulaEstudiante'],
                $datosRepresentantes['cedulaRepresentante']
            );
           
            $resultados = $estudiante->obtenerRepresentanteRepresentado($resultados_por_pagina, $offset);
            $resultados = array_reverse($resultados); // Traer los más recientes primero
        
            $tablaHTML = generarTabla($resultados, $pagina_actual, $resultados_por_pagina, $parametros_extra, $total_registrosEstRep);
        
            // Enviar una respuesta JSON al cliente
            echo json_encode([
                'status' => 'success',
                'message' => 'Datos insertados correctamente',
                'html' => $tablaHTML 
            ]);

         
        }
    else {
        echo json_encode([
            'status' => 'error',
            'message' => 'Ha habido Algun Error'
        ]);
    }

}


function generarTabla($resultados, $pagina_actual, $resultados_por_pagina,$parametros_extra,$total_registrosEstRep) {
    
    $html = ''; 

    $total_paginas = ceil($total_registrosEstRep / $resultados_por_pagina);

    
    

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
                    <img src='../../../images/icons/papelera.svg' class='w-8 h-8 filtro-rojo cursor-pointer' alt='Borrar' title='Borrar'>
                    <img src='../../../images/icons/pdf.svg' class='w-8 h-8 filtro-verde cursor-pointer' alt='Borrar' title='Borrar'>
                    <img src='../../../images/icons/modificar.svg' class='w-8 h-8 filtro-azul cursor-pointer' title='Modificar' data-datos='" . htmlspecialchars(json_encode($dato), ENT_QUOTES, 'UTF-8') . "' onclick='llenarFormulario(this)'>
                    <img src='../../../images/icons/moreGrid.svg' class='w-8 h-8 filtro-negro cursor-pointer' title='Mostrar Más' data-datos='" . htmlspecialchars(json_encode($dato), ENT_QUOTES, 'UTF-8') . "' onclick='openModalMostrarMasDatos(event)'>
                    <img src='../../../images/icons/credit-card.svg' class='w-8 h-8 filtro-negro cursor-pointer' onclick='openPagoEspecificoModal(
                        \"" . htmlspecialchars($dato['cedula_estudiante']) . "\",
                        \"" . htmlspecialchars($dato['nombres_estudiante']) . "\",
                        \"" . htmlspecialchars($dato['apellidos_estudiante']) . "\",
                        \"" . htmlspecialchars($dato['cedula_representante']) . "\",
                        \"" . htmlspecialchars($dato['nombres_representante']) . "\",
                        \"" . htmlspecialchars($dato['apellidos_representante']) . "\"
                    )' alt='Pago Especifico' title='Pago Especifico'>
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

        $rango_inicio = max(1, $pagina_actual - 3);
        $rango_fin = min($total_paginas, $pagina_actual + 3);

        if ($rango_inicio > 1) {
            $html .= "<a href='?pagina=1$parametros_extra'>1</a> ";
            if ($rango_inicio > 2) {
                $html .= "... ";
            }
        }

        for ($i = $rango_inicio; $i <= $rango_fin; $i++) {
            $clase = ($i == $pagina_actual) ? 'seleccionado' : '';
            $html .= "<a href='?pagina=$i$parametros_extra' class='$clase'>$i</a> ";
        }

        if ($rango_fin < $total_paginas) {
            if ($rango_fin < $total_paginas - 1) {
                $html .= "... ";
            }
            $html .= "<a href='?pagina=$total_paginas$parametros_extra'>$total_paginas</a>";
        }

       
    }

    $html .= "</td></tr>";

    return $html;
}
