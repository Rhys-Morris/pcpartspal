const postageSelected = document.querySelector("#postage-selected");
const postageSelector = document.querySelector("#postage-choice")
if (postageSelected.dataset.postage) {
    const postageOption = postageSelected.dataset.postage;
    postageSelector.value = postageOption;    
}