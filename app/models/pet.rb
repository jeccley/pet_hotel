# frozen_string_literal: true

class Pet < ApplicationRecord
  belongs_to :customer
  belongs_to :author, class_name: 'User'

  has_many :booked_pets, dependent: :destroy
  has_many :bookings, through: :booked_pets

  validates :name, presence: true
  validates :animal, presence: true
  validates :status, presence: true
end
