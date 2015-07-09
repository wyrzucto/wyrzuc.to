$(function(){

  $.each(wastes_urls, function(i, url) {
    $.ajax({
      url: '/geolocations/' + url,
      dataType: 'json'
    }).done(function(data){
      addToMrkersCache(url, data)
      markerClusterer.addMarkers(markersCache[url], false);
    });
  });

  var addToMrkersCache = function(key, items){
    markersCache[key] = items.map(function(item){
      var marker =  new google.maps.Marker({
        icon: "/markers/" + key + ".png",
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

  $.each($('.types a'), function(it, a) {
    a = $(a);
    a.data('width', a.width() + 32);
  });

  $(".x-left-button").on('click', function(a) {
    a.preventDefault();
    var click     = $(this).data('click');
    var object_id = $(this).attr('id');

    if($(window).width() <= 640){
      $.ajax({
        url: '/place_info/all_places',
        data: { kind: object_id},
        dataType: 'script'
      });
    } else {
      if(click){
        $(this).css('width', $(this).data('width'));
        markerClusterer.addMarkers(markersCache[object_id], false);
      }
      else {
        $(this).css('width', '45px');
        markerClusterer.removeMarkers(markersCache[object_id], false);
      }
      $(this).data("click", !click);
    }
  });

  $(document).delegate('.sidebar .handle', 'click', function(e) {
    e.preventDefault();
    $('body').toggleClass('sidebarOpen');
  });

  var autocompleteData = function(path, request, response){
    $.ajax({
      url: '/home/' + path,
      data: { term: request.term },
      success: function(result){
        response(result['data']);
      }
    });
  }

  $('.x-autocomplete-phrases').autocomplete({
    source: function(request, response){
      autocompleteData('autocomplete_phrases', request, response)
    },
    select: function(event, ui) {
      $('.x-autocomplete-phrases').val(ui.item.value);
      $('.x-search-fraction-form').submit();
    }
  });

  $('.x-autocomplete-locations').autocomplete({
    source: function(request, response){
      autocompleteData('autocomplete_locations', request, response)
    },
    select: function(event, ui) {
      $('.x-autocomplete-locations').val(ui.item.value);
      $('.x-search-locations-form').submit();
    }
  });
});
