class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.datetime :check_in_date
      t.datetime :check_out_date
      t.integer :total_date
      t.integer :total_people
      t.integer :total_fee
      t.integer :user_id
      t.integer :room_id

      t.timestamps
    end
  end
end
