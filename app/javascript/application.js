// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener("turbo:load", function() {
  console.log("DOMContentLoaded event triggered");
  var flashElement = document.querySelector(".flash");
  console.log("Flash element:", flashElement);


  if (flashElement) {
    setTimeout(function() {
      console.log("removing flash element");
 
      flashElement.remove();
    }, 2000);
  }
});