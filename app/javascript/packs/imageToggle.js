const thumbnailBox = document.querySelector(".listing-show__images__thumbnail-container")
const mainImage = document.querySelector(".listing-show__images__main")
thumbnailBox.addEventListener("click", (e) => {
    const target = e.target.closest(".listing-show__images__thumbnail");
    const src = target.src;
    mainImage.src = src;
})