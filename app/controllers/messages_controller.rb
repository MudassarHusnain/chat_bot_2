class MessagesController < ApplicationController
  before_action :authenticate_user!
  def index
    # @roomid=params[:id]
    session[:room_id] = params[:id]
    @room=Room.find_by(id:params[:id])
    @rooms=Room.all
    @messages=Message.all
    @room_id=params[:id]
  end

  def new

  end

  def create
      # debugger
    session[:room_id]
    @message=Message.new(message_params)
    @message.user_id=current_user.id
    @message.room_id=session[:room_id].to_i
    @message.save
      html=render(partial: "messages/message_me",
        locals: {message:@message}

      )
   # respond_to do |format|
   #  if @message.save
   #    format.turbo_stream
   #    format.html { redirect_to messages_path(id: session[:room_id].to_i), notice: "Todo was successfully created." }
   #  else
   #    format.html { render :new, status: :unprocessable_entity }
   #  end
  # end
  #   debugger
      ActionCable.server.broadcast "room_channel_#{@message.room_id}", {html:html}
  end
  private
  def set_id
    @roomid=params[:id]
  end
  def message_params
    params.require(:message).permit(:content)
  end
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end
end
