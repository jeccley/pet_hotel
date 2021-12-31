class BookedPet < ApplicationRecord
  belongs_to :pet
  belongs_to :booking
end
