# frozen_string_literal: true

FactoryBot.define do
  factory :pet do
    name { 'Example Pet' }
    animal { 'Rabbit' }
    vaccinated { true }
    status { 'Active' }
    notes { 'A particularly sensitive soul that needs peace and quiet!' }
    association :author, factory: :user
  end
end
