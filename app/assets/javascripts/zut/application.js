//= require jquery
//= require jquery_ujs
//= require_self


$(document).on('ready', function() {

  if ($('#container-map').size()) {
    var map = $('#container-map');
    map.height(400);
    map.css('marginBottom', '20px');

    $('#wastes_packaging_waste_latitude').parents('.form-group').hide();
    $('#wastes_packaging_waste_longitude').parents('.form-group').hide();
  }
})

function initialize() {
  var cityLoc = { lat: 54.3520500 , lng: 18.6463700 };
  var marker = null;

  var map = new google.maps.Map(document.getElementById('container-map'), {
    zoom: 15,
    center: cityLoc
  });

  var addMarker = function(location, map) {
    if (marker) {
      console.log(marker)
      marker.setMap(null);
      marker = null;
    }
    // Add the marker at the clicked location, and add the next-available label
    // from the array of alphabetical characters.
    marker = new google.maps.Marker({
      position: location,
      map: map
    });
    $('#wastes_packaging_waste_latitude').val(marker.position.lat());
    $('#wastes_packaging_waste_longitude').val(marker.position.lng());
  }

  google.maps.event.addListener(map, 'click', function(event) {
    addMarker(event.latLng, map);
  });

  if ($('#wastes_packaging_waste_latitude').size() && $('#wastes_packaging_waste_longitude').size()) {
    var markerPos = {lat: parseFloat($('#wastes_packaging_waste_latitude').val(), 10), lng: parseFloat($('#wastes_packaging_waste_longitude').val(), 10)};
    if (markerPos['lat'] != 0 && markerPos['lng'] != 0) {
      addMarker(markerPos, map);
      map.setCenter(markerPos);
    }
  }
}

google.maps.event.addDomListener(window, 'load', initialize);