class RoomsController < ApplicationController
  before_action :authenticate_user!
  def index
    @rooms=Room.all
  end

  def show
    @room=Room.find_by(id: params[:id])
    @rooms=Room.all
    @messages=Message.all
  end

  def new
  end
  def create
    @room=Room.new(room_params)
    if @room.save
      redirect_to root_path
    end
  end
  private
  def set_room
    @room=Room.find(params[:id])
  end
  def room_params
    params.require(:room).permit(:name)
  end

end
