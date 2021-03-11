const search = document.querySelector(".listings-panel__search");
const titles = document.querySelectorAll(".card--listing__title")
const cards = document.querySelectorAll(".card--listing");

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

// Reset search input
const resetSearch = document.getElementById("reset-search")
resetSearch.addEventListener('click', () => {
    search.value = "";
    search.textContent = "";
    makeCardsVisible()
})

// Sort cards
const cardContainer = document.querySelector(".card-container")
const sort = document.getElementById("sort")
sort.addEventListener('change', () => {
    sortParam = sort.value;
    currentStateCards = Array.from(document.querySelectorAll(".card--listing"));

    sortedCards = sortCards(sortParam, currentStateCards);

    cardContainer.innerHTML = "";
    sortedCards.forEach(card => {
        cardContainer.append(card);
    })
})

function sortCards (param, cards) {
    switch(param) {
        case "cheapest":
            return cards.sort((cardOne, cardTwo) => cardOne.dataset.price - cardTwo.dataset.price);
        case "expensive":
            return cards.sort((cardOne, cardTwo) => cardTwo.dataset.price - cardOne.dataset.price);
        case "newest":
            return cards.sort((cardOne, cardTwo) => cardTwo.dataset.created - cardOne.dataset.created);
        case "oldest":
            return cards.sort((cardOne, cardTwo) => cardOne.dataset.created - cardTwo.dataset.created);
    }
}


const price = document.querySelector("#price");
const distance = document.querySelector("#distance");
const condition = document.querySelector("#condition");
const category = document.querySelector("#category");
const brand = document.querySelector("#brand");
const selectBoxes = Array.from(document.querySelectorAll(".filter-select"));

selectBoxes.forEach(select => select.addEventListener('change', () => {
    cards.forEach(card => {
        card.classList.remove("hidden")
        // Condition filter
        const conditionSelected = condition.value;
        if ( conditionSelected != "none" && card.dataset.condition.toLowerCase() != conditionSelected.toLowerCase()) {
            card.classList.add("hidden");
        }
        // Distance filter
        if (Number(card.dataset.distance) > Number(distance.value)) {
            card.classList.add("hidden");
        }
        // Price filter
        if (Number(card.dataset.price) > Number(price.value)) {
            card.classList.add("hidden");
        }
        const brandSelected = brand.value;
        // Brand filter
        if ( brandSelected && card.dataset.brand != brandSelected) {
            card.classList.add("hidden");
        }
        const categorySelected = category.value;
        // Brand filter
        if ( categorySelected && card.dataset.category != categorySelected) {
            console.log(categorySelected);
            card.classList.add("hidden");
        }
    });
}));