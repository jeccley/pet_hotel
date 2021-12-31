class Booking < ApplicationRecord
  belongs_to :customer
  has_many :booked_pets, dependent: :destroy
  has_many :pets, through: :booked_pets

  validates :drop_off, :pick_up, presence: true

  def days
    pick_up.jd - drop_off.jd
  end
end
