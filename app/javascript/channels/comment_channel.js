import consumer from "./consumer"

consumer.subscriptions.create("CommentChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const html = `<p>${data.content.text}</p>`;
    const commnets = document.getElementById('commnets');
    const newComment = document.getElementById('comment_text');
    commnets.insertAdjacentHTML('afterbegin', html);
    newComment.value='';
    // Called when there's incoming data on the websocket for this channel
  }
});
