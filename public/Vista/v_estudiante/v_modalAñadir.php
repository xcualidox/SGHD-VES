<?php


?>

<div class="flex justify-end items-end">
    <!-- Botón de Cerrar en la parte superior derecha -->
    <div class="w-10 bg-red-500 rounded-full cursor-pointer p-2" id="closeModalAñadir">
        <img src="../../../images/icons/error.svg" class="filtro-blanco" alt="Cerrar" title="Cerrar">
    </div>
</div>
<!-- Contenido del Modal -->
<h2 class="text-xl font-semibold mb-4">Registro Estudiante</h2>

<form id="formRegistroEstudiante" class="space-y-4" method="POST" action="#">
    <!-- Contenedor principal con flex para dividir izquierda y derecha -->
    <div class="flex space-x-8">
        <!-- Columna Izquierda -->
        <div class="w-1/2">
            <div class="formulario-extenso__row">
                <div class="formulario-extenso__column">
                    <label for="cedulaEstudiante">Cédula Estudiante: </label>
                    <input type="number" id="cedulaEstudiante" name="cedulaEstudiante" autocomplete="off" placeholder="Cédula del Estudiante" class="numeroMax formulario-extenso__input" maxlength="12">

                </div>

            </div>
            <div class="formulario-extenso__row">
                <div class="formulario-extenso__column">
                    <label for="nombres">Nombres Estudiante: </label>
                    <input type="input" name="nombres" id="nombres" placeholder="Nombres Estudiante" autocomplete="off" class="formulario-extenso__input" maxlength="70">
                </div>
                <div class="formulario-extenso__column">
                    <label for="apellidos">Apellidos Estudiante: </label>
                    <input type="input" name="apellidos" id="apellidos" class="formulario-extenso__input" autocomplete="off" placeholder="Apellidos Estudiante" maxlength="70">
                </div>
            </div>
            <div class="formulario-extenso__row">
                <div class="formulario-extenso__column">
                    <label for="anoEscolar">Año Escolar: </label>
                    <select name="anoEscolar" id="anoEscolar" class="formulario-extenso__input">
                        <option value="" disabled>---Selecciona---</option>
                        <?php foreach ($anosEscolares as $ano): ?>
                            <option value="<?php echo htmlspecialchars($ano); ?>">
                                <?php echo htmlspecialchars($ano); ?>
                            </option>
                        <?php endforeach; ?>
                    </select>
                </div>
                <div class="formulario-extenso__column">
                    <label for="anoSeccion">Año Sección: </label>
                    <select name="anoSeccion" id="anoSeccion" class="formulario-extenso__input">
                        <option value="" disabled>---Selecciona---</option>
                        <?php foreach ($anoSeccion as $seccion): ?>
                            <option value="<?php echo htmlspecialchars($seccion); ?>">
                                <?php echo htmlspecialchars($seccion); ?>
                            </option>
                        <?php endforeach; ?>
                    </select>
                </div>

            </div>
        </div>

        <!-- Columna Derecha -->
        <div class="w-1/2 ">
            <div class="formulario-extenso__row ">
                <div class="formulario-extenso__column">
                    <label for="cedulaRepresentante">Cédula Representante: </label>
                    <input type="text" id="cedulaRepresentante" name="cedulaRepresentante" autocomplete="off" placeholder="Cédula del Representante" class="numeroMax formulario-extenso__input" maxlength="9">
                </div>
                <div class=" flex justify-center items-center   mt-0 md:mt-3 ">
                    <label class="flex  justify-center items-center mostrarRadiosRepresentantes">
                        <input type="radio" name="representante" id="nuevoRepresentante" value="Nuevo" class="hidden">
                        <img src='../../../images/icons/checkRadius.svg' class='w-8 h-8 filtro-verde cursor-pointer' alt='Nuevo' title='Nuevo'>
                        Nuevo
                    </label>
                    <label class="flex  justify-center items-center  mostrarRadiosRepresentantes">
                        <input type="radio" name="representante" id="existenteRepresentante" value="Existente" class="hidden">
                        <img src='../../../images/icons/noCheckRadius.svg' class='w-8 h-8 filtro-verde cursor-pointer' alt='Existente' title='Existente'>
                        Existe
                    </label>
                        <?php 

                       
                        if ($_SESSION["sesion"] == "admin") {
                            $borrarBotonRepresentanteForm = " <img src='../../../images/icons/papelera.svg' id='borrarRepresentante' class='w-8 h-8 filtro-rojo cursor-pointer  hidden' alt='Borrar' title='Borrar'>";
                            $botonModificarRepresentanteForm=" <img src='../../../images/icons/modificar.svg' id='modificarRepresentanteForm' class='w-8 h-8 filtro-verde cursor-pointer   hidden' alt='Modificar' title='Modificar'>";
                      
                        
                        } 
                        else{
                            //Establezco los id en hidden ya que si no lo hago asi el JS no funciona
                            $borrarBotonRepresentanteForm= " <input type='hidden' id='borrarRepresentante'>";
                            $botonModificarRepresentanteForm="  <input type='hidden' id='modificarRepresentanteForm'>";
                        }
                        echo $borrarBotonRepresentanteForm;
                        echo $botonModificarRepresentanteForm;
                        ?>

                  
         
                    <img src='../../../images/icons/return.svg' id="volverModificacionRepresentante" class='w-8 h-8 filtro-azul cursor-pointer  modificacionRepresentante hidden' alt='Volver' title='Volver'>
                    <!-- <img src='../../../images/icons/eraser.svg' id="limpiarRepresentante" class='w-8 h-8 filtro-azul cursor-pointer   ' alt='limpiarRepresentante' title='limpiarRepresentante'> -->
                </div>
            </div>
            <div class="formulario-extenso__row">
                <div class="formulario-extenso__column">
                    <label for="nombresRepresentante"> Nombre Representante: </label>
                    <input type="input" name="nombresRepresentante" id="nombresRepresentante" autocomplete="off" placeholder="Nombres del Representante" class="formulario-extenso__input" maxlength="70">
                </div>
                <div class="formulario-extenso__column">
                    <label for="apellidosRepresentante">Apellido Representante: </label>
                    <input type="input" name="apellidosRepresentante" id="apellidosRepresentante" autocomplete="off" class="formulario-extenso__input" placeholder="Apellidos Representante" maxlength="70">
                </div>
            </div>
            <div class="formulario-extenso__row">
                <div class="formulario-extenso__column">
                    <label for="telefono">Telefono: </label>
                    <input type="number" name="telefono" id="telefono" placeholder="Telefono" autocomplete="off" class="numeroMax formulario-extenso__input" maxlength="17">
                </div>
                <div class="formulario-extenso__column">
                    <label for="telefonoDomicilio">telefono 2: </label>
                    <input type="number" name="telefonoDomicilio" id="telefonoDomicilio" autocomplete="off" class="numeroMax formulario-extenso__input" placeholder="telefono 2:" maxlength="17">
                </div>
            </div>
        </div>


    </div>
    <div class="formulario-extenso__row">
        <div class="formulario-extenso__column">
            <label for="direccion">Dirección: </label>
            <input type="text" id="direccion" name="direccion" placeholder="Direccion del Estudiante" class="formulario-extenso__input" maxlength="255">
        </div>
        <div class="formulario-extenso__column">
            <label for="correo">Correo: </label>
            <input type="text" id="correo" name="correo" placeholder="Correo" autocomplete="off" class="formulario-extenso__input" maxlength="50">
        </div>
    </div>

    <input type="hidden" id="cedulaEstudianteActual" value="">

    <input type="button" id="guardarBtnEstudiante" value="Guardar" class="table_button w-full" onclick="registrarFormularioEstudiante()">
</form>