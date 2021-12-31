# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Users can edit existing bookings' do
  let(:customer) { FactoryBot.create(:customer) }
  let(:booking) { FactoryBot.create(:booking, customer: customer) }

  before do
    visit customer_booking_path(customer, booking)
    click_link 'Edit Booking'
  end

  scenario 'with valid attributes' do
    fill_in 'Notes', with: 'Look after Blackberry foofoo well please!'
    click_button 'Update Booking'

    expect(page).to have_content 'Booking has been updated.'
    expect(page).to have_content 'Blackberry'
  end

  scenario 'when providing invalid attributes' do
    fill_in 'Drop off', with: nil
    click_button 'Update Booking'

    expect(page).to have_content 'Booking has not been updated.'
    expect(page).to have_content "Drop off can't be blank"
  end
end
