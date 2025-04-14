class RoomsController < ApplicationController
  def index
    @user = User.find_by(params[:user_name])
    @rooms = Room.all
  end

  def new
    @user = User.find_by(params[:user_name])
    @room = Room.new
  end

  def create
    @room = Room.new(params.require(:room).permit(:room_name, :room_detail, :fee, :room_avatar, :user_id, :address))
    if @room.save
      flash[:notice] = "施設を新規登録しました"
      redirect_to :rooms
    else
      render "new"
    end
  end

  def show
    @user = User.find_by(params[:user_name])
    @room = Room.find(params[:id])
  end

  def edit
    @user = User.find_by(params[:user_name])
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(params.require(:room).permit(:room_name, :room_detail, :fee, :room_avatar, :user_id, :address))
      flash[:notice] = "施設IDが「#{@room.id}」の情報を更新しました"
      redirect_to :rooms
    else
      render "edit"
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    flash[:notice] = "施設を削除しました"
    redirect_to :rooms
  end
end
