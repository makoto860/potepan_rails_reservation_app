class RoomsController < ApplicationController
  before_action :set_user

  def search
    @rooms = Room.search(params[:keyword])
    redirect_to rooms_own_path(keyword: params[:keyword])
  end

  def own
    @rooms = Room.all

    if params[:keyword].present?
      @rooms = Room.search(params[:keyword])
    else
    end
  end

  def index
  end

  def new
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
      redirect_to room_path(@room)
    else
      flash[:alert] = "施設を登録できませんでした"
      render :new, status: :unprocessable_entity
    end

  end

  def show
    @room = Room.find(params[:id])
    @reservations = @room.reservations
    @reservation = @reservations.new
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
      redirect_to room_path(@room)
    else
      flash[:alert] = "RoomIDが「#{@room.id}」の情報を更新できませんでした"
      render "edit", status: :unprocessable_entity
    end

  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    flash[:notice] = "施設を削除しました"
    redirect_to rooms_own_path
  end

  private
    def room_params
      params.require(:room).permit(:room_name, :room_detail, :fee, :address, :room_avatar).merge(user_id: current_user.id)
    end

    def set_user
      @user = User.find(current_user.id)
    end
end
