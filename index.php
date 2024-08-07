<!DOCTYPE html>
<html lang="en" class="scroll-smooth">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SGHD-VES</title>
    <link rel="stylesheet" href="styles/main.css">
</head>
<body class="  h-screen bg-slate-50 relative">
    <header class="w-full shadow-2xl z-0">
        <div class="container grid grid-cols-3 justify-center mx-auto w-full items-center">
            <div class="flex items-center max-h-32 mr-auto">
                <img src="images/LogoBordeWhite.png" class="max-h-32" alt="logo">
                <h1 class="text-xl font-bold">U.E.C Vicente Emilio Sojo</h1>
            </div>
            <nav class="flex gap-4 items-center flex-1 justify-center text-lg">
                
                <a href="#nosotros" class="hover:text-gray-400 transition-colors duration-300">Nosotros</a>
                <a href="#footer" class="hover:text-gray-400 transition-colors duration-300">Contacto</a>
            </nav> 
            <div class="ml-auto h-fit flex items-center gap-2 group hover:cursor-pointer text-lg" id="openLogin">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" class="group-hover:fill-gray-400 fill-black transition-colors duration-300" ><path d="m13 16 5-4-5-4v3H4v2h9z"></path><path d="M20 3h-9c-1.103 0-2 .897-2 2v4h2V5h9v14h-9v-4H9v4c0 1.103.897 2 2 2h9c1.103 0 2-.897 2-2V5c0-1.103-.897-2-2-2z"></path></svg>
                <span class="group-hover:text-gray-400 transition-colors duration-300">Acceder</span>
            </div>

        </div>
    </header>
    <?php if (isset($_GET["result"]) && $_GET["result"] == "ok"):?>
    <div id="opOkMsg" class="z-100   shadow-lg absolute top-0 w-[50%] left-1/2 -translate-x-1/2 p-6 bg-teal-100 rounded-b text-teal-900 px-4 py-3 border-t-4 border-teal-500">
        <div class="flex">
            <div class="py-1"><svg class="fill-current h-6 w-6 text-teal-500 mr-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><path d="M2.93 17.07A10 10 0 1 1 17.07 2.93 10 10 0 0 1 2.93 17.07zm12.73-1.41A8 8 0 1 0 4.34 4.34a8 8 0 0 0 11.32 11.32zM9 11V9h2v6H9v-4zm0-6h2v2H9V5z"/></svg></div>
            <div>
              <p class="font-bold">Operación exitosa</p>
              <p class="text-sm">Su contraseña fue actualizada</p>
            </div>
          </div>
    </div>
    <?php elseif (isset($_GET["result"]) && $_GET["result"] == "error"): ?>
    <div id="opErrorMsg" class="z-100  shadow-lg absolute top-0 w-[50%] left-1/2 -translate-x-1/2 p-6 bg-red-100 rounded-b text-red-900 px-4 py-3 border-t-4 border-red-500">
        <div class="flex">
            <div class="py-1"><svg class="fill-current h-6 w-6 text-red-500 mr-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><path d="M2.93 17.07A10 10 0 1 1 17.07 2.93 10 10 0 0 1 2.93 17.07zm12.73-1.41A8 8 0 1 0 4.34 4.34a8 8 0 0 0 11.32 11.32zM9 11V9h2v6H9v-4zm0-6h2v2H9V5z"/></svg></div>
            <div>
              <p class="font-bold">Operación fallida</p>
              <p class="text-sm">Hubo un error al momento de realizar la operación</p>
            </div>
          </div>
    </div>
    <?php endif;?>
    <main class="flex flex-col flex-1">
        <!-- Login Section -->
        <section id="loginModal" class="fixed left-0 top-0 bg-black w-screen h-screen z-50 bg-opacity-50  items-center justify-center opacity-0 hidden transition-opacity duration-500 ">
            <form action="php/controller/c_login.php" id="loginForm" method="post" class="p-6 bg-slate-50 max-w-[27rem] w-full rounded shadow-lg space-y-6 relative  " autocomplete="off">
                <span class="animate-exit"></span>
                <svg id="closeLogin" aria-labelledby="close login" xmlns="http://www.w3.org/2000/svg"  viewBox="0 0 24 24" stroke-width="1.5"  class="w-6 h-6 absolute right-6 stroke-black hover:cursor-pointer hover:stroke-red-600 transition-colors duration-300 " >
                    <path stroke-linecap="round" stroke-linejoin="round" d="M6 18 18 6M6 6l12 12" />
                  </svg>
                  
                <h2 class="text-2xl font-bold text-gray-900">Iniciar sesión</h2>
                <div>
                    <label for="username" class="block font-medium mb-2 text-lg text-gray-900">Usuario</label>
                    <input type="text" data-numeric-input data-username name="username" id="username" class="bg-gray-50 border border-gray-300 text-gray-900 rounded-lg block w-full p-2 focus:ring-blue-500 focus:border-blue-500 outline-none" placeholder="Cedúla de Identidad">
                </div>
                <div>
                    <label for="password" class="block font-medium mb-2 text-lg text-gray-900">Contraseña</label>
                    <input maxlength="36" type="password" name="password" id="password" class="bg-gray-50 border border-gray-300 text-gray-900 rounded-lg block w-full p-2 focus:ring-blue-500 focus:border-blue-500 outline-none" placeholder="••••••••••••••">
                </div>
                <input type="hidden" name="op" id="opLogin">
                <div class="items-center gap-2 text-red-800 hidden" id="errorMsg">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M12 9v3.75m-9.303 3.376c-.866 1.5.217 3.374 1.948 3.374h14.71c1.73 0 2.813-1.874 1.948-3.374L13.949 3.378c-.866-1.5-3.032-1.5-3.898 0L2.697 16.126ZM12 15.75h.007v.008H12v-.008Z" />
                      </svg>
                      <span data-msg></span>
                </div>
                <a  class="font-medium text-lg cursor-pointer text-blue-500 hover:text-blue-800 transition-colors duration-300 w-full text-center block" id="forgotPwTrigger">¿Olvido su contraseña?</a>
                <button id="loginBtn" class="w-full text-white bg-blue-500 hover:bg-blue-800 font-medium rounded-lg text-lg px-5 py-2.5 text-center focus:ring-4 focus:outline-none focus:ring-blue-300 transition-colors duration-300">Acceder</button>
            </form>
            <!-- Password recovery form -->
            <form action="php/controller/c_login.php" method="post" id="pwRecoveryForm" class="p-6 bg-slate-50 max-w-[27rem]  w-full rounded shadow-lg hidden flex-col gap-6 relative " autocomplete="off">
                <span class="animate-entranceCenter"></span>
                <span class="animate-entrance"></span>
                <svg id="closeLoginRecovery" aria-labelledby="close login" xmlns="http://www.w3.org/2000/svg"  viewBox="0 0 24 24" stroke-width="1.5"  class="w-6 h-6 absolute right-6 stroke-black hover:cursor-pointer hover:stroke-red-600 transition-colors duration-300 " >
                    <path stroke-linecap="round" stroke-linejoin="round" d="M6 18 18 6M6 6l12 12" />
                  </svg>
                  <h2 class="text-2xl font-bold text-gray-900" id="recoveryFormTitle"></h2>
                <!-- Username look up -->
                <div>
                    <label for="username" class="block font-medium mb-2 text-lg text-gray-900">Usuario</label>
                    <input type="text" data-username name="username" id="usernameRecovery" class="bg-gray-50 border border-gray-300 text-gray-900 rounded-lg block w-full p-2 focus:ring-blue-500 focus:border-blue-500 outline-none" placeholder="Cedúla de Identidad" data-numeric-input>
                </div>
                <!-- Security questions -->
                <div class="hidden">
                    <label for="security_a_1" class="block font-medium mb-2 text-lg text-gray-900" data-security-question></label>
                    <input maxlength="36" type="text" name="security_a_1"  class="bg-gray-50 border border-gray-300 text-gray-900 rounded-lg block w-full p-2 focus:ring-blue-500 focus:border-blue-500 outline-none" placeholder="Respuesta de seguridad" data-text-input>
                </div>
                <div class="hidden">
                    <label for="security_a_2" class="block font-medium mb-2 text-lg text-gray-900" data-security-question></label>
                    <input maxlength="36" type="text" name="security_a_2"  class="bg-gray-50 border border-gray-300 text-gray-900 rounded-lg block w-full p-2 focus:ring-blue-500 focus:border-blue-500 outline-none" placeholder="Respuesta de seguridad" data-text-input>
                </div>
                <div class="hidden">
                    <label for="security_a_3" class="block font-medium mb-2 text-lg text-gray-900" data-security-question></label>
                    <input maxlength="36" type="text" name="security_a_3"  class="bg-gray-50 border border-gray-300 text-gray-900 rounded-lg block w-full p-2 focus:ring-blue-500 focus:border-blue-500 outline-none" placeholder="Respuesta de seguridad" data-text-input>
                </div>
                <!-- Change password -->
                <div class="hidden">
                    <label for="newPw" class="block font-medium mb-2 text-lg text-gray-900">Ingrese su nueva contraseña</label>
                    <input maxlength="36" type="password" id="newPw" name="newPw"  class="bg-gray-50 border border-gray-300 text-gray-900 rounded-lg block w-full p-2 focus:ring-blue-500 focus:border-blue-500 outline-none" placeholder="••••••••••••••">
                </div>
                <!-- password strength -->
                <?php
                include("php/view/components/pw_strength.php");
                ?>
                <div class="hidden">
                    <label for="newPwConfirm" class="block font-medium mb-2 text-lg text-gray-900">Confirme su nueva contraseña</label>
                    <input maxlength="36" type="password" id="newPwConfirm" name="newPwConfirm"  class="bg-gray-50 border border-gray-300 text-gray-900 rounded-lg block w-full p-2 focus:ring-blue-500 focus:border-blue-500 outline-none" placeholder="••••••••••••••">
                </div>
                <!-- operation type -->
                <input type="hidden" name="op" id="opLoginRecovery">
                <!-- user not found msg -->
                <div class="items-center gap-2 text-red-800 hidden" id="errorMsgUser">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M12 9v3.75m-9.303 3.376c-.866 1.5.217 3.374 1.948 3.374h14.71c1.73 0 2.813-1.874 1.948-3.374L13.949 3.378c-.866-1.5-3.032-1.5-3.898 0L2.697 16.126ZM12 15.75h.007v.008H12v-.008Z" />
                      </svg>
                      <span data-msg></span>
                </div>
                <!-- incorrect security questions answers msg -->
                <div class="items-center gap-2 text-red-800 hidden" id="errorMsgSq">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M12 9v3.75m-9.303 3.376c-.866 1.5.217 3.374 1.948 3.374h14.71c1.73 0 2.813-1.874 1.948-3.374L13.949 3.378c-.866-1.5-3.032-1.5-3.898 0L2.697 16.126ZM12 15.75h.007v.008H12v-.008Z" />
                      </svg>
                      <span data-msg></span>
                </div>
                  <!-- incorrect password msg -->
                  <div class="items-center gap-2 text-red-800 hidden" id="errorMsgPw">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M12 9v3.75m-9.303 3.376c-.866 1.5.217 3.374 1.948 3.374h14.71c1.73 0 2.813-1.874 1.948-3.374L13.949 3.378c-.866-1.5-3.032-1.5-3.898 0L2.697 16.126ZM12 15.75h.007v.008H12v-.008Z" />
                      </svg>
                      <span data-msg></span>
                </div>
                <!-- action button -->
                <button id="pwRecoveryBtn" class="w-full text-white bg-blue-500 hover:bg-blue-800 font-medium rounded-lg text-lg px-5 mt-6  py-2.5 text-center focus:ring-4 focus:outline-none focus:ring-blue-300 transition-colors duration-300" data-operation>Verificar</button>
            </form>
            <!-- first login form -->
            <?php 
            include_once("php/view/components/first_login_form.php");
            ?>
        </section>
        <!-- Slider section -->
        <section class=" w-full relative  overflow-hidden">
            <div class="z-30 absolute top-[30%] left-1/2 -translate-x-1/2 translate-y-[-30%] text-center">
                <h2 class="text-5xl text-white  font-[Impact] tracking-wider ">U.E.C. Vicente Emilio Sojo</h2>
                <p class="text-gray-200 text-3xl max-w-[90%] mx-auto mt-8 ">
                    <span class="font-mono font-bold text-white text-5xl">“</span>Forjando mentes brillantes con pasión y excelencia, cultivando sabiduría e inspirando futuro<span class="font-mono font-bold text-white text-5xl">”</span>
                </p>
            </div>
            
            <div id="slider" class="h-[100vh] w-[400%] flex ml-[-100%] z-0  after:absolute after:z-10 after:bg-black after:opacity-[0.7] after:content-[''] after:top-0 after:bottom-0 after:left-0 after:right-0 ">
                <div class="w-full" data-slider>
                    <img src="images/slider_test1.jpg" class="block w-full h-full object-cover" alt="">
                </div>
                <div class="w-full" data-slider>
                    <img src="images/slider_test2.jpg" class="block w-full h-full object-cover" alt="">
                </div>
                <div class="w-full" data-slider>
                    <img src="images/slider_test3.jpg" class="block w-full h-full object-cover" alt="">
                </div>
                <div class="w-full" data-slider>
                    <img src="images/slider_test4.jpg" class="block w-full h-full object-cover" alt="">
                </div>
            </div>
            <svg id="btnSliderLeft" class="absolute left-[1.5rem] cursor-pointer z-30 fill-black opacity-50 hover:fill-[#eef3fa] hover:opacity-100 transition-all duration-300 top-1/2 -translate-y-1/2" xmlns="http://www.w3.org/2000/svg" width="44" height="44" viewBox="0 0 24 24" ><path d="M12 2C6.486 2 2 6.486 2 12s4.486 10 10 10 10-4.486 10-10S17.514 2 12 2zm2.707 14.293-1.414 1.414L7.586 12l5.707-5.707 1.414 1.414L10.414 12l4.293 4.293z"></path></svg>
            <svg id="btnSliderRight" class="absolute right-[1.5rem] z-30 top-1/2 cursor-pointer  -translate-y-1/2 fill-black opacity-50 hover:fill-[#eef3fa] hover:opacity-100 transition-all duration-300" xmlns="http://www.w3.org/2000/svg" width="44" height="44" viewBox="0 0 24 24" ><path d="M12 2C6.486 2 2 6.486 2 12s4.486 10 10 10 10-4.486 10-10S17.514 2 12 2zm-1.293 15.707-1.414-1.414L13.586 12 9.293 7.707l1.414-1.414L16.414 12l-5.707 5.707z"></path></svg>
        </section>
        <section class="min-h-screen flex flex-col " id="nosotros">
            <header class="mt-20">
                <h2 class=" text-4xl font-[Impact] tracking-wider text-center">Nosotros</h2>
            </header>
            <div class="container mx-auto grid grid-cols-2 justify-center gap-8 max-w-[80rem] grow place-content-center">
                <div data-testimonial class="flex-none order-2  w-full flex flex-col items-center p-6  shadow-2xl rounded-lg max-w-[36rem] bg-[#eef3fa] ">
                    <img src="images/mission2.png" alt="" class="w-32 -mt-20">
                    <h5 class="text-xl my-4 font-bold">Nuestra Misión</h5>
                    <p class="text-sm  leading-relaxed text-justify">
                        <span class="font-mono font-bold  text-2xl ">“</span>Garantizar a los niños, niñas y adolescentes, reciban una educación por un equipo de profesionales con ética y moral intachable, que tiene como premisa educar con amor, respetando las necesidades básicas y los derechos de los estudiantes. En un ambiente en óptimas condiciones que le permita el desarrollo de la capacidad del ser, conocer, hacer y convivir de manera eficaz, en el proceso de trasformación social con excelente ético, consciente y solidario en la búsqueda de un buen profesional; ya que educamos para un futuro, que se desenvuelven con mejor calidad de vida. Atendiendo a los cambios permanentes que se presenten en el campo del conocimiento integral cultural en general.<span class="font-mono font-bold  text-2xl ">”</span>
                    </p>
                </div>
                <div data-testimonial class="flex-none order-3 w-full  flex flex-col items-center p-6 shadow-2xl  rounded-lg max-w-[36rem] bg-[#eef3fa] ">
                    <img src="images/vision2.png" alt="" class="w-32 -mt-20">
                    <h5 class="text-xl my-4 font-bold">Nuestra Visión</h5>
                    <p class="text-sm  leading-relaxed text-justify">
                        <span class="font-mono font-bold  text-2xl ">“</span>La unidad Educativa Colegio Vicente Emilio Sojo fomenta actividades y experiencias que propician el mantenimiento de un clima positivo y enriquecedor de convivencia, dialogo y alegría, aprovechando las fortalezas de cada estudiante y la integración de la familia en el proceso educativo. Ese trato cordial que tanto agrada a nuestra comunidad y crea un ambiente sano en que todos sienten la libertad de poder expresarse en todos los sentidos sin coartar su personalidad o pensamiento. 
                        Nuestro colegio responde al compromiso de educar, formar y capacitar un recurso humano con competencias laborales polivalentes, orientadas hacia el aprendizaje permanente y con grandes valores humanos, aptos para su incorporación a la sociedad como ciudadanos (as) participativos (as), capaces de desempeñarse según su vocación, y comprometidos con la transformación de la sociedad.<span class="font-mono font-bold  text-2xl ">”</span>
                    </p>
                </div>
                
            </div>
            
        </section>
       <footer class="w-full  bg-slate-950 text-slate-50" id="footer">
        <div class="container mx-auto py-8 flex justify-between ">
            <div>
                <img src="images/LogoBordeWhite.png" class="max-h-[15rem]" alt="">
            </div>
            <div class="pt-6">
                <h3 class="text-xl font-bold mb-8">Informacion de contacto</h3>
                <p class="flex gap-2 text-lg  items-center" >
                    <svg xmlns="http://www.w3.org/2000/svg" fill="rgb(248 250 252)" height="24" viewBox="0 -960 960 960" width="24"><path d="M480-480q33 0 56.5-23.5T560-560q0-33-23.5-56.5T480-640q-33 0-56.5 23.5T400-560q0 33 23.5 56.5T480-480Zm0 294q122-112 181-203.5T720-552q0-109-69.5-178.5T480-800q-101 0-170.5 69.5T240-552q0 71 59 162.5T480-186Zm0 106Q319-217 239.5-334.5T160-552q0-150 96.5-239T480-880q127 0 223.5 89T800-552q0 100-79.5 217.5T480-80Zm0-480Z"/></svg>
                    Calle 28, Av. Esquina 37 , Acarigua
                </p>
                <p class="flex gap-2 text-lg my-4 items-center">
                    <svg xmlns="http://www.w3.org/2000/svg"  fill="rgb(248 250 252)" height="24" viewBox="0 -960 960 960" width="24"><path d="M798-120q-125 0-247-54.5T329-329Q229-429 174.5-551T120-798q0-18 12-30t30-12h162q14 0 25 9.5t13 22.5l26 140q2 16-1 27t-11 19l-97 98q20 37 47.5 71.5T387-386q31 31 65 57.5t72 48.5l94-94q9-9 23.5-13.5T670-390l138 28q14 4 23 14.5t9 23.5v162q0 18-12 30t-30 12ZM241-600l66-66-17-94h-89q5 41 14 81t26 79Zm358 358q39 17 79.5 27t81.5 13v-88l-94-19-67 67ZM241-600Zm358 358Z"/></svg>
                    0255-615-35-81
                </p>
                <a href="https://www.instagram.com/colegioves_17_09/" class="text-slate-50 text-lg flex gap-2  items-center">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="rgb(248 250 252)"  ><path d="M11.999 7.377a4.623 4.623 0 1 0 0 9.248 4.623 4.623 0 0 0 0-9.248zm0 7.627a3.004 3.004 0 1 1 0-6.008 3.004 3.004 0 0 1 0 6.008z"></path><circle cx="16.806" cy="7.207" r="1.078"></circle><path d="M20.533 6.111A4.605 4.605 0 0 0 17.9 3.479a6.606 6.606 0 0 0-2.186-.42c-.963-.042-1.268-.054-3.71-.054s-2.755 0-3.71.054a6.554 6.554 0 0 0-2.184.42 4.6 4.6 0 0 0-2.633 2.632 6.585 6.585 0 0 0-.419 2.186c-.043.962-.056 1.267-.056 3.71 0 2.442 0 2.753.056 3.71.015.748.156 1.486.419 2.187a4.61 4.61 0 0 0 2.634 2.632 6.584 6.584 0 0 0 2.185.45c.963.042 1.268.055 3.71.055s2.755 0 3.71-.055a6.615 6.615 0 0 0 2.186-.419 4.613 4.613 0 0 0 2.633-2.633c.263-.7.404-1.438.419-2.186.043-.962.056-1.267.056-3.71s0-2.753-.056-3.71a6.581 6.581 0 0 0-.421-2.217zm-1.218 9.532a5.043 5.043 0 0 1-.311 1.688 2.987 2.987 0 0 1-1.712 1.711 4.985 4.985 0 0 1-1.67.311c-.95.044-1.218.055-3.654.055-2.438 0-2.687 0-3.655-.055a4.96 4.96 0 0 1-1.669-.311 2.985 2.985 0 0 1-1.719-1.711 5.08 5.08 0 0 1-.311-1.669c-.043-.95-.053-1.218-.053-3.654 0-2.437 0-2.686.053-3.655a5.038 5.038 0 0 1 .311-1.687c.305-.789.93-1.41 1.719-1.712a5.01 5.01 0 0 1 1.669-.311c.951-.043 1.218-.055 3.655-.055s2.687 0 3.654.055a4.96 4.96 0 0 1 1.67.311 2.991 2.991 0 0 1 1.712 1.712 5.08 5.08 0 0 1 .311 1.669c.043.951.054 1.218.054 3.655 0 2.436 0 2.698-.043 3.654h-.011z"></path></svg>@colegioves_17_09
                </a>
            </div>
            <div class="pt-6">
                <h3 class="text-xl font-bold mb-8">Informacion de contacto</h3>
                <div id="wrapper-9cd199b9cc5410cd3b1ad21cab2e54d3">
                    <div id="map-9cd199b9cc5410cd3b1ad21cab2e54d3"></div><script>(function () {
                    var setting = {"query":"HQ3R+8Q7 Acarigua, Portuguesa, Venezuela","width":250,"height":150,"satellite":false,"zoom":16,"placeId":"EilIUTNSKzhRNywgQWNhcmlndWEsIFBvcnR1Z3Vlc2EsIFZlbmV6dWVsYSImOiQKCg1Lt7EFFXOvv9YQCxoUChIJH__VQJ3BfY4RGr0Rfnt2MhM","cid":"0xf6ea3270a5bb709d","coords":[9.5532875,-69.2080781],"cityUrl":"/venezuela/acarigua-41784","cityAnchorText":"Map of Acarigua, Venezuela","lang":"us","queryString":"HQ3R+8Q7 Acarigua, Portuguesa, Venezuela","centerCoord":[9.5532875,-69.2080781],"id":"map-9cd199b9cc5410cd3b1ad21cab2e54d3","embed_id":"1096745"};
                    var d = document;
                    var s = d.createElement('script');
                    s.src = 'https://1map.com/js/script-for-user.js?embed_id=1096745';
                    s.async = true;
                    s.onload = function (e) {
                      window.OneMap.initMap(setting)
                    };
                    var to = d.getElementsByTagName('script')[0];
                    to.parentNode.insertBefore(s, to);
                  })();</script><a href="https://1map.com/map-embed">1 Map</a></div>
            </div>
        </div>
       </footer>
    </main>
    <script src="javascript/homepage.js"></script>
    <script src="javascript/login.js"></script>
</body>
</html>