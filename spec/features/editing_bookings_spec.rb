require 'rails_helper'

RSpec.feature 'Users can edit existing bookings' do
  before do
    FactoryBot.create(:booking, name: 'Regular Customer')

    visit '/'
    click_link 'Regular Customer'
    click_link 'Edit Booking'
  end

  scenario 'with valid attributes' do
    fill_in 'Name', with: 'Blackberry'
    click_button 'Update Booking'

    expect(page).to have_content 'Booking has been updated.'
    expect(page).to have_content 'Blackberry'
  end

  scenario 'when providing invalid attributes' do
    fill_in 'Name', with: ''
    click_button 'Update Booking'

    expect(page).to have_content 'Booking has not been updated.'
    expect(page).to have_content "Name can't be blank"
  end
end
