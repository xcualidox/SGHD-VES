<summary>Registrar Pago</summary>
<div class="content__details">


    <form id="registrarPagoForm" class="space-y-4" method="POST" action="#">
        <!-- Contenedor principal con flex para dividir izquierda y derecha -->

        <div class="flex space-x-8">
            <!-- Columna Izquierda -->

            <div class=" w-full">
                <div class="formulario-extenso__row">
                    <div class="formulario-extenso__column">
                        <label for="AnoEscolarPago">Año Escolar: </label>
                        <select name="AnoEscolarPago" id="AnoEscolarPago" class="formulario-extenso__input">
              
                             
                   
                        </select>
                    </div>

                </div>
                <div class="formulario-extenso__row">
                    <div class="formulario-extenso__column">

                        <label for="Pago">Descuento: </label>
                        <div class="flex">
                            <div class="custom-radio">
                                <input type="radio" id="ninguno" value="1" name="descuento" checked onchange="verificarSeleccionado()">
                                <label for="ninguno">Ninguno</label>
                            </div>
                            <div class="custom-radio">
                                <input type="radio" id="descuento" value="0.90" name="descuento" onchange="verificarSeleccionado()">
                                <label for="descuento-10">10%</label>
                            </div>
                            <div class="custom-radio">
                                <input type="radio" id="descuento" value="0.80" name="descuento" onchange="verificarSeleccionado()">
                                <label for="descuento-20">20%</label>
                            </div>
                            <div class="custom-radio">
                                <input type="radio" id="descuento" value="0.5" name="descuento" onchange="verificarSeleccionado()">
                                <label for="descuento-50">50%</label>
                            </div>

                            <div class="custom-radio">
                                <input type="radio" id="descuento-becado" value="0" name="descuento" onchange="verificarSeleccionado()">
                                <label for="descuento-becado">Becado</label>
                            </div>
                        </div>
                    </div>
                    <div class="formulario-extenso__column">
                        <label for="Pago">Forma de Pago: </label>
                        <div class="flex">
                            <div class="custom-radio">
                                <input type="radio" id="divisas" value="dolar" name="FormaPago" onchange="verificarSeleccionado()">
                                <label for="divisas">Divisas ($)</label>
                            </div>
                            <div class="custom-radio">
                                <input type="radio" id="transferencia" value="bolivar" name="FormaPago" onchange="verificarSeleccionado()">
                                <label for="transferencia"> Transferencia (BS)</label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="hidden" id="mostrarDivPagos">
                <div class="formulario-extenso__row">
                    <div class="formulario-extenso__column">
                        <label for="mes">Mes:</label>
                        <select id="mes" class="formulario-extenso__input">
                            <option value="" disabled selected>---Selecciona Mes---</option>
                          
                            <!-- Agrega el resto de los meses -->
                        </select>
                    </div>
                    <div class="formulario-extenso__column">
              
                            <label for="monto" >Monto en $: <span id="mesPagar" name="mesPagar"  class=" text-black">0.0</span></label>
                        <label for="mesPagarBolivar">Monto en Bs:  <span id="mesPagarBolivar" name="mesPagarBolivar" class=" text-black">0.00</span></label></label>

                        <div id="mesesSeleccionados" class="SelectMesesPagar"></div>

                    </div>
                </div>


              
       

                <div class="formulario-extenso__row">

                    <div class="formulario-extenso__column">

                        <label for="mesAbonar">Monto a Abonar: </label>
                        <input type="number" id="mesAbonar" name="mesAbonar" placeholder="Monto a Abonar" class="numeroMax formulario-extenso__input" maxlength="50" oninput="abonadoMes()" >

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
                <input type="hidden" id="valorPagoEnviar"  >
                <input type="button" id="guardarRegistroPago" onclick="enviarPago()" disabled value="Guardar" class="table_button w-full">
                </div>

            </div>


            <!-- Columna Derecha -->

        </div>

       
    </form>
</div>