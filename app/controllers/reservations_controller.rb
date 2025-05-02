class ReservationsController < ApplicationController
  def index
    @reservations = current_user.reservations.all
    @user = User.find(current_user.id)
  end

  def confirmation
    @room = Room.find(params[:reservation][:room_id])
    @user = User.find(params[:reservation][:user_id])
    @check_in_date = params[:reservation][:check_in_date]
    @check_out_date = params[:reservation][:check_out_date]
    @total_people = params[:reservation][:total_people]
    @reservation = @room.reservations.new(reservation_params)

    if @reservation.save
      flash[:notice] = "予約が完了しました。"
      redirect_to reservations_path
    else
      flash[:alert] = "予約が完了できませんでした。"
      @room = @reservation.room
      render :confirmation, status: :unprocessable_entity
    end
  end

  def new
  end

  def create
    @room = Room.find(params[:reservation][:room_id])
    @reservation = @room.reservations.new(reservation_params)
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def reservation_params
      params.require(:reservation).permit(:check_in_date, :check_out_date, :total_date, :total_people, :total_fee).merge(user_id: current_user.id, room_id: params[:room_id])
    end
end
