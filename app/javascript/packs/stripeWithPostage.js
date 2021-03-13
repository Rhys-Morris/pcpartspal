const paymentButton = document.querySelector("[data-stripe='payment']");
const postageSelector = document.querySelector("#postage-choice")
const postageDisplay = document.querySelector(".listing-show__postage-cost")
postageSelector.addEventListener('change', () => {
    if (!postageSelector.value) {
      postageDisplay.textContent = "Please select postage option"
    } else {
      postageDisplay.textContent = `+ $${(postageSelector.value / 100).toFixed(2)} postage cost`
    }
})

if (paymentButton) {
    paymentButton.addEventListener("click", () => {
      createStripeSession();
    })
}

function createStripeSession() {
  if (!postageSelector.value) {
    createFlash();
    return
  }
  paymentButton.setAttribute("disabled", true);
  paymentButton.innerHTML = `
    <span id="loading" role="status" aria-hidden="true"></span>
    Loading
  `

  const csrfToken = document.querySelector("[name='csrf-token']").textContent
  const { pubkey, listingid, path } = paymentButton.dataset; 
  console.log(path);
  console.log(listingid);

  fetch(path, {
    method: "POST",
    headers: {
      "X-CSRF-Token": csrfToken,
      "Content-Type": "application/json"
    },
    body: JSON.stringify({listingid: listingid, postage: postageSelector.value })
  })
  .then(response => response.json())
  .then(data => {
    const sessionId = data;
    const stripe = Stripe(pubkey);
    stripe.redirectToCheckout({
      sessionId: sessionId
    });
  })
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