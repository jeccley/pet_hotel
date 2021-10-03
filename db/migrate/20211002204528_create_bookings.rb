class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.string :name
      t.date :drop_off
      t.date :pick_up

      t.timestamps
    end
  end
end
