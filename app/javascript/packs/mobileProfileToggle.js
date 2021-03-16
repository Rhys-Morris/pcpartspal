const toggleBar = document.querySelector("#toggle");
toggleBar.addEventListener('change', () => {
    const target = toggleBar.value;
    if (target == "delete-account") {
        return;
    } else if(target == 'my-messages') {
        window.location.href = window.location.href.replace(window.location.pathname, "/conversations")  
    }
    document.querySelectorAll("[data-target]").forEach(section => section.classList.add("hidden"));
    document.querySelector(`[data-target='${target}']`).classList.remove("hidden");
})