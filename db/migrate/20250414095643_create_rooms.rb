class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :room_avatar
      t.string :room_name
      t.text :room_detail
      t.integer :fee
      t.integer :user_id
      t.string :address

      t.timestamps
    end
  end
end
