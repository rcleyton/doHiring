// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
import 'bootstrap'
import 'bootstrap/dist/css/bootstrap'

import Rails from "@rails/ujs"
import "@hotwired/turbo-rails"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
ActiveStorage.start()

require("@nathanvda/cocoon")

$(document).on("turbolinks:load", () => {
  console.log("turbolinks!");
});
$(document).on("turbo:load", () => {
  console.log("turbo!");
});

console.log('jello')
