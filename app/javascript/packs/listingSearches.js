const search = document.querySelector(".listings-panel__search");
const titles = document.querySelectorAll(".card--listing__title")
const cards = Array.from(document.querySelectorAll(".card--listing"))

// Show all cards
function makeCardsVisible () {
    cards.forEach(card => {
        card.classList.remove("hidden");
    });
}

// Filter card titles by search input
search.addEventListener('keyup', () => {
    const searchString = search.value;
    if (searchString == "") {
        makeCardsVisible();
    }
    const regExp = new RegExp(searchString, 'i')
    titles.forEach(title => {
        const titleText = title.textContent;
        if (!titleText.match(regExp)) {
          title.closest(".card--listing").classList.add("hidden");
        }
    });
});

// Filter by location distance
const filter = document.querySelector("#filter");
filter.addEventListener('change', () => {
    cards.forEach(card => {
        card.classList.remove("hidden");
        if (Number(card.dataset.distance) > Number(filter.value)) {
        card.classList.add("hidden");
        }
    });
});

// Reset search input
const resetSearch = document.getElementById("reset-search")
resetSearch.addEventListener('click', () => {
    search.value = "";
    search.textContent = "";
    makeCardsVisible()
})

// Filter by price
const price = document.querySelector("#price");
price.addEventListener('change', () => {
    cards.forEach(card => {
        card.classList.remove("hidden");
        if (Number(card.dataset.price) > Number(price.value)) {
        card.classList.add("hidden");
        }
    });
});

// Filter by condition
const condition = document.querySelector("#condition");
condition.addEventListener('change', () => {
    cards.forEach(card => {
        card.classList.remove("hidden");
        if (card.dataset.condition.toLowerCase() != condition.value.toLowerCase()) {
        card.classList.add("hidden");
        }
    });
});

// Sort cards
const cardContainer = document.querySelector(".card-container")
const sort = document.getElementById("sort")
sort.addEventListener('change', () => {
    sorted_cards = cards.sort(card => card.dataset.price).map(card => card.querySelector(".card--listing__title").textContent)
    console.log(sorted_cards);
})