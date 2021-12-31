# frozen_string_literal: true

class AddAuthorToBookings < ActiveRecord::Migration[6.1]
  def change
    add_reference :bookings, :author, null: false, foreign_key: { to_table: :users }
  end
end
