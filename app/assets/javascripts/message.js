$(document).on('turbolinks:load', function(){

  var message_text = $(".right-contents-middle");

  function appendProduct(message) {
    var image = (message.image.url) ? `<img src = ${ message.image.url }>` : "";
    var html = `<div class="message">
                  <div class="message-top">
                    <div class="message-name">
                      ${ message.name }
                    </div>
                    <div class="message-time">
                      ${ message.created_at }
                    </div>
                  </div>
                  <div class="message-text">
                    ${ message.text }
                    ${ image }
                  </div>
                </div>`
    return html
  }

  $('#new_message').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var input = $('this').attr('action')
    $.ajax({
      type: 'POST',
      url: input,
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })

    .done(function(data){
      var html = appendProduct(data);
      $('.right-contents-middle').append(html)
      $('.send').removeAttr('disabled');
      $('.right-contents-middle').animate({scrollTop: $('.right-contents-middle')[0].scrollHeight}, 'fast');
      $('.text').val('');
      $('.message_image').val('');
    })
    .fail(function() {
      alert('送信失敗しました');
    });
  });
});

