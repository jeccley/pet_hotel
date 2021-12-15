class ChangeCustomerColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :customers, :name, :first_name
  end
end
