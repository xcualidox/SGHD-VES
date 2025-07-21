<?php
session_start();
include_once("../../Control/c_asignatura.php");


if ($_SESSION["sesion"] == "admin" || $_SESSION["sesion"] == "administrador") {
}
 else {
    header("Location: ../../../index.php");
}
$title = 'Asignatura';
include_once('../v_Sidebar/v_Sidebar.php');

?>
<!-- Hereda del Padre Sidebar -->

<script type="text/javascript" src="../../../javascript/horario/mostrarModal.js"></script>
<script type="text/javascript" src="../../../javascript/horario/asignatura.js"></script>

    <div class="main-content">
    <?php
    include_once("../v_Buscar/v_BuscarHeader.php");
    ?>
        
        <div class="table-wrapper min-w-full"> 
            <table class="fl-table">
                <thead>
    				<td align="center">Codigo</td>
    				<td align="center">Nombre</td>
    				<td align="center">Años asociados</td>

                 
                    <td class=''>   
                        <div class="flex justify-center ">
                        
                            <a href="asignaturaPDF.php" target="_blank">
                                <img src="../../../images/icons/pdf.svg" class="w-10  filtro-blanco "  alt="Reporte" title="Reporte" id="boton1" >
                            </a>
                      
                        </div>
                    </td>
    			</thead>
                <tbody>
                <?php
                include_once("../v_paginado/v_paginadoConsulta.php");
                function convertirAnosAsociados($cadenaAnos) {
                    return array_map(
                        'intval',
                            explode(',', $cadenaAnos ?? '')
                    );
                }
                //Variable de la Consulta del Paginado
                for ($i = 0; $i < count($resultado); $i++) {
                ?>
                <tr>
    			    <td class="limitado1"><?php echo $resultado[$i]["codigo"]?></td>
    			    <td class="limitado2"><?php echo $resultado[$i]["nombre"]?></td>
    			    <td class="limitado2"><?php echo $resultado[$i]["anos_asociados"]?></td>
                    <td class="no_style">

                  
             
            </div>
                <div class=" flex justify-center">
                    <img src="../../../images/icons/papelera.svg"  class="w-10  mr-10 filtro-rojo" alt="Borrar" title="Borrar" id="boton1" onclick='Eliminar(`<?php echo $resultado[$i]["codigo"]; ?>`)' >
                    <img src="../../../images/icons/modificar.svg"  class="w-10  filtro-azul " alt="Borrar" title="Modificar" id="boton1"onclick='Modificar(`<?php echo $resultado[$i]["codigo"]; ?>`,`<?php echo $resultado[$i]["nombre"];?>`, <?php echo json_encode(convertirAnosAsociados($resultado[$i]["anos_asociados"]));?>)'>
                </div>
             
                   
                  
                    </td>
                    <?php } ?>
                    </tbody>
            
                </table>
                
                  <!-- Mostrando El total de Paginas -->
        <?php 
        include_once("../v_paginado/v_PaginadoTotal.php");
         ?>
        </div>

 
      
    
                    <div>
                        
            <form id="form" style="display: none;" class="formulario" name="pantalla" class='pantalla' method="POST" action="../../Control/c_asignatura.php">

            <div class=" flex justify-end ">
                <div class="  bg-red-500  w-10  rounded-full ">
                    <img src="../../../images/icons/error.svg" class=" filtro-blanco" alt="Añadir" title="Cerrar" id="boton11" onclick="Mostrar()">
                </div>
            </div>
          

                <label for="cod">Codigo: </label><br>
                <input type="text" id="cod" name="cod" maxlength="10" placeholder="Codigo de asignatura" class="formulario__input uppercase"> 
    
                <label for="nom">Nombre: </label><br>
                <input type="text" id="nom" name="nom" maxlength="100" placeholder="Nombre de asignatura" class="formulario__input">
              
                <br>

                <div class="materia_year__container" id="materiaYearComponent">
        <label for="yearSelect" class="materia_year__label">
            Seleccionar años de la materia
        </label>
        
        <select class="materia_year__select" id="yearSelect">
            <option value=""  selected>-- Selecciona un año --</option>
            <option value="1">1er Año</option>
            <option value="2">2do Año</option>
            <option value="3">3er Año</option>
            <option value="4">4to Año</option>
            <option value="5">5to Año</option>
        </select>
        
        <div class="materia_year__selected-list">
            <span class="materia_year__selected-title">Años seleccionados:</span>
            <div class="materia_year__selected-items" id="selectedYears">
                <span class="materia_year__empty-state">Ningún año seleccionado</span>
            </div>
        </div>
    </div>
    
            <br><br>
                <br><br>

                <input type="hidden" name="ope" id='ope'>
                <input type="hidden" name="origin" id='origin'>
                <input type="button" id="btn3" onclick="Enviar(this.value)" value="Incluir" class="table_button w-full">
               
            </form>

                    </div>
    
    </div>
 <script>
        /**
         * Materia Year Selector Component
         * Self-contained component for selecting academic years
         * 
         * Features:
         * - Prevents duplicate selections
         * - Visual feedback with tags
         * - Easy to remove selections
         * - Stores data in array for form submission
         * - Reset functionality via external button
         */
        
        class MateriaYearSelector {
            constructor(containerId) {
                this.container = document.getElementById(containerId);
                this.selectElement = this.container.querySelector('.materia_year__select');
                this.selectedYears = []; // Array to store selected years
                this.yearLabels = {
                    '1': '1er Año',
                    '2': '2do Año', 
                    '3': '3er Año',
                    '4': '4to Año',
                    '5': '5to Año'
                };
                
                this.init();
            }
            
            init() {
                // Use event delegation for better performance and dynamic elements
                this.container.addEventListener('change', this.handleYearSelection.bind(this));
                this.container.addEventListener('click', this.handleTagRemoval.bind(this));
                
                // Add reset functionality for external button
                this.setupResetButton();
            }
            
            /**
             * Setup reset button functionality
             * Listens for clicks on element with ID 'boton1'
             */
            setupResetButton() {
                // Use document-level event delegation to handle the reset button
                // This ensures the functionality works even if the button is added dynamically
                document.addEventListener('click', (event) => {
                    if (event.target.id === 'boton11') {
                        this.resetSelection();
                    }
                });
            }
            
            handleYearSelection(event) {
                if (event.target.classList.contains('materia_year__select')) {
                    const selectedValue = event.target.value;
                    
                    if (selectedValue && !this.selectedYears.includes(selectedValue)) {
                        this.addYear(selectedValue);
                        event.target.value = ''; // Reset select to default
                    }
                }
            }
            
            handleTagRemoval(event) {
                if (event.target.classList.contains('materia_year__tag-remove')) {
                    const yearValue = event.target.dataset.year;
                    
                    this.removeYear(parseInt(yearValue));
                }
            }
            
            addYear(yearValue) {
                // Add to array
                this.selectedYears.push(yearValue);
                
                // Update visual display
                this.updateDisplay();
                
                // Trigger custom event for external listeners
                this.triggerChangeEvent();
            }
            
            removeYear(yearValue) {
                // Remove from array
                this.selectedYears = this.selectedYears.filter(year => year !== yearValue);
                
                // Update visual display
                this.updateDisplay();
                
                // Trigger custom event for external listeners
                this.triggerChangeEvent();
            }
            
            /**
             * Reset all selections - triggered by external button click
             * Clears array, updates UI, and resets dropdown
             */
            resetSelection() {
                // Clear the internal array
                this.selectedYears = [];
                
                // Reset the dropdown to default state
                this.selectElement.value = '';
                
                // Update visual display to show empty state
                this.updateDisplay();
                
                // Trigger change event to notify external listeners
                this.triggerChangeEvent();
                
                // Optional: Add visual feedback for reset action
                // this.showResetFeedback();
            }
            
            /**
             * Provide visual feedback when reset is triggered
             */
            // showResetFeedback() {
            //     const container = this.container.querySelector('.materia_year__selected-items');
                
            //     // Temporarily show reset feedback
            //     const originalContent = container.innerHTML;
            //     container.innerHTML = '<span class="materia_year__empty-state" style="color: #28a745;">✓ Selección reiniciada</span>';
                
            //     // Restore normal empty state after brief delay
            //     setTimeout(() => {
            //         if (this.selectedYears.length === 0) {
            //             container.innerHTML = '<span class="materia_year__empty-state">Ningún año seleccionado</span>';
            //         }
            //     }, 1500);
            // }
            
            updateDisplay() {
                const container = this.container.querySelector('.materia_year__selected-items');
                
                if (this.selectedYears.length === 0) {
                    container.innerHTML = '<span class="materia_year__empty-state">Ningún año seleccionado</span>';
                } else {
                    const tagsHTML = this.selectedYears
                        .sort((a, b) => parseInt(a) - parseInt(b)) // Sort numerically
                        .map(year => this.createTagHTML(year))
                        .join('');
                    
                    container.innerHTML = tagsHTML;
                }
            }
            
            createTagHTML(yearValue) {
                const yearLabel = this.yearLabels[yearValue];
                return `
                    <span class="materia_year__tag">
                        ${yearLabel}
                        <button type="button" class="materia_year__tag-remove" data-year="${yearValue}" aria-label="Remover ${yearLabel}">
                            ×
                        </button>
                    </span>
                `;
            }
            
            triggerChangeEvent() {
                // Dispatch custom event with current selection
                const event = new CustomEvent('materiaYearChange', {
                    detail: {
                        selectedYears: [...this.selectedYears], // Copy array
                        selectedLabels: this.selectedYears.map(year => this.yearLabels[year]),
                        action: this.selectedYears.length === 0 ? 'reset' : 'update'
                    }
                });
                
                this.container.dispatchEvent(event);
            }
            
            // Public methods for external access
            getSelectedYears() {
                return [...this.selectedYears]; // Return copy of array
            }
            
            getSelectedLabels() {
                return this.selectedYears.map(year => this.yearLabels[year]);
            }
            
            setSelectedYears(years) {
                this.selectedYears = years.filter(year => this.yearLabels[year]); // Validate years
                this.updateDisplay();
                this.triggerChangeEvent();
            }
            
            clearSelection() {
                this.resetSelection(); // Use the enhanced reset method
            }
        }
        
        // Initialize the component
        const materiaYearSelector = new MateriaYearSelector('materiaYearComponent');
        
        // Example: Listen for changes (optional - for integration with forms)
        document.getElementById('materiaYearComponent').addEventListener('materiaYearChange', function(event) {
            console.log('Selected years:', event.detail.selectedYears);
            console.log('Selected labels:', event.detail.selectedLabels);
            console.log('Action:', event.detail.action);
            
            // Example: Update a hidden form field
            // document.getElementById('hiddenYearsField').value = event.detail.selectedYears.join(',');
            
            // Example: Handle reset action specifically
            if (event.detail.action === 'reset') {
                console.log('Selection was reset by external button');
                // Perform any additional reset logic here
            }
        });
        
        // Example usage of public methods:
        // materiaYearSelector.getSelectedYears() - Get current selection
        // materiaYearSelector.setSelectedYears(['1', '3']) - Set selection programmatically
        // materiaYearSelector.clearSelection() - Clear all selections (same as reset)
        
        // Example: Additional reset button functionality (if needed)
        // You can also manually trigger reset from anywhere in your code:
        // materiaYearSelector.resetSelection();
    </script>
</body>


</html>