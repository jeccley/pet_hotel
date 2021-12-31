# frozen_string_literal: true

class AddAuthorToPets < ActiveRecord::Migration[6.1]
  def change
    add_reference :pets, :author, null: false, foreign_key: { to_table: :users }
  end
end
