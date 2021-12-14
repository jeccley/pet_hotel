FactoryBot.define do
  factory :booking do
    drop_off { Date.today }
    pick_up { Date.today + 14 }
    notes { 'Look after foofoo well please!' }
  end
end
