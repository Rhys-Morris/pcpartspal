const flash = document.querySelector('.flash')
if (flash) {
  const flashClose = document.querySelector('.flash__close')
    flashClose.addEventListener('click', () => {
    flash.classList.add("hidden");
  });
}