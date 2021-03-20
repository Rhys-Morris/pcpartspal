const titleSearch = document.querySelector(".listings-panel__search");
const cards = document.querySelectorAll(".card--listing");
const titles = document.querySelectorAll(".card--listing__title")

// Show all cards
function makeCardsVisible () {
    cards.forEach(card => {
        card.classList.remove("hidden");
    });
}

// TOGGLE HAMBURGER ICON FOR FILTERS
const searchToggle = document.querySelector(".filter__toggle");
const filterDiv = document.querySelector(".filter");
let filterDisplayed = false;
searchToggle.addEventListener('click', () => {
    if (filterDisplayed) {
        filterDiv.style.display = "none"
    } else {
        filterDiv.style.display = "flex"
    }
    filterDisplayed = !filterDisplayed
})

function filterListingsByTitle (searchBox, e) {
    const searchString = searchBox.value;
    console.log(searchString);
    if (searchString == "" || e.code == "Backspace") {
        makeCardsVisible();
    }
    const regExp = new RegExp(searchString, 'i');
    titles.forEach(title => {
        const titleText = title.textContent;
        if (!titleText.match(regExp)) {
          title.closest(".card--listing").classList.add("hidden");
        }
    });
}

// SEARCH LISTINGS CURRENTLY DISPLAYED BY TITLE - INSIDE HAMBURGER DROP DOWN
const hamburgerSearch = document.querySelector(".filter__search");
hamburgerSearch.addEventListener('keyup', function (e) {
    filterListingsByTitle(this, e)
    console.log(e);
});


// SEARCH LISTINGS CURRENTLY DISPLAYED BY TITLE - MAIN MENU
titleSearch.addEventListener('keyup', function () {
    filterListingsByTitle(this, e);
});

// RESET SEARCH INPUT
const resetSearch = document.getElementById("reset-search")
resetSearch.addEventListener('click', () => {
    titleSearch.value = "";
    titleSearch.textContent = "";
    makeCardsVisible()
})

// SORTING FUNCTIONALITY
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

// FILTER FUNCTIONALITY
const price = document.querySelector("#price");
const distance = document.querySelector("#distance");
const condition = document.querySelector("#condition");
const category = document.querySelector("#category");
const brand = document.querySelector("#brand");
const selectBoxes = Array.from(document.querySelectorAll(".filter-select"));
const listingCount = document.querySelector(".listings-panel__total")

selectBoxes.forEach(select => select.addEventListener('change', () => {
    let count = cards.length
    cards.forEach(card => {
        card.classList.remove("hidden")
        // Condition filter
        const conditionSelected = condition.value;
        if ( conditionSelected != "none" && card.dataset.condition.toLowerCase() != conditionSelected.toLowerCase()) {
            card.classList.add("hidden");
            count -= 1;
            return
        }
        // Distance filter
        if (Number(card.dataset.distance) > Number(distance.value)) {
            card.classList.add("hidden");
            count -= 1;
            return
        }
        // Price filter
        if (Number(card.dataset.price) > Number(price.value)) {
            card.classList.add("hidden");
            count -= 1;
            return
        }
        const brandSelected = brand.value;
        // Brand filter
        if ( brandSelected && card.dataset.brand != brandSelected) {
            card.classList.add("hidden");
            count -= 1;
            return
        }
        const categorySelected = category.value;
        // Brand filter
        if ( categorySelected && card.dataset.category != categorySelected) {
            card.classList.add("hidden");
            count -= 1;
            return
        }
    });
    updateListingCount(count);
}));
 
function updateListingCount(count) {
    if (count == 1) {
        listingCount.textContent = "1 listing for sale"
    } else {
        listingCount.textContent = `${count} listings for sale`
    }
}