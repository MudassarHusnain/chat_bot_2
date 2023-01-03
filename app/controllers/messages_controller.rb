class MessagesController < ApplicationController
  before_action :authenticate_user!
  def index
    @room=Room.find_by(id:params[:id])
    @rooms=Room.all
    # @messages=Message.all
    # @room_id=params[:id]
  end

  def new

  end

  def create
    @message=Message.new(message_params)
    @message.user_id=current_user.id
    # @message.room_id=room.id

    @message.save
      html=render(
        partial: "messages/message",
        locals: {message:@message},
      )
      # debugger
      ActionCable.server.broadcast "room_channel_#{@message.room_id}",{html:html}

    # redirect_to root_path and return
  end
  private
  def message_params
    params.require(:message).permit(:content,:room_id)
  end
end
