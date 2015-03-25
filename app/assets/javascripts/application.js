//= require jquery
//= require jquery_ujs
//= require application/scroll
//= require application/home

var defaultLocation = new google.maps.LatLng(54.349783, 18.645224);

var mapOptions = {
  center: defaultLocation,
  mapTypeControl: false,
  panControl: false,
  zoomControl: false,
  // zoomControlOptions: { position: google.maps.ControlPosition.LEFT_BOTTOM },
  zoom: 11,
};

var clustererOptions = {
  gridSize: 50,
  maxZoom: 15
};

var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

var markerClusterer = new MarkerClusterer(map, [], clustererOptions);

//var SQUARE_PIN = 'M 50 -119.876 -50 -119.876 -50 -19.876 -13.232 -19.876 0.199 0 13.63 -19.876 50 -19.876 Z';

var centerTo = function(location, zoom) {
  map.panTo(location);
  map.setZoom(zoom);
}
