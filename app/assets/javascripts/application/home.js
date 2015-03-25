$(function(){

  var markers      = [];
  var markersCache = {};
  var infowindow   = new google.maps.InfoWindow();

  function addMrkersToCache(key, items){
    markersCache[key] = items.map(function(item){
      var marker =  new google.maps.Marker({
        title: item[0],
        position: new google.maps.LatLng(item[1], item[2])
      });
      google.maps.event.addListener(marker, 'click', function() {
        infowindow.setContent("<span style='color: black;'>"+this.title+"</span>");
        infowindow.open(map, this);
      });
      return marker;
    });
  }

  $(".x-left-button").on('click', function() {
    var url       = $(this).data('url');
    var click     = $(this).data('click');
    var object_id = $(this).attr('id');

    if(click){
      markerClusterer.removeMarkers(markersCache[object_id], false);
    }
    else {
      if(markersCache[object_id]){
        markerClusterer.addMarkers(markersCache[object_id], false);
      }
      else{
        $.ajax({
          url: url,
          dataType: 'json'
        }).done(function(data){
          addMrkersToCache(object_id, data)
          markerClusterer.addMarkers(markersCache[object_id], false);
        });
      }
    }
    $(this).data("click", !click);
  });

  $(".x-left-button").hover(
    function(){
      $(this).animate({"width": "315px"}, 0);
      $(this).find('span').removeClass('hidden');
    }, function(){
      $(this).animate({"width": "45px"}, 0);
      $(this).find('span').addClass('hidden');
    }
  );

  $(".right-button").on("click", function(){
    if($(this).hasClass("open")) {
      $(this).animate({"right": "0"});
      $(".right-content").animate({"right": "-300px"});
      $(this).removeClass("open");
    }
    else {
      $(this).animate({"right": "300px"});
      $(".right-content").animate({"right": "0"});
      $(this).addClass("open");
    }
  });
});
