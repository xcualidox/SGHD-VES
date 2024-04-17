const slider = document.getElementById("slider");
const btnSliderRight = document.getElementById("btnSliderRight");
const btnSliderLeft = document.getElementById("btnSliderLeft");
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