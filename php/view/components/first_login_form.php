<!-- First login form -->
<form action="php/controller/c_login.php" method="post" id="firstLoginForm" class="p-6 bg-slate-50 max-w-[27rem] w-full rounded shadow-lg hidden flex-col gap-6 relative" autocomplete="off">
    <svg id="closeFirstLoginForm" aria-labelledby="close login" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" stroke-width="1.5" class="w-6 h-6 absolute right-6 stroke-black hover:cursor-pointer hover:stroke-red-600 transition-colors duration-300">
        <path stroke-linecap="round" stroke-linejoin="round" d="M6 18 18 6M6 6l12 12" />
    </svg>
    <h2 class="text-2xl font-bold text-gray-900" id="firstLoginFormTitle"></h2>

    <!-- Security questions -->
    <div class="hidden space-y-2" data-first-login-security-q>
        <label for="firstLogin_q_1" class="block font-medium mb-2 text-lg text-gray-900">Pregunta de seguridad 1</label>
        <select data-first-login-security-q-value name="firstLogin_q_1" id="firstLogin_q_1" class="security-question bg-gray-50 border border-gray-300 text-gray-900 rounded-lg block w-full p-2 mb-4 focus:ring-blue-500 focus:border-blue-500 outline-none" data-security-select>
            <option value="" disabled selected hidden>Seleccione una pregunta</option>
            <option value="pet" data-security-q-option>¿Cuál es el nombre de tu primera mascota?</option>
            <option value="school" data-security-q-option>¿Cuál es el nombre de tu escuela primaria?</option>
            <option value="city" data-security-q-option>¿En qué ciudad naciste?</option>
            <option value="friend" data-security-q-option>¿Cuál es el nombre de tu mejor amigo de la infancia?</option>
        </select>
        <input data-first-login-security-q-value type="text" name="firstLogin_a_1" class="bg-gray-50 border border-gray-300 text-gray-900 rounded-lg block w-full p-2 focus:ring-blue-500 focus:border-blue-500 outline-none" placeholder="Respuesta de seguridad" data-text-input maxlength="36">
    </div>
    <div class="hidden space-y-2" data-first-login-security-q>
        <label for="firstLogin_q_2" class="block font-medium mb-2 text-lg text-gray-900">Pregunta de seguridad 2</label>
        <select data-first-login-security-q-value name="firstLogin_q_2" id="firstLogin_q_2" class="security-question bg-gray-50 border border-gray-300 text-gray-900 rounded-lg block w-full p-2 mb-4 focus:ring-blue-500 focus:border-blue-500 outline-none" data-security-select>
            <option value="" disabled selected hidden>Seleccione una pregunta</option>
            <option value="pet" data-security-q-option>¿Cuál es el nombre de tu primera mascota?</option>
            <option value="school" data-security-q-option>¿Cuál es el nombre de tu escuela primaria?</option>
            <option value="city" data-security-q-option>¿En qué ciudad naciste?</option>
            <option value="friend" data-security-q-option>¿Cuál es el nombre de tu mejor amigo de la infancia?</option>
        </select>
        <input data-first-login-security-q-value type="text" name="firstLogin_a_2" class="bg-gray-50 border border-gray-300 text-gray-900 rounded-lg block w-full p-2 focus:ring-blue-500 focus:border-blue-500 outline-none" placeholder="Respuesta de seguridad" data-text-input maxlength="36">
    </div>
    <div class="hidden space-y-2" data-first-login-security-q>
        <label for="firstLogin_q_3" class="block font-medium mb-2 text-lg text-gray-900">Pregunta de seguridad 3</label>
        <select data-first-login-security-q-value name="firstLogin_q_3" id="firstLogin_q_3" class="security-question bg-gray-50 border border-gray-300 text-gray-900 rounded-lg block w-full p-2 mb-4 focus:ring-blue-500 focus:border-blue-500 outline-none" data-security-select>
            <option value="" disabled selected hidden>Seleccione una pregunta</option>
            <option value="pet" data-security-q-option>¿Cuál es el nombre de tu primera mascota?</option>
            <option value="school" data-security-q-option>¿Cuál es el nombre de tu escuela primaria?</option>
            <option value="city" data-security-q-option>¿En qué ciudad naciste?</option>
            <option value="friend" data-security-q-option>¿Cuál es el nombre de tu mejor amigo de la infancia?</option>
        </select>
        <input data-first-login-security-q-value type="text" name="firstLogin_a_3" class="bg-gray-50 border border-gray-300 text-gray-900 rounded-lg block w-full p-2 focus:ring-blue-500 focus:border-blue-500 outline-none" placeholder="Respuesta de seguridad" data-text-input maxlength="36">
    </div>
    <!-- set password -->
    <div class="hidden" data-first-login-pw>
        <label for="firstPw" class="block font-medium mb-2 text-lg text-gray-900">Ingrese su nueva contraseña</label>
        <input maxlength="36" type="password" id="firstPw" name="firstPw" class="bg-gray-50 border border-gray-300 text-gray-900 rounded-lg block w-full p-2 focus:ring-blue-500 focus:border-blue-500 outline-none" placeholder="••••••••••••••" maxlength="36">
    </div>
    <!-- password strength -->
    <?php
    include("pw_strength.php");
    ?>
    <div class="hidden" data-first-login-pw>
        <label for="firstPwConfirm" class="block font-medium mb-2 text-lg text-gray-900">Confirme su nueva contraseña</label>
        <input maxlength="36" type="password" id="firstPwConfirm" name="firstPwConfirm" class="bg-gray-50 border border-gray-300 text-gray-900 rounded-lg block w-full p-2 focus:ring-blue-500 focus:border-blue-500 outline-none" placeholder="••••••••••••••" maxlength="36">
    </div>
    <!-- invalid security q-a msg -->
    <div class="items-center gap-2 text-red-800 hidden" id="errorMsgFirstSQ">
        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
            <path stroke-linecap="round" stroke-linejoin="round" d="M12 9v3.75m-9.303 3.376c-.866 1.5.217 3.374 1.948 3.374h14.71c1.73 0 2.813-1.874 1.948-3.374L13.949 3.378c-.866-1.5-3.032-1.5-3.898 0L2.697 16.126ZM12 15.75h.007v.008H12v-.008Z" />
        </svg>
        <span data-msg></span>
    </div>
    <!-- invalid password  msg -->
    <div class="items-center gap-2 text-red-800 hidden" id="errorMsgFirstPw">
        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
            <path stroke-linecap="round" stroke-linejoin="round" d="M12 9v3.75m-9.303 3.376c-.866 1.5.217 3.374 1.948 3.374h14.71c1.73 0 2.813-1.874 1.948-3.374L13.949 3.378c-.866-1.5-3.032-1.5-3.898 0L2.697 16.126ZM12 15.75h.007v.008H12v-.008Z" />
        </svg>
        <span data-msg></span>
    </div>
    <!-- username -->
    <input type="hidden" name="username" id="firstLoginUsername">
    <!-- operation type -->
    <input type="hidden" name="op" id="opFirstLogin" value="firstLogin">
    <!-- next and back button -->
    <button id="firstLoginNextBackBtn" class="w-full text-white bg-blue-500 hover:bg-blue-800 font-medium rounded-lg text-lg px-5 mt-6 py-2.5 text-center focus:ring-4 focus:outline-none focus:ring-blue-300 transition-colors duration-300" data-operation></button>
    <!-- save button -->
    <button id="firstLoginBtn" class="w-full hidden text-white bg-blue-500 hover:bg-blue-800 font-medium rounded-lg text-lg px-5 mt-4 py-2.5 text-center focus:ring-4 focus:outline-none focus:ring-blue-300 transition-colors duration-300" data-operation>Establecer datos</button>
</form>