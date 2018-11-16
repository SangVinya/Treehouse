$(function() {

  $('form').submit(function (evt) {
    evt.preventDefault();
    let $searchField = $('#search');
    let flickrAPI = "https://api.flickr.com/services/feeds/photos_public.gne?jsoncallback=?";
    let animal = $searchField.val();
    let flickrOptions = {
      tags: animal,
      format: "json"
    };
    function displayPhotos(data) {
      let photoHTML = '<ul class="row">';
      $.each(data.items, function (i, photo) {
        photoHTML += '<li class="photo">';
        photoHTML += '<a href="' + photo.link + '">';
        photoHTML += '<img src="' + photo.media.m + '"></a></li>';
      });
      photoHTML += '</ul>';
      $('#photos').html(photoHTML);
    }
    $.getJSON(flickrAPI, flickrOptions, displayPhotos);
  });
});







