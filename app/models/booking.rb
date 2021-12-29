class Booking < ApplicationRecord
  belongs_to :customer
  belongs_to :author, class_name: 'User'

  validates :drop_off, :pick_up, presence: true

  def days
    pick_up.jd - drop_off.jd
  end
end
