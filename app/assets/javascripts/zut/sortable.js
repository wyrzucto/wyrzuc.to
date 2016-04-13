$(document).on('ready', function() {
  if ($('table.table-sortable').size()) {
    $('table.table-sortable').sortable({
      axis: 'y',
      items: '.sortable',
      cursor: 'move',
      update: function(e, ui) {
        var itemId = ui.item.data('item-id');
        var position = ui.item.index();
        $.post(location.pathname + '/route_containers/' + itemId + '/move', { position: position }, 'json')

      }
    });
  }
})
