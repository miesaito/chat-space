$(document).on('turbolinks:load', function(){

  var message_text = $(".right-contents-middle");

  function appendProduct(message) {
    var image = (message.image.url) ? `<img src = ${ message.image.url }>` : "";
    var html = `<div class="message" data-message-id="${message.id}">
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

    setInterval(function(){
      var message = $('.message').last().data('message-id');

      var url = $(location).attr('href')

      $.ajax({
        type: 'GET',
        url: url,
        data: { id: message},
        dataType: 'json'
      })

      .done(function(data){
        data.forEach(function(message){
          var html = appendProduct(message);
        $('.right-contents-middle').append(html);
        $('.send').removeAttr('disabled');
        $('.right-contents-middle').animate({scrollTop: $('.right-contents-middle')[0].scrollHeight}, 'fast');
        })
      })
    },5000);

});

