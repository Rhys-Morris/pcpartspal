const paymentButton = document.querySelector("[data-stripe='payment']");

if (paymentButton) {
    paymentButton.addEventListener("click", () => {
        // Don't send session if no postage option selected
        const { pubkey, sessionid, postage } = paymentButton.dataset; 
        if (!postage) {
          createFlash()
          return
        }
        // Get sessionId and publicKey
        const stripe = Stripe(pubkey);
        stripe.redirectToCheckout({
          sessionId: sessionid
        });
      });
    
}
const createFlash = function () {
    const flashDiv = document.createElement("div");
    flashDiv.className = "flash";
    const flashMessage = document.createElement("p");
    flashMessage.className = "alert";
    flashMessage.textContent = "Please select postage before proceeding to checkout";
    flashExit = document.createElement("div");
    flashExit.textContent = "X";
    flashExit.className = "flash__close";
    flashDiv.appendChild(flashMessage);
    flashDiv.appendChild(flashExit);
    document.querySelector('.nav').after(flashDiv);
    flashExit.addEventListener('click', () => {
        flashDiv.classList.add("hidden")
    })
}