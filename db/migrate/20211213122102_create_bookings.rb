class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.date :drop_off
      t.date :pick_up
      t.text :notes
      t.references :customer, null: false, foreign_key: true
      t.timestamps
    end
  end
end
