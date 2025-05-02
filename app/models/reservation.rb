class Reservation < ApplicationRecord
  belongs_to :room
  belongs_to :user

  validates :check_in_date, presence: true
  validates :check_out_date, presence: true
  validates :total_people, presence: true, numericality: { greater_than_or_equal_to: 1, message: "は1人以上にしてください" }
  validate :date_before_check_in
  validate :date_before_check_out

  def sum_of_days
    if check_in_date.present? && check_out_date.present?
      sum_of_days = (check_out_date.to_date - check_in_date.to_date).to_i
    else
      sum_of_days = 0
    end
  end

  def sum_of_fee
    if total_people.present?
      (room.fee * total_people * sum_of_days).to_i
    else
      sum_of_fee = 0
    end
  end

  def date_before_check_in
    return if check_in_date.blank?
    errors.add(:check_in_date, "チェックイン日は翌日以降の日にちを選択してください") if check_in_date < Date.today
  end

  def date_before_check_out
    return if check_out_date.blank? || check_in_date.blank?
    errors.add(:check_out_date, "チェックアウト日はチェックイン日以降の日にちを選択してください") if check_out_date < check_in_date
  end
end
