class Pet < ApplicationRecord
  belongs_to :customer

  validates :name, presence: true
  validates :animal, presence: true
  validates :status, presence: true
end
