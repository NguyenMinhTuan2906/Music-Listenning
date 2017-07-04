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
      $('.comments_size').html((parseInt($('.comments_size').text()) + 1));
      $('#comment_content').val('');
    })

    .fail(function() {
      alert(I18n.t('javascript.comment_error'));
    });
    return false;
  });
});
