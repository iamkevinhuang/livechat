$(document).ready(() => {
  $('#new_room_message').on('ajax:success', (a, b, c)  => {
    $('#room_message_content').val('');
  });
});