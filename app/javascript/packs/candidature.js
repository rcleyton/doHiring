// candidatures.js

$(document).on('ajax:success', 'a[data-remote=true]', function(e, data) {
  if (data.success) {
    if (data.favorite) {
      $('.favorite-applicant').show();
    } else {
      $('.favorite-applicant').hide();
    }
  }
})
