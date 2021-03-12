const toggleBar = document.querySelector("#toggle");
toggleBar.addEventListener('change', () => {
    const target = toggleBar.value;
    if (target == "delete-account" || target == 'my-messages') {
        return;
    }
    document.querySelectorAll("[data-target]").forEach(section => section.classList.add("hidden"));
    document.querySelector(`[data-target='${target}']`).classList.remove("hidden");
})