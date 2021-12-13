class Customer < ApplicationRecord
  validates :name, :phone, :email, presence: true
  # has_many :pets
  # has_many :bookings
end
