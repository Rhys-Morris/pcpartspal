const container = document.querySelector('.user-profile__sidebar');
container.addEventListener('click', (e) => {
    // Prevent hidden class addition if redirecting to inbox
    if (e.target.className == "user-profile__sidebar__messages-link") return
        
    const target = e.target.closest(".user-profile__sidebar__list__list-item").id;
    document.querySelectorAll("[data-target]").forEach(section => section.classList.add("hidden"));
    document.querySelector(`[data-target='${target}']`).classList.remove("hidden");
});