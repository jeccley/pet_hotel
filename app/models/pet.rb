class Pet < ApplicationRecord
  belongs_to :customer
  belongs_to :author, class_name: 'User'

  validates :name, presence: true
  validates :animal, presence: true
  validates :status, presence: true
end
