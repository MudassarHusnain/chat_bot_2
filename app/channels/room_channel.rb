class RoomChannel < ApplicationCable::Channel
  def subscribed
    # debugger
     stream_from "room_channel_#{params[:room_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
