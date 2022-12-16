import consumer from "channels/consumer"

const room_element=document.getElementById("room_id");
const room_id=Number(room_element.getAttribute('data-room-id'));
consumer.subscriptions.create({channel: "RoomChannel",room_id:room_id}, {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log("connected to the channel")
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
    console.log("Disconnected ......")
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    // debugger
    console.log(data)
    const messageContainer=document.getElementById("messages")
    messageContainer.innerHTML=messageContainer.innerHTML+data.html
  }
});

