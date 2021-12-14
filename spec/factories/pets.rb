FactoryBot.define do
  factory :pet do
    name { 'Example Pet' }
    animal { 'Rabbit' }
    vaccinated { true }
    status { 'Active' }
    notes { 'A particularly sensitive soul that needs peace and quiet!' }
  end
end
