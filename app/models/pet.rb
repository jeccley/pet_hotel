class Pet < ApplicationRecord
  belongs_to :customer
  has_many :booked_pets, dependent: :destroy
  has_many :bookings, through: :booked_pets

  validates :name, presence: true
  validates :animal, presence: true
  validates :status, presence: true
end
