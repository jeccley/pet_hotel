class Booking < ApplicationRecord
  belongs_to :customer

  validates :drop_off, :pick_up, presence: true

  def days
    pick_up.jd - drop_off.jd
  end
end
