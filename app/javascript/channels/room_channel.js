import consumer from "./consumer"

$(function() {
  $('[data-channel-subscribe="room"]').each(function(index, element) {
    var $element = $(element);
    var room_id = $element.data('room-id');
    var user_id = $element.data('user-id');
    var messageTemplateMe = $('[data-role="message-template-me"]');
    var messageTemplateTheir = $('[data-role="message-template-their"]');

    $element.animate({ scrollTop: $element.prop("scrollHeight")}, 1000)        

    consumer.subscriptions.create({channel: "RoomChannel", room: room_id}, {
      connected() {
        console.log("connected to", room_id, "with user", user_id)
        // Called when the subscription is ready for use on the server
      },

      disconnected() {
        // Called when the subscription has been terminated by the server
      },

      received(data) {
        // Called when there's incoming data on the websocket for this channel
        console.log(data);

        if (user_id === data.user_id){
          var content = messageTemplateMe.children().clone(true, true);
        } else {
          var content = messageTemplateTheir.children().clone(true, true);
        }

        if (data.image_url.length > 0){
          content.find('[data-role="attached-image"]').attr('src', data.image_url);
        }
        else{
          content.find('[data-role="attached-image"]').css("display", "none");
        }

        if (data.reply_to_content.length > 0){
          content.find('[data-role="reply-to-content"]').text(data.reply_to_content);
          content.find('[data-role="reply-to-username"]').text(data.reply_to_username);
        }
        else{
          content.find('[data-role="container-of-reply"]').css("display", "none");
        }

        content.find('[data-role="user-avatar"]').attr('src', data.user_avatar);
        content.find('[data-role="message-text"]').text(data.content);
        content.find('[data-role="user-author-timestamp"]').append(data.author_and_timestamp);
        content.find('[data-role="reply-to"]').attr('href', "/rooms?room_id=" + data.room_id + "&reply_to=" + data.id + "&author=" + data.author_and_timestamp.split(" - ")[0] + "&message=" + data.content);
        $element.append(content);
        $element.animate({ scrollTop: $element.prop("scrollHeight")}, 1000);
      }
    });
  });
});


