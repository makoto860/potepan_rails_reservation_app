class Reservation < ApplicationRecord
  belongs_to :room
  belongs_to :user

  def save_reservation(reservation, reservation_params)
    reservation.check_in_date = reservation_params[:check_in_date]
    reservation.check_out_date = reservation_params[:check_out_date]
    reservation.total_date = reservation_params[:total_date]
    reservation.total_people = reservation_params[:total_people]    
    reservation.total_fee = reservation_params[:total_fee]
    reservation.user_id = reservation_params[:user_id]
    reservation.room_id = reservation_params[:room_id]
    save
  end

  def sum_of_days
    (check_out_date.to_date - check_in_date.to_date).to_i if check_in_date.present? && check_out_date.present?
  end

  def sum_of_fee
    (room.fee * total_people * sum_of_days).to_i if check_in_date.present? && check_out_date.present?
  end
end
