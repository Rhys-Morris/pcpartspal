const create_message = document.querySelector(".conversation__send");
const new_message_box = document.querySelector(".conversation__new-message")
const send_message = document.querySelector(".message-send");
[create_message, send_message].forEach(element => {
    element.addEventListener('click', () => {
    create_message.classList.toggle("hidden");
    new_message_box.classList.toggle("hidden");
    });
});