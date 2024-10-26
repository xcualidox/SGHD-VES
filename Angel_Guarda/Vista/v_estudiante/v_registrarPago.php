<summary>Registrar Pago</summary>
<div class="content__details">


    <form id="" class="space-y-4" method="POST" action="#">
        <!-- Contenedor principal con flex para dividir izquierda y derecha -->

        <div class="flex space-x-8">
            <!-- Columna Izquierda -->

            <div class=" w-full">
                <div class="formulario-extenso__row">
                    <div class="formulario-extenso__column">
                        <label for="AnoEscolarPago">Año Escolar: </label>
                        <select name="AnoEscolarPago" id="AnoEscolarPago" class="formulario-extenso__input">
                            <option value="" disabled selected> ---Selecciona---</option>
                            <?php foreach ($anosEscolares as $ano): ?>
                                <option value="<?php echo htmlspecialchars($ano); ?>"><?php echo htmlspecialchars($ano); ?></option>
                            <?php endforeach; ?>
                        </select>
                    </div>

                </div>
                <div class="formulario-extenso__row">
                    <div class="formulario-extenso__column">
                        <label for="mes">Mes:</label>
                        <select id="mes" class="formulario-extenso__input">
                            <option value="" disabled selected>---Selecciona Mes---</option>
                            <option value="Enero">Enero</option>
                            <option value="Febrero">Febrero</option>
                            <option value="Marzo">Marzo</option>
                            <option value="Abril">Abril</option>
                            <option value="Mayo">Mayo</option>
                            <option value="Junio">Junio</option>
                            <option value="Julio">Julio</option>
                            <option value="Agosto">Agosto</option>
                            <option value="Septiembre">Septiembre</option>
                            <option value="Octubre">Octubre</option>
                            <option value="Noviembre">Noviembre</option>
                            <!-- Agrega el resto de los meses -->
                        </select>
                    </div>
                    <div class="formulario-extenso__column">
                        <label for="mesesSeleccionados">Meses a Pagar:</label>
                      
                        <div id="mesesSeleccionados" class="SelectMesesPagar" ></div>
                  
                    </div>
                </div>






                <div class="formulario-extenso__row">
                    <div class="formulario-extenso__column">

                        <label for="Pago">Descuento: </label>
                        <div class="flex">
                            <div class="custom-radio">
                                <input type="radio" id="total" value="0" name="descuento">
                                <label for="total">Total</label>
                            </div>


                            <div class="custom-radio">
                                <input type="radio" id="descuento-50" value="50%" name="descuento">
                                <label for="descuento-50">50%</label>
                            </div>

                            <div class="custom-radio">
                                <input type="radio" id="descuento-becado" value="Becado" name="descuento">
                                <label for="descuento-becado">Becado</label>
                            </div>
                        </div>
                    </div>
                    <div class="formulario-extenso__column">
                        <label for="Pago">Forma de Pago: </label>
                        <div class="flex">
                            <div class="custom-radio">
                                <input type="radio" id="divisas" value="divisas" name="FormaPago">
                                <label for="divisas">Divisas</label>
                            </div>
                            <div class="custom-radio">
                                <input type="radio" id="transferencia" value="transferencia" name="FormaPago">
                                <label for="transferencia">Transferencia</label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="formulario-extenso__row">


                </div>

                <div class="formulario-extenso__row">

                    <div class="formulario-extenso__column">



                        <label for="monto">Monto Total: </label>
                        <input type="text" id="mesPagar" name="mesPagar" disabled placeholder="Monto a Pagar" class="formulario-extenso__input" maxlength="">



                    </div>
                    <div class="formulario-extenso__column">


                        <label for="mesDescuento">Descuento: </label>
                        <input type="text" id="mesDescuento" name="mesDescuento" disabled placeholder="Descuento" class="formulario-extenso__input" maxlength="">

                    </div>
                </div>

                <div class="formulario-extenso__row">

                    <div class="formulario-extenso__column">

                        <label for="mesAbonar">Monto a Abonar: </label>
                        <input type="text" id="mesAbonar" name="mesAbonar" placeholder="Monto a Abonar" class="formulario-extenso__input" maxlength="">

                    </div>
                    <div class="formulario-extenso__column">

                        <label for="referencia">Numero de Referencia: </label>
                        <input type="text" id="referencia" name="referencia" placeholder="Referencia" class="formulario-extenso__input" maxlength="">

                    </div>



                </div>
                <div class="formulario-extenso__row">

                    <div class="formulario-extenso__column">

                        <label for="notaPago">Nota de Pago: </label>
                        <input type="text" id="notaPago" name="notaPago" placeholder="Nota de Pago" class="formulario-extenso__input" maxlength="">

                    </div>

                </div>
            </div>

            <!-- Columna Derecha -->

        </div>

        <input type="button" id="" value="Guardar" class="table_button w-full">
    </form>
</div>