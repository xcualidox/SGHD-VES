<?php
        // Calcular el total de páginas
        $totalpag = ceil($numFilas / $limit);
        echo "<div class='paginacion'>";

        // Si el total de páginas es menor o igual a 10, mostrar todas las páginas
        if ($totalpag <= 10) {
            for ($i = 1; $i < $totalpag + 1; $i++) {
                if ($paginaActual == $i) {
                    echo "<a href=?pag_asig=" . $i . " class='seleccionado'>" . $i . "</a>";
                } else {
                    echo "<a href=?pag_asig=" . $i . ">" . $i . "</a>";
                }
            }
        } else {
            // Mostrar un rango de páginas alrededor de la página actual
            for ($i = $paginaActual - 4; $i < $paginaActual + 7; $i++) {
                if ($i <= 0) {
                    $i = 1; // Asegurarse de no mostrar números negativos o cero
                }
                if ($i > $totalpag) {
                    break; // Romper el bucle si el índice supera el total de páginas
                }
                if ($paginaActual == $i) {
                    echo "<a href=?pag_asig=" . $i . " class='seleccionado'>" . $i . "</a>";
                } else {
                    echo "<a href=?pag_asig=" . $i . ">" . $i . "</a>";
                }
            }
            if ($paginaActual + 7 < $totalpag) {
                
            }
        }
        echo "</div>";
        ?>