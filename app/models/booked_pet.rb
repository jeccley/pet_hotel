# frozen_string_literal: true

class BookedPet < ApplicationRecord
  belongs_to :pet
  belongs_to :booking
end
