# frozen_string_literal: true

class Customer < ApplicationRecord
  belongs_to :author, class_name: 'User'

  validates :first_name, :last_name, :phone, :email, presence: true

  has_many :bookings, -> { order(drop_off: :asc) }, dependent: :destroy
  has_many :pets, -> { order(name: :asc) }, dependent: :destroy

  def name
    [first_name, last_name].join(' ')
  end
end
