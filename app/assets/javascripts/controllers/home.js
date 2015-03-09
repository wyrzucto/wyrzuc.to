$(function(){

  var userLocation = {
    lat: parseFloat($("#map-canvas").data('locationLat')),
    lng: parseFloat($("#map-canvas").data('locationLng'))
  }

  var mapOptions = {
    center: userLocation,
    mapTypeControl: false,
    panControl: false,
    zoomControlOptions: { position: google.maps.ControlPosition.LEFT_BOTTOM },
    zoom: 12,
  };

  var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

  var markers = [
      new google.maps.Marker({'position': new google.maps.LatLng(54.349783, 18.645224)}),
      new google.maps.Marker({'position': new google.maps.LatLng(54.349783, 18.646224)}),
      new google.maps.Marker({'position': new google.maps.LatLng(54.349783, 18.647224)}),
      new google.maps.Marker({'position': new google.maps.LatLng(54.349783, 18.648224)}),
      new google.maps.Marker({'position': new google.maps.LatLng(54.349783, 18.649224)}),
      new google.maps.Marker({'position': new google.maps.LatLng(54.349783, 18.644224)})
    ];

  function initialize() {
    agregateMarkers(markers);
  }

  function agregateMarkers(markers) {
    new MarkerClusterer(map, markers);
  }

  google.maps.event.addDomListener(window, 'load', initialize);
});
