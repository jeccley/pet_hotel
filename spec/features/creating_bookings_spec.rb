require 'rails_helper'

RSpec.feature 'Users can create new bookings' do
  before do
    customer = FactoryBot.create(:customer, last_name: 'Customer')

    visit customer_path(customer)
    click_link 'New Booking'
  end

  scenario 'with valid attributes' do
    fill_in 'Drop off', with: Date.today
    fill_in 'Pick up', with: Date.today + 14
    fill_in 'Notes', with: 'Look after fluffy foofoo well please!'

    click_button 'Create Booking'

    expect(page).to have_content 'Booking has been created.'
    expect(page).to have_content 'Days: 14'
  end

  scenario 'when providing invalid attributes' do
    click_button 'Create Booking'

    expect(page).to have_content 'Booking has not been created.'
    expect(page).to have_content "Drop off can't be blank"
    expect(page).to have_content "Pick up can't be blank"
  end
end
