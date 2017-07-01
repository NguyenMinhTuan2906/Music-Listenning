$(document).ready(function() {
  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    var url_comment = $(this).attr('action');
    $.ajax({
      url: url_comment,
      type: 'post',
      dataType: 'json',
      data: $(this).serialize(),
    })

    .done(function(data) {
      $('.commentList').append(data.content);
    })

    .fail(function() {
      alert('We got errors');
    });
    return false;
  });
});
