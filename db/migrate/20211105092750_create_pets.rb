# frozen_string_literal: true

class CreatePets < ActiveRecord::Migration[6.1]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :animal
      t.boolean :vaccinated, default: false
      t.string :status
      t.text :notes
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
