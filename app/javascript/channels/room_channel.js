import consumer from "channels/consumer"

document.addEventListener('turbo:load', () => {

if(document.getElementById("room_id") != null){
  const room_element = document.getElementById("room_id");
  const room_id=Number(room_element.getAttribute('data-room-id'));
  consumer.subscriptions.create({channel: "RoomChannel",room_id:room_id}, {
    connected() {
      // Called when the subscription is ready for use on the server
      console.log("Connected......."+ room_id)
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
}else{
  console.log('document.getElementById("room_id") is NULL');
}

});