class RoomsController < ApplicationController
  before_action :set_user

  def index
    @user = User.find_by(params[:user_name])
    @rooms = Room.all
  end

  def new
    @user = User.find_by(params[:user_name])
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)

    if @room.room_avatar.attached?
      @room.room_avatar.attach(params[:room][:room_avatar])
    else
      @room.room_avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'default-room-avatar.png')),
      filename: 'default-room-avatar.png',
      content_type: 'image/png')
    end

    if @room.save
      flash[:notice] = "施設を新規登録しました"
      redirect_to :rooms, id: @room.id
    else
      flash[:alert] = "施設を登録できませんでした"
      render :new, status: :unprocessable_entity
    end

  end

  def show
    @room = Room.find(params[:id])
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    @room.user_id = current_user.id

    if @room.room_avatar.attached?
      @room.room_avatar.attach(params[:room][:room_avatar])
    else
      @room.room_avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'default-room-avatar.png')),
      filename: 'default-room-avatar.png',
      content_type: 'image/png')
    end

    if @room.update(room_params)
      flash[:notice] = "施設IDが「#{@room.id}」の情報を更新しました"
      redirect_to :rooms, id: @room.id
    else
      flash[:alert] = "RoomIDが「#{@room.id}」の情報を更新できませんでした"
      render "edit", status: :unprocessable_entity
    end

  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    flash[:notice] = "施設を削除しました"
    redirect_to :rooms
  end

  private
    def room_params
      params.require(:room).permit(:room_name, :room_detail, :fee, :address, :room_avatar).merge(user_id: current_user.id)
    end

    def set_user
      @user = User.find_by(params[:id])
    end
end
