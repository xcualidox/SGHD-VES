<div class="flex flex-col sm:flex-row   justify-end items-center md:space-x-2 p-4 md:py-2">
        <h1 class="text-xl font-semibold mb-2 md:mb-0"><?php echo $title; ?></h1>

        <!-- Este DIV es para ocultar la tabla -->
        <div class="boton2" style="display: none;" id="boton2"></div>
        <div class="  bg-gray-100 rounded-full ">
            <img src="../../../images/icons/añadir.svg" class="w-10 filtro-verde" alt="Añadir" title="Añadir" id="boton1" onclick="Mostrar()">
        </div>
    
        <!-- <select name="selectListar" id="selectListar" class="border rounded px-2 py-1 w-auto">
            <option value="">Todos</option>
  
            <option value="0">Prueba</option>
        </select>
        <input type="text" id="listar" name="listar" placeholder="Buscar..." class="border rounded px-2 py-1 mb-2 md:mb-0">
        <!-- <button class="table_button">Buscar</button> -->
         
        <!-- <div class="  bg-gray-100 rounded-full ">
            <img src="../../../images/icons/buscar.svg" class="w-10 filtro-verde" alt="Buscar" title="Buscar" id="boton1" onclick="Mostrar()">
        </div> 
        -->
    </div>