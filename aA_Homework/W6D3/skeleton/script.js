document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items

  // const addPlace = (e) => {
  //   const ul = docuemnt.getElementById("sf-places");
  //   const addLi = document.createElement("li");
  //   addLi.textContent = `${e}`;
  //   ul.appendChild(addLi);
  // }

  document.querySelector(".favorite-submit").addEventListener("click", event => {
    // alert("yo");
    event.preventDefault();
    const input = document.querySelector(".favorite-input");
    const favorite = input.value;
    const addLi = document.createElement("li");
    addLi.textContent = favorite;
    const sfPlaces = document.querySelector("#sf-places");
    sfPlaces.appendChild(addLi);

    input.value = "";
  });


  // adding new photos


  document.querySelector(".photo-show-button").addEventListener("click", event => {
    const photoForm = document.querySelector(".photo-form-container");
    if (photoForm.classList.contains("hidden")) {
      photoForm.classList.remove("hidden");
    } else {
      photoForm.classList.add("hidden");
    }
  });

  document.querySelector(".photo-url-submit").addEventListener("click", event => {
    event.preventDefault();
    const input = document.querySelector(".photo-url-input");
    const photo = input.value;
    const addLi = document.createElement("li");
    // const addImg = document.createElement("img");
    const dogContainer = document.querySelector(".dog-photos");
    // addImg.src = photo;
    addLi.textContent = (`<img src="${photo}"/>`);

    dogContainer.appendChild(addLi);
    // addLi.innerHTML = addLi.innerHTML + 

  });


});
