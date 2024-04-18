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
    },500);

}
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