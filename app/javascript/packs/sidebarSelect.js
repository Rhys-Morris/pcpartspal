sidePanel = document.querySelector(".user-profile__sidebar");

function renderSelectedDisplay () {
    selectedDisplay = sidePanel.dataset.display;
    if (!selectedDisplay) return
    document.querySelectorAll("[data-target]").forEach(section => {
        console.log(section);
        section.classList.add("hidden")
    });
    document.querySelector(`[data-target='${selectedDisplay}']`).classList.remove("hidden");
}

renderSelectedDisplay();