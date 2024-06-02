const loginBtn = document.getElementById("loginBtn");
const firstLoginUsername = document.getElementById("firstLoginUsername");
const username = document.getElementById("username");
const pwRecoveryBtn = document.getElementById("pwRecoveryBtn");
const opLogin = document.getElementById("opLogin");
const opLoginRecovery = document.getElementById("opLoginRecovery");
const formInputs = loginForm.querySelectorAll("input");
const errorMsg = document.getElementById("errorMsg");
// const msg = errorMsg.querySelector("[data-msg]");
const errorMsgUser = document.getElementById("errorMsgUser");
// const msgUser = errorMsgUser.querySelector("[data-msg]");
const errorMsgSq = document.getElementById("errorMsgSq");
// const msgSq = errorMsgSq.querySelector("[data-msg]");
const errorMsgPw = document.getElementById("errorMsgPw");
const errorMsgFirstPw = document.getElementById("errorMsgFirstPw");
const errorMsgFirstSQ = document.getElementById("errorMsgFirstSQ");
const pwRecoveryForm = document.getElementById("pwRecoveryForm");
const firstLoginForm = document.getElementById("firstLoginForm");
const forgotPwTrigger = document.getElementById("forgotPwTrigger");
const closeLoginRecoveryBtn = document.getElementById("closeLoginRecovery");
const closeFirstLoginForm = document.getElementById("closeFirstLoginForm");
const recoveryFormTitle = document.getElementById("recoveryFormTitle");
const firstLoginFormTitle = document.getElementById("firstLoginFormTitle");
const securityQuestions = document.querySelectorAll("[data-security-question]");
const newPw = document.getElementById("newPw");
const newPwConfirm = document.getElementById("newPwConfirm");
const numericInputs = document.querySelectorAll("[data-numeric-input");
const textInputs = document.querySelectorAll("[data-text-input");
const cedulaInputs = document.querySelectorAll("[data-username]");
// const pwStrength = document.getElementById("pwStrength");
const firstLoginSecurityQ = document.querySelectorAll("[data-first-login-security-q]");
const firstLoginPassword = document.querySelectorAll("[data-first-login-pw]");
const securityQSelects = document.querySelectorAll("[data-security-select]");
const firstLoginNextBackBtn = document.getElementById("firstLoginNextBackBtn");
const firstLoginBtn = document.getElementById("firstLoginBtn");
const firstPw = document.getElementById("firstPw");
const firstPwConfirm = document.getElementById("firstPwConfirm");
function forbidNotNumeric(input)
{
    input.addEventListener
}
// password strength
newPw.addEventListener("focus", ()=>
{
    let pwStrength = newPw.parentElement.nextElementSibling;
    pwStrength.style.maxHeight = "20rem";
});
newPw.addEventListener("focusout", ()=>
{
    let pwStrength = newPw.parentElement.nextElementSibling;
    pwStrength.style.maxHeight = "0px";
});
newPw.addEventListener("input", (e) =>
{
    let pwStrength = newPw.parentElement.nextElementSibling;
    passwordStrength(e.target.value, pwStrength);
});
firstPw.addEventListener("focus", ()=>
{
    let pwStrength = firstPw.parentElement.nextElementSibling;
    pwStrength.style.maxHeight = "20rem";
});
firstPw.addEventListener("focusout", ()=>
{
    let pwStrength = firstPw.parentElement.nextElementSibling;
    pwStrength.style.maxHeight = "0px";
});
firstPw.addEventListener("input", (e) =>
{
    let pwStrength = firstPw.parentElement.nextElementSibling;
    passwordStrength(e.target.value, pwStrength);
});
function passwordStrength(value, pwStrength)
{
    let patterns = [/^.{8,}$/, /^.{0,20}$/, /[0-9]/, /[!@#$%^&*()\-_]/ , /[a-z]/, /[A-Z]/ ];
    let strengths = pwStrength.querySelectorAll(".strength");
    strengths.forEach((element, index) =>
        {
            if (patterns[index].test(value)){
                if (element.querySelector(".check").classList.contains("hidden")) 
                {
                    element.querySelector(".invalid-pw").classList.add("hidden");
                    element.querySelector(".check").classList.remove("hidden");
                }
            }
            else
            {
                if (element.querySelector(".invalid-pw").classList.contains("hidden")) 
                {
                    element.querySelector(".check").classList.add("hidden");
                    element.querySelector(".invalid-pw").classList.remove("hidden");
                }
            }
        }
    );
}

function checkLogin()
{
    opLogin.value = "check";
    let form = new FormData(loginForm);
    fetch("php/controller/c_login.php",
    {
        method: "POST",
        body: form
    })
    .then(response => response.json())
    .then(result =>
    {
        if (result.result && result.msg == "ok")
        {
            opLogin.value = "login";
            loginForm.submit();
            return true;
        }
        else if(result.result && result.msg == "new")
        {
            showFirstLoginForm();
            return true
        }
        loginErrorMsg(errorMsg, result.msg);

    });
}
function loginErrorMsg(errorContainer, message)
{
    msg = errorContainer.querySelector("[data-msg]");
    msg.innerHTML = message;
    errorContainer.classList.add("flex");
    errorContainer.classList.remove("hidden");
    setTimeout(()=>
    {
        errorContainer.classList.remove("flex");
        errorContainer.classList.add("hidden");
        msg.innerHTML = "";
    }, 2000);
}
function getSecurityQuestions()
{
    opLoginRecovery.value = "securityQ";
    let recoveryUsername = document.getElementById("usernameRecovery");
    let form = new FormData();
    form.append("username", recoveryUsername.value);
    form.append(opLoginRecovery.name, opLoginRecovery.value);

    fetch("php/controller/c_login.php",
    {
        method: "POST",
        body: form
    })
    .then(response => response.json())
    .then(result =>
    {
        if(result.result)
        {

            let usernameParent = recoveryUsername.parentElement;
            usernameParent.classList.add("hidden");
            recoveryFormTitle.innerHTML = "Responda las preguntas de seguridad";
            let dataResult = Object.values(result.data);
            pwRecoveryBtn.dataset.operation = "validateSecurityA";
            animateEntranceCenter(pwRecoveryForm);
            securityQuestions.forEach((element, index) =>
            {
                element.parentElement.classList.remove("hidden");
                element.innerHTML = dataResult[index];
            });
            return true;
        }
        loginErrorMsg(errorMsgUser, result.msg);
    });
}

function animateEntranceCenter(element) {
    // Definir el manejador para el evento 'animationend'
    function handleAnimationEnd(event) {
        if (event.animationName === 'entranceCenter') {
            element.classList.remove("animate-entranceCenter");
            // Remover el listener después de que la animación termine
            element.removeEventListener('animationend', handleAnimationEnd);
        }
    }
    // Agregar la clase de animación
    element.classList.add("animate-entranceCenter");
    
    // Agregar el listener para 'animationend'
    element.addEventListener('animationend', handleAnimationEnd);
}


function validateSecurityA()
{
    opLoginRecovery.value = "validateSecurityA";
    let recoveryUsername = document.getElementById("usernameRecovery");
    let pwStrength = newPw.parentElement.nextElementSibling;
    let form = new FormData();
    form.append("username", recoveryUsername.value);
    form.append(opLoginRecovery.name, opLoginRecovery.value);
    securityQuestions.forEach(element =>
        {
            form.append(element.nextElementSibling.name, element.nextElementSibling.value);
        });
    fetch("php/controller/c_login.php",
    {
        method: "POST",
        body: form
    })
    .then(response => response.json())
    .then(result =>
    {
        if (result.result)
        {
            recoveryFormTitle.innerHTML = "Establecer contraseña"
            securityQuestions.forEach((element, index) =>
            {
                element.parentElement.classList.add("hidden");
                element.innerHTML = "";
            });
            animateEntranceCenter(pwRecoveryForm);
            newPw.parentElement.classList.remove("hidden");
            newPwConfirm.parentElement.classList.remove("hidden");
            pwRecoveryBtn.dataset.operation = "changePw";
            pwRecoveryBtn.innerHTML = "Guardar Nueva Contraseña";
            opLoginRecovery.value = "changePw";
            pwStrength.classList.remove("hidden")
            let wrongStrength = pwStrength.querySelectorAll(".invalid-pw");
            let checkStrength = pwStrength.querySelectorAll(".check");
            wrongStrength.forEach((element, index)=>
            {
                if(element.classList.contains("hidden"))
                {
                    checkStrength[index].classList.add("hidden");
                    element.classList.remove("hidden");
                }
            });
            return true;
        }
        loginErrorMsg(errorMsgSq, result.msg);
    });
}
function validatePw(pw, pwConfirm)
{
    const regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()\-_])[A-Za-z\d!@#$%^&*()\-_]{8,20}$/
    if(pw.length==0)
    {
        return [false, "Ingrese la nueva contraseña!"];
    }
    else if(!(regex.test(pw)))
    {
        return [false, "Contraseña no segura!"];
    }
    else if(pw != pwConfirm)
    {
        return [false, "Las contraseñas no coinciden!"];
    }
    return [true, "ok"];
}
function changePw()
{
    let result = validatePw(newPw.value, newPwConfirm.value);
    if (result[0])
    {
        pwRecoveryForm.submit();
    }
    else
    {
        loginErrorMsg(errorMsgPw, result[1]);
    }
}
// shows recovery form
function showForgotPwForm() 
{
    loginForm.classList.add("animate-exit");
    recoveryFormTitle.innerHTML = "Verificar usuario";
    pwRecoveryBtn.dataset.operation = "checkUser";
    pwRecoveryBtn.innerHTML = "Verificar";
    setTimeout(() => 
    {
        loginForm.classList.add("hidden");
        loginForm.classList.remove("animate-exit");
        pwRecoveryForm.classList.add("flex");
        pwRecoveryForm.classList.add("animate-entrance");
        pwRecoveryForm.classList.remove("hidden");
        setTimeout(() =>
            {
                pwRecoveryForm.classList.remove("animate-entrance");
            },800);
    }, 800);
}
// shows first login form
function showFirstLoginForm() 
{
    loginForm.classList.add("animate-exit");
    setTimeout(() => 
    {
        let pwStrength = firstPw.parentElement.nextElementSibling;
        firstLoginUsername.value = username.value;
        loginForm.classList.add("hidden");
        loginForm.classList.remove("animate-exit");
        firstLoginForm.classList.add("flex");
        firstLoginForm.classList.add("animate-entrance");
        firstLoginFormTitle.innerHTML = "Establecer preguntas de seguridad";
        firstLoginForm.classList.remove("hidden");
        firstLoginNextBackBtn.innerHTML = "Siguiente";
        firstLoginNextBackBtn.dataset.operation = "next";
        firstLoginSecurityQ.forEach(element =>
            {
                element.classList.remove("hidden");
            });
        pwStrength.classList.remove("hidden")
        let wrongStrength = pwStrength.querySelectorAll(".invalid-pw");
        let checkStrength = pwStrength.querySelectorAll(".check");
        wrongStrength.forEach((element, index) => {
            if (element.classList.contains("hidden")) {
                checkStrength[index].classList.add("hidden");
                element.classList.remove("hidden");
            }
        });
        setTimeout(() =>
            {
                firstLoginForm.classList.remove("animate-entrance");
            },800);
    }, 800);
}
// update security question selects
function updateSelectOptions() {
    const selectedValues = Array.from(securityQSelects).map(select => select.value);

    securityQSelects.forEach(select => {
        Array.from(select.options).forEach(option => {
            if (selectedValues.includes(option.value) && option.value !== select.value) {
                option.disabled = true;
            } else {
                option.disabled = false;
            }
        });
    });
}
// validate first security question
function validateFirstSecurity()
{
    const firstSecurityQInputs = document.querySelectorAll("[data-first-login-security-q-value]");
    if([...firstSecurityQInputs].some(element => element.value.length == 0))
    {
        loginErrorMsg(errorMsgFirstSQ, "Debe seleccionar y contestar las preguntas de seguridad!");
        return false;
    }
    return true;
}
// Validate pw and set new pw and security question
function setPwSQ()
{
    let result = validatePw(firstPw.value, firstPwConfirm.value);
    if (result[0])
    {
        firstLoginForm.submit();
    }
    else
    {
        loginErrorMsg(errorMsgFirstPw, result[1]);
    }
}

loginBtn.addEventListener("click", e =>
{
    e.preventDefault();
    checkLogin();
});
formInputs.forEach(inputElement => inputElement.addEventListener("click", ()=>
{
    if (errorMsg.classList.contains("flex"))
    {
        errorMsg.classList.remove("flex");
        errorMsg.classList.add("hidden");
        msg.innerHTML = "";
    }
}));
forgotPwTrigger.addEventListener("click", ()=>
{
    showForgotPwForm();
});
closeLoginRecoveryBtn.addEventListener("click", ()=>
{
    hideLogin();
});
closeFirstLoginForm.addEventListener("click", ()=>
{
    hideLogin();
});
pwRecoveryBtn.addEventListener("click", (e)=>
{
    e.preventDefault();
    switch (pwRecoveryBtn.dataset.operation)
    {
        case "checkUser": 
            getSecurityQuestions();
            break;
        case "validateSecurityA" : 
            validateSecurityA();
            break;
        case "changePw" : 
            changePw();
            break;
    };
    

});
// Next and back button functionality 
firstLoginNextBackBtn.addEventListener("click", (e) =>
{
    e.preventDefault();
    switch (firstLoginNextBackBtn.dataset.operation)
    {
        case "next": 
            if(validateFirstSecurity())
            {

                animateEntranceCenter(firstLoginForm);
                firstLoginBtn.classList.remove("hidden");
                firstLoginFormTitle.innerHTML = "Establecer contraseña";
                firstLoginNextBackBtn.dataset.operation = "back";
                firstLoginNextBackBtn.innerHTML = "Regresar";
                firstLoginSecurityQ.forEach(element =>
                {
                    element.classList.add("hidden");
                });
                firstLoginPassword.forEach(element =>
                {
                    element.classList.remove("hidden");
                });
            }
            break;
        case "back" : 
            animateEntranceCenter(firstLoginForm);
            firstLoginBtn.classList.add("hidden");
            firstLoginFormTitle.innerHTML = "Establecer preguntas de seguridad";
            firstLoginNextBackBtn.dataset.operation = "next";
            firstLoginNextBackBtn.innerHTML = "Siguiente";
            firstLoginSecurityQ.forEach(element =>
            {
                element.classList.remove("hidden");
            });
            firstLoginPassword.forEach(element =>
            {
                element.classList.add("hidden");
            });
            break;
        
    };
}
);
// set login and security question button
firstLoginBtn.addEventListener("click", e =>
{
    e.preventDefault();
    setPwSQ()
}
);
// forbid dangerous character in text fields
textInputs.forEach(element => {
    element.addEventListener("input", (e) => 
    {
        let inputLenght = e.target.value.length;
        let lastCh = e.target.value[inputLenght - 1];
        if (!/^[a-zA-Z0-9\s\-_.!?]+$/.test(lastCh))
        {
            e.target.value = e.target.value.substr(0, inputLenght - 1 );
        }
    });
});

// forbid non numirical characters
numericInputs.forEach(element => {
    element.addEventListener("input", (e) => 
    {
        let inputLenght = e.target.value.length;
        let lastCh = e.target.value[inputLenght - 1];
        if (isNaN(lastCh))
        {
            e.target.value = e.target.value.substr(0, inputLenght - 1 );
        }
    });
});
// forbid more than 10 digits in the username
cedulaInputs.forEach(element => {
    element.addEventListener("input", (e) => 
    {
        let inputLenght = e.target.value.length;
        if (inputLenght > 10)
        {
            e.target.value = e.target.value.substr(0, inputLenght - 1 );
        }
    });
});
// add updating function to the security question selects
securityQSelects.forEach(select => {
    select.addEventListener('change', function() {
        updateSelectOptions();
    });
});
