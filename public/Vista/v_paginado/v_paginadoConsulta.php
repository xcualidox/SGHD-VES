<?php
        // Determina la página actual
        if (!isset($_GET["pag_asig"])) {
            $paginaActual = 1; // Página predeterminada es la primera
        } else {
            $paginaActual = $_GET["pag_asig"]; // Página actual obtenida de la URL
        }

        $limit = 10; // Número de registros por página
        $offset = ($paginaActual - 1) * $limit; // Offset para la consulta SQL

        $objeto = new query();
        $resultado = $objeto->GenerarTabla($offset, $limit); // Obtener los registros de la página actual
        $numFilas = $objeto->TotalPaginas(); // Obtener el número total de registros

        // Iterar sobre los resultados y mostrarlos en la tabla
      

    
        ?>