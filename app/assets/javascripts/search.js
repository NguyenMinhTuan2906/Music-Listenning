$(document).ready(function() {
  $('.search-box').on('keyup', function() {
    var key_name = $(this).val();
    $.ajax({
      url: '/admin/users',
      type: 'get',
      dataType: 'json',
      data: {name: key_name},
    })
    .done(function(data) {
      $('.user-table').html(data.search_result);
    });
    return false;
  });
});
