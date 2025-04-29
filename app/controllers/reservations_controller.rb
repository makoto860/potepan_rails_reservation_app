class ReservationsController < ApplicationController

  def confirmation
    @room = Room.find(params[:reservation][:room_id])
    @user = User.find(params[:reservation][:user_id])
    @check_in_date = params[:reservation][:check_in_date]
    @check_out_date = params[:reservation][:check_out_date]
    @total_people = params[:reservation][:total_people]
  end

  def index
    @reservations = Reservation.all
    @user = User.find(current_user.id)
  end

  def new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      redirect_to reservations_url, notice: '予約が確定しました。'
    else
      render :confirmation
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
      params.require(:reservation).permit(:check_in_date, :check_out_date, :total_date, :total_people, :total_fee, :room_id, :user_id)
    end
end
