<summary>Registrar Pago</summary>
            <div class="content__details">


                <form id="" class="space-y-4" method="POST" action="#">
                    <!-- Contenedor principal con flex para dividir izquierda y derecha -->
                    <div class="flex space-x-8">
                        <!-- Columna Izquierda -->
                        <div class=" w-full">
                            <div class="formulario-extenso__row">
                                <div class="formulario-extenso__column">
                                    <label for="anoEscolar">Año Escolar: </label>
                                    <select name="" id="" class="formulario-extenso__input">
                                        <option value="">Año Escolar 1</option>
                                        <option value="">Año Escolar 2</option>
                                    </select>
                                </div>
                                <div class="formulario-extenso__column">
                                    <label for="mesPagar">Meses a Pagar: </label>
                                    <input type="text" id="mesPagar" name="mesPagar" placeholder="Meses a pagar" class="formulario-extenso__input" maxlength="25">
                                </div>
                            </div>

                            <div class="formulario-extenso__row">
                                <div class="formulario-extenso__column">

                                    <label for="Pago">Descuento: </label>
                                    <div class="flex">
                                        <div class="custom-radio">
                                            <input type="radio" id="ninguno" value="0" name="descuento">
                                            <label for="total">Total</label>
                                        </div>
                                        <div class="custom-radio">
                                            <input type="radio" id="descuento-10" value="10%" name="descuento">
                                            <label for="descuento-10">10%</label>
                                        </div>

                                        <div class="custom-radio">
                                            <input type="radio" id="descuento-20" value="20%" name="descuento">
                                            <label for="descuento-20">20%</label>
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
                            </div>
                            <div class="formulario-extenso__row">
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
                                <div class="formulario-extenso__column">

                                    <label for="referencia">Numero de Referencia: </label>
                                    <input type="text" id="referencia" name="referencia" placeholder="Referencia" class="formulario-extenso__input" maxlength="">

                                </div>
                            </div>
                            <div class="formulario-extenso__row">

                                <div class="formulario-extenso__column">

                                    <label for="monto">Monto a Pagar: </label>
                                    <input type="text" id="mesPagar" name="mesPagar" placeholder="Monto a Pagar" class="formulario-extenso__input" maxlength="">

                                </div>
                                <div class="formulario-extenso__column">

                                    <label for="monto">Descuento: </label>
                                    <input type="text" id="mesPagar" name="mesPagar" disabled placeholder="Descuento" class="formulario-extenso__input" maxlength="">

                                </div>
                            </div>
                            <div class="formulario-extenso__row">

                                <div class="formulario-extenso__column">

                                    <label for="monto">Monto Total: </label>
                                    <input type="text" id="mesPagar" name="mesPagar" placeholder="Monto a Pagar" class="formulario-extenso__input" maxlength="">

                                </div>

                            </div>
                        </div>

                        <!-- Columna Derecha -->



                    </div>


                    <input type="button" id="" value="Guardar" class="table_button w-full">
                </form>
            </div>