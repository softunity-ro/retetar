let sliderInterval = 5 * 1000;
let slideTimer;
const slides = Array.from(document.getElementsByClassName('slide'));
const slideButtons = Array.from(document.getElementsByClassName("slide-navigation-btn"));
let isAutoRun = true;
let currentIndex = 0;
startSlider();

function nextSlide(stopAutoRun = false) {
    if (stopAutoRun) stopSlider();

    //next slide index
    let nextIndex = (slides.length - 1) < currentIndex + 1 ? 0 : currentIndex + 1;
    console.log("Next slide index: ", nextIndex);
    currentIndex = nextIndex;
    setActiveSlide(nextIndex);
}

function previousSlide(stopAutoRun = true) {
    if (stopAutoRun) stopSlider();

    //next slide index
    let nextIndex = 0 > currentIndex - 1 ? slides.length - 1 : currentIndex - 1;
    console.log("Next slide index: ", nextIndex);
    currentIndex = nextIndex;
    setActiveSlide(nextIndex);
}

function getSlideByIndex(slideIndex) {
    return slides[slideIndex];
}

function getActiveSlide() {
    return getActiveSlides()[0];
}

function getActiveSlides() {
    return slides.filter(element => element.className.includes('active-slide'));
}

function getActiveSlideButtons() {
    return slideButtons.filter(element => element.className.includes('active-slide-navigation-btn'));
}

function unActivateAllSlides() {
    let activeSlides = getActiveSlides();
    if (activeSlides && activeSlides.length > 0) {
        for (let slide of activeSlides) {
            let slideIndex = getSlideIndex(slide);
            setUnActiveSlide(slideIndex);
        }
    }
}

function unActivateAllSlideButtons() {
    let activeButtons = getActiveSlideButtons();
    if (activeButtons && activeButtons.length > 0) {
        activeButtons.forEach(btn => {
            btn.classList.remove('active-slide-navigation-btn');
        });
    }
}

function setUnActiveSlide(slideIndex) {
    let slide = getSlideByIndex(slideIndex);
    if (slide) slide.classList.remove('active-slide');
}

function setActiveSlide(slideIndex) {
    // deactivate previous active slide so that only one will be displayed
    unActivateAllSlides();
    unActivateAllSlideButtons();

    let slide = getSlideByIndex(slideIndex);
    let slideBtn = slideButtons[slideIndex];
    if (slide) slide.classList.add('active-slide');
    if (slideBtn) slideBtn.classList.add('active-slide-navigation-btn');
    currentIndex = slideIndex;
}

function getSlideIndex(slide) {
    return slides.indexOf(slide);
}

function startSlider() {
    if (slides.length > 0) {
        isAutoRun = true;
        slideTimer = setInterval(nextSlide, sliderInterval);
    }else {
        console.log("Slider is empty");
    }
}

function stopSlider() {
    isAutoRun = false;
    clearInterval(slideTimer);
}

function getSlideNavigation() {

    console.log(slideButtons);
}