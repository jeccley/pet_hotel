require 'rails_helper'

RSpec.feature 'Users can edit existing bookings' do
  let(:customer) { FactoryBot.create(:customer) }
  let(:pet) { FactoryBot.create(:pet, customer: customer) }

  before do
    visit customer_pet_path(customer, pet)
    click_link 'Edit Pet'
  end

  scenario 'with valid attributes' do
    select 'Large Rabbit', from: 'Animal'
    fill_in 'Notes', with: 'Do not place near other rabbits!'
    uncheck 'Vaccinated'

    click_button 'Update Pet'

    expect(page).to have_content 'False'
    expect(page).to have_content 'Large Rabbit'
    expect(page).to have_content 'Do not place near other rabbits!'
    expect(page).to have_content 'Pet has been updated.'
  end

  scenario 'when providing invalid attributes' do
    fill_in 'Name', with: ''
    click_button 'Update Pet'

    expect(page).to have_content 'Pet has not been updated.'
    expect(page).to have_content "Name can't be blank"
  end
end
