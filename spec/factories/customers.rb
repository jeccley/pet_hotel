FactoryBot.define do
  factory :customer do
    first_name { 'Regular' }
    last_name { 'Customer' }
    phone { '07931514075' }
    email { 'reg@test.com' }
    notes { 'A bit of a memo about the pets' }
    vet_details { 'Gayton Surgery in Reigate' }
  end
end
