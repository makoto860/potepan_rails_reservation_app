class ReservationsController < ApplicationController

  def confirmation
    @room = Room.find(params[:reservation][:room_id])
    @reservation = @room.reservations.new(reservation_params)
    if @reservation.save
      redirect_to reservations_confirmation_path, notice: '予約が完了しました。'
    else
      @room = @reservation.room
      render :confirmation, alert: '予約が完了できませんでした。', status: :unprocessable_entity
    end
  end

  def index
    @reservations = current_user.reservations.all
  end

  def new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      redirect_to confirmation_reservations_path, notice: '予約が完了しました。'
    else
      @room = @reservation.room
      render :confirmation, alert: '予約が完了できませんでした。', status: :unprocessable_entity
    end
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
      params.require(:reservation).permit(:check_in_date, :check_out_date, :total_date, :total_people, :total_fee, :room_id, :user_id).merge(user_id: current_user.id, room_id: params[:room_id])
    end
end
