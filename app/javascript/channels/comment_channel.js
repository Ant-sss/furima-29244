import consumer from "./consumer"

consumer.subscriptions.create("CommentChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const html_text = `<p>${data.content.text}</p>`;
    const html_user = `<p>${data.content.user_id}</p>`;
    const comments = document.getElementById('comment');
    const newComment = document.getElementById('comment_text');
    comments.insertAdjacentHTML('afterbegin', html_text);
    comments.insertAdjacentHTML('afterbegin', html_user);
    newComment.value='';
    // Called when there's incoming data on the websocket for this channel
  }
});
