const hamburgerIcon = document.querySelector(".nav__toggle");
const navBar = document.querySelector(".nav__navlist");
const nav = document.querySelector(".nav");
hamburgerIcon.addEventListener('click', () => {
    navBar.style.display = navBar.style.display == "none" ? "flex" : "none";
    nav.style.height = nav.style.height == "8vh" ? "100vh" : "8vh";
})