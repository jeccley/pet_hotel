class Pet < ApplicationRecord
  belongs_to :booking

  validates :name, presence: true
  validates :animal, presence: true
end
