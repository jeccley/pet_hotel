FactoryBot.define do
  factory :pet do
    name { 'Example Pet' }
    animal { 'Rabbit' }
    vaccinated { true }
    status { 'Active' }
  end
end
