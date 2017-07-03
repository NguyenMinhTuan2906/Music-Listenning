$(document).ready(function() {
  $('.search-box').on('keyup', function() {
    var key_name = $(this).val();
    var url_request = $(this).closest('form').attr('action');
    $.ajax({
      url: url_request,
      type: 'get',
      dataType: 'json',
      data: {name: key_name},
    })
    .done(function(data) {
      $('.list-table').html(data.search_result);
    });
    return false;
  });
});
