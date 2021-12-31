# frozen_string_literal: true

FactoryBot.define do
  factory :booking do
    drop_off { Date.today }
    pick_up { Date.today + 14 }
    notes { 'Look after foofoo well please!' }
    association :author, factory: :user
  end
end
