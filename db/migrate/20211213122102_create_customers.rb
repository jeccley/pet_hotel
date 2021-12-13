class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.text :notes
      t.text :vet_details

      t.timestamps
    end
  end
end
