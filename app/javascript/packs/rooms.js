$(() => {
  $('#new_room_message').on('ajax:success', (a, b, c)  => {
    $('#room_message_content').val('');
    $('#room_message_image').val('');
    $('#room_message_reply_to_id').val('');
  });

  $('div #reply_button').on('ajax:success', (event)  => {
    document.getElementById("room_message_content").focus();
    let reply_to = event.target.href.split('reply_to=')[1].split('&')[0]
    let reply_to_message = event.target.href.split('author=')[1].split('&')[0]
    let reply_to_content = event.target.href.split('message=')[1].split('&')[0]
    document.getElementById("reply-name-dialog").innerHTML = toTitleCase(reply_to_message);
    document.getElementById("reply-content-dialog").innerHTML = reply_to_content;
    document.getElementById("dialog-reply").style.display = 'block';
    document.getElementById("room_message_reply_to_id").value = reply_to;
  });

  $('#cancel_reply').on('click', ()  => {
    document.getElementById("dialog-reply").style.display = 'none';
    $('#room_message_reply_to_id').val('');
  });

  toTitleCase = (str) => {
    return str.replace(
      /\w\S*/g,
      function(txt) {
        return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();
      }
    );
  }

});