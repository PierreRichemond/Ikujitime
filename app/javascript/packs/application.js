// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import 'owl.carousel/dist/assets/owl.carousel.css';
import 'owl.carousel';
import { initFlatpickr } from "../plugins/flatpickr";
import "controllers";

initFlatpickr();
Rails.start()
Turbolinks.start()
ActiveStorage.start()


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";

// Internal imports, e.g:
import { activeBtn } from "../channels/active_class";
import { previewImageOnFileSelect } from "../components/photo_preview";
import { previewUpdateImageOnFile } from "../components/edit_photo_preview";


document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  initFlatpickr();
  $('.owl-carousel').owlCarousel({
    loop: true,
    margin: 10,
    responsive: {
      0: {
        items: 1
      },
      600: {
        items: 3
      },
      1000: {
        items: 5
      }
    },
    nav: true,
    navText: ["<i class='fa fa-chevron-left'></i>", "<i class='fa fa-chevron-right'></i>"]
  })
  activeBtn();
  previewImageOnFileSelect();
  previewUpdateImageOnFile();

  const anchors = document.querySelector(".activity-tag").querySelectorAll("a")
  console.log(anchors)

  function getUrl(event) {
    const url = event.target.href
    console.log(url)
    console.log(event)
    fetch(url, {
      method: 'GET',
      headers: { 'Accept': "application/json", 'Content-Type': 'application/json' }
    })
      .then(response => JSON.stringify(response))
      .then((data) => {
        // data = JSON.parse(data)
        console.log(data)


        // const activeTag = document.querySelector('.active-btn')
        // activeTag.classList.remove("active-btn")
        // const tag = document.getElementById(`tag-${data.tag}`)
        // tag.classList.add("active-btn")
        // // debugger
        // document.getElementById('image').setAttribute('src', data.image)
        // console.log(document.getElementById('image'))

        // document.getElementById('map').setAttribute('data-markers', JSON.stringify(data.json_markers))
        // initMapbox();
      });
  }

  anchors.forEach(link => {
    link.addEventListener('click', getUrl);
  })

});
