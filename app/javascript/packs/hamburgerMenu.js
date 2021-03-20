const hamburgerIcon = document.querySelector(".nav__toggle");
const navBar = document.querySelector(".nav__navlist");
const nav = document.querySelector(".nav");
const hamburgerOne = document.querySelector(".nav__toggle__hamburger-line--1")
const hamburgerTwo = document.querySelector(".nav__toggle__hamburger-line--2")
const hamburgerThree = document.querySelector(".nav__toggle__hamburger-line--3")

let toggleStatus = false;
hamburgerIcon.addEventListener('click', () => {
    if (toggleStatus) {
        navBar.style.display = "none";
        nav.style.height = "7rem";
        hamburgerTwo.style.visibility = "visible";
        hamburgerOne.style.transform = "rotate(0deg)";
        hamburgerThree.style.transform = "rotate(0deg)";
        hamburgerOne.style.backgroundColor = "#f0f5f9";
        hamburgerThree.style.backgroundColor = "#f0f5f9";
    } else {
        navBar.style.display = "flex";
        nav.style.height = "100vh";
        hamburgerTwo.style.visibility = "hidden";
        hamburgerOne.style.transform = "rotate(44deg)";
        hamburgerThree.style.transform = "rotate(-44deg)";
        hamburgerOne.style.backgroundColor = "#d84520";
        hamburgerThree.style.backgroundColor = "#d84520";
    }
    toggleStatus = !toggleStatus;
})