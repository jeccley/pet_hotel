class CreateBookedPets < ActiveRecord::Migration[6.1]
  def change
    create_table :booked_pets do |t|
      t.references :pet, null: false, foreign_key: true
      t.references :booking, null: false, foreign_key: true

      t.timestamps
    end
  end
end
