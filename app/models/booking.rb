class Booking < ApplicationRecord
  belongs_to :customer

  validates :drop_off, :pick_up, presence: true
end
