$(function(){
  function buildHTML(comment){
    var html = `<div class="block" id="block-number${comment.comment_id}">
                  <div class="block__text">
                    ${comment.text}
                    <a class="block__user-name" href=/users/${comment.user_id}>${comment.user_name}</a>
                  </div>
                  <div class="block__date-delete">
                    ${comment.created_at}
                      <a data-confirm="削除してよろしいですか？" data-remote="true" rel="nofollow" data-method="delete" href="/posts/${comment.post_id}/comments/${comment.comment_id}">
                        <i class="fas fa-trash-alt"></i>
                      </a>
                  </div>
                </div>` 
    return html;
  }
  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.comments__list__show').append(html);
      $('.comments__area').val('');
      $('.comments__input').prop('disabled', false);
      $('.comments__list__show').animate({ scrollTop: $('.comments__list__show')[0].scrollHeight});
      return false
    })
    .fail(function(){
      alert('error');
    })
  })
})
