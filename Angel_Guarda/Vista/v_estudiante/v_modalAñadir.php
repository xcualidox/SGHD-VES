
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
                            <input type="text" id="cedulaEstudiante" name="cedulaEstudiante" placeholder="Cédula del Estudiante" class="formulario-extenso__input" maxlength="12">
                        </div>
                    </div>
                    <div class="formulario-extenso__row">
                        <div class="formulario-extenso__column">
                            <label for="nombres">Estudiante: </label>
                            <input type="input" name="nombres" id="nombres" placeholder="Nombres Estudiante" class="formulario-extenso__input" maxlength="70">
                        </div>
                        <div class="formulario-extenso__column">
                            <label for="apellidos">Estudiante: </label>
                            <input type="input" name="apellidos" id="apellidos" class="formulario-extenso__input" placeholder="Apellidos Estudiante" maxlength="70">
                        </div>
                    </div>
                    <div class="formulario-extenso__row">
                        <div class="formulario-extenso__column">
                            <label for="anoEscolar">Año Escolar: </label>
                            <select name="anoEscolar" id="anoEscolar" class="formulario-extenso__input">
                                <option value=""  disabled selected> ---Selecciona---</option>
                               
 
                            <?php foreach ($anosEscolares as $ano): ?>
                                <option value="<?php echo htmlspecialchars($ano); ?>"><?php echo htmlspecialchars($ano); ?></option>
                            <?php endforeach; ?>
                            </select>
                        </div>
                        <div class="formulario-extenso__column">
                            <label for="anoSeccion">Año Sección: </label>
                            <select name="anoSeccion" id="anoSeccion" class="formulario-extenso__input">
                            <option value=""  disabled selected> ---Selecciona---</option>
                            <?php foreach ($anoSeccion as $seccion): ?>
                                <option value="<?php echo htmlspecialchars($seccion); ?>"><?php echo htmlspecialchars($seccion); ?></option>
                            <?php endforeach; ?>
                            </select>
                        </div>
                    
                    </div>
                </div>

                <!-- Columna Derecha -->
                <div class="w-1/2">
                    <div class="formulario-extenso__row">
                        <div class="formulario-extenso__column">
                            <label for="cedulaRepresentante">Cédula Representante: </label>
                            <input type="text" id="cedulaRepresentante" name="cedulaRepresentante" placeholder="Cédula del Representante" class="formulario-extenso__input" maxlength="9">
                        </div>
                    </div>
                    <div class="formulario-extenso__row">
                        <div class="formulario-extenso__column">
                            <label for="nombresRepresentante"> Representante: </label>
                            <input type="input" name="nombresRepresentante" id="nombresRepresentante" placeholder="Nombres del Representante" class="formulario-extenso__input" maxlength="70">
                        </div>
                        <div class="formulario-extenso__column">
                            <label for="apellidosRepresentante">Representante: </label>
                            <input type="input" name="apellidosRepresentante" id="apellidosRepresentante" class="formulario-extenso__input" placeholder="Apellidos Representante" maxlength="70">
                        </div>
                    </div>
                    <div class="formulario-extenso__row">
                        <div class="formulario-extenso__column">
                            <label for="telefono">Telefono: </label>
                            <input type="input" name="telefono" id="telefono" placeholder="Telefono" class="formulario-extenso__input" maxlength="17">
                        </div>
                        <div class="formulario-extenso__column">
                            <label for="telefonoDomicilio">telefono 2: </label>
                            <input type="input" name="telefonoDomicilio" id="telefonoDomicilio" class="formulario-extenso__input" placeholder="telefono 2:" maxlength="17">
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
                    <input type="text" id="correo" name="correo" placeholder="Correo" class="formulario-extenso__input" maxlength="50">
                </div>
            </div>

            <input type="button" id="guardarBtnEstudiante" value="Guardar" class="table_button w-full" onclick="registrarFormularioEstudiante()">
        </form>

  