class Room < ApplicationRecord
  belongs_to :user

  has_many :reservations

  has_one_attached :room_avatar

  def reservations_new
    reservations.new
  end

  validates :room_name, presence: true
  validates :room_detail, presence: true
  validates :fee, presence: true, numericality: { greater_than_or_equal_to: 1, message: "は1円以上にしてください" }
  validates :address, presence: true

  def self.search(search)
    if search != ""
      Room.where(['room_name LIKE(?) OR room_detail LIKE(?)', "%#{search}%", "%#{search}%"])
    else
    end
  end
end
