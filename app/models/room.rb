class Room < ApplicationRecord
  belongs_to :user
  has_one_attached :room_avatar
end
