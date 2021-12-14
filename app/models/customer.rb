class Customer < ApplicationRecord
  validates :name, :phone, :email, presence: true

  has_many :bookings, -> { order(drop_off: :asc) }, dependent: :destroy
  has_many :pets, -> { order(name: :asc) }, dependent: :destroy
end
