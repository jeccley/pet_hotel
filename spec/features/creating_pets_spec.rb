require 'rails_helper'

RSpec.feature 'Users can create new pets' do
  before do
    booking = FactoryBot.create(:booking, name: 'Regular Customer')

    visit booking_path(booking)
    click_link 'New Pet'
  end

  scenario 'with valid attributes' do
    fill_in 'Name', with: 'Thumper'
    select 'Dwarf Rabbit', from: 'Animal'
    check 'Vaccinated'
    click_button 'Create Pet'

    expect(page).to have_content 'Pet has been created.'
  end

  scenario 'when providing invalid attributes' do
    click_button 'Create Pet'

    expect(page).to have_content 'Pet has not been created.'
    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Animal can't be blank"
  end
end
