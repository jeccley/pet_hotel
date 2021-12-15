class AddLastNameToCustomer < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :last_name, :string

    Customer.all.each do |c|
      names = c.first_name.split
      c.first_name = names.first
      c.last_name = names.last
      c.save
    end
  end
end
