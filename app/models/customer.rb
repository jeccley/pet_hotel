class Customer < ApplicationRecord
  validates :name, :phone, :email, presence: true
  # has_many :pets
  has_many :bookings, -> { order(drop_off: :asc) }, dependent: :destroy
end
