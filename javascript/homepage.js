const slider = document.getElementById("slider");
const btnSliderRight = document.getElementById("btnSliderRight");
const btnSliderLeft = document.getElementById("btnSliderLeft");
const openLoginBtn = document.getElementById("openLogin");
const closeLoginBtn = document.getElementById("closeLogin");
const loginModal = document.getElementById("loginModal");
const loginForm = document.getElementById("loginForm");
let sliderSection = document.querySelectorAll("[data-slider]");
let sliderSectionLast = sliderSection[sliderSection.length - 1];

slider.insertAdjacentElement("afterbegin", sliderSectionLast);

function sliderMoveRight()
{
    let sliderSectionFirst = document.querySelectorAll("[data-slider]")[0];
    slider.style.marginLeft = "-200%";
    slider.style.transition = "all ease 0.5s";
    setTimeout(() => {
        slider.style.transition = "none";
        slider.insertAdjacentElement("beforeend", sliderSectionFirst);
        slider.style.marginLeft = "-100%";
    }, 500);

}
function sliderMoveLeft()
{
    let sliderSection = document.querySelectorAll("[data-slider]");
    let sliderSectionLast = sliderSection[sliderSection.length - 1];
    slider.style.marginLeft = "0";
    slider.style.transition = "all ease 0.5s";
    setTimeout(() => {
        slider.style.transition = "none";
        slider.insertAdjacentElement("afterbegin", sliderSectionLast);
        slider.style.marginLeft = "-100%";
    }, 500);

}
function showLogin()
{
    loginModal.classList.remove("hidden");
    loginModal.classList.add("flex");
    setTimeout(()=>
    {
        loginModal.classList.add("opacity-100");
        loginModal.classList.remove("opacity-0");
    },50);

}
function hideLogin()
{
    
    loginModal.classList.add("opacity-0");
    loginModal.classList.remove("opacity-100");
    setTimeout(()=>
    {
        loginModal.classList.remove("flex");
        loginModal.classList.add("hidden");
        if (pwRecoveryForm.classList.contains("flex"))
        {
            // Hide and reset recovery form
            pwRecoveryForm.classList.add("hidden");
            pwRecoveryForm.classList.remove("flex");
            pwRecoveryForm.querySelectorAll("div:not(.hidden)").forEach(element => 
            {
                element.classList.add("hidden");
            });
            securityQuestions.forEach(element =>
                {
                    element.innerHTML = "";
                }
            );
            let recoveryUsername = document.getElementById("usernameRecovery");
            let usernameParent = recoveryUsername.parentElement;
            usernameParent.classList.remove("hidden");
            loginForm.classList.remove("hidden");
        }
        else if (firstLoginForm.classList.contains("flex"))
        {
            // Hide and reset first login form
            firstLoginForm.classList.add("hidden");
            firstLoginForm.classList.remove("flex");
            firstLoginForm.querySelectorAll("div:not(.hidden)").forEach(element => 
            {
                element.classList.add("hidden");
            });
            // Enable diabled options from first login form 
            document.querySelectorAll("[data-security-q-option]").forEach(option =>
                {
                    option.disabled = false;
                }
            );
            loginForm.classList.remove("hidden");

        }
        loginForm.reset();
        pwRecoveryForm.reset();
        firstLoginForm.reset();
    },500);

}
function hideOpMsg(){
    let okMsg = document.getElementById("opOkMsg");
    let errorMsg = document.getElementById("opErrorMsg");
    if(okMsg)
    {
        setTimeout(()=>
        {
            okMsg.classList.add("hidden");
            history.pushState({}, "", window.location.href.split("?")[0]);
        }, 2000);
    }
    else if(errorMsg)
    {
        setTimeout(()=>
        {
            errorMsg.classList.add("hidden");
            history.pushState({}, "", window.location.href.split("?")[0]);
           

        }, 2000);
    }
}
hideOpMsg();
btnSliderRight.addEventListener("click",()=>
{
    sliderMoveRight();
})
btnSliderLeft.addEventListener("click",()=>
{
    sliderMoveLeft();
})
setInterval(() => {
    sliderMoveRight();
}, 5000);

openLoginBtn.addEventListener("click", ()=>
{
    showLogin();
});
closeLoginBtn.addEventListener("click", ()=>
{
    hideLogin();
});
loginModal.addEventListener("click", ()=>
{
    hideLogin();
});
loginForm.addEventListener("click", e=>
{
    e.stopImmediatePropagation();
});
pwRecoveryForm.addEventListener("click", e=>
{
    e.stopImmediatePropagation();
});
firstLoginForm.addEventListener("click", e=>
{
    e.stopImmediatePropagation();
});