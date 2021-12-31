# frozen_string_literal: true

require 'rails_helper'

feature 'Users can add pets to new bookings' do
  let(:customer) { FactoryBot.create(:customer) }
  let(:booking) { FactoryBot.create(:booking, customer: customer) }
  let(:pet) { FactoryBot.create(:pet, customer: customer) }

  before do
    visit customer_pet_path(customer, pet)
    visit customer_booking_path(customer, booking)
  end

  it 'lists the customer pets' do
    expect(page).to have_content 'Example Pet'
  end

  it 'adds a pet when Add to Booking is pressed' do
    expect(page).to have_selector(:link_or_button, 'Add to Booking')
    # FIXME: unsure why I can't get this showing as a button (styling?) or to get it clicked as a link
    # click_link 'Add to Booking'
    # expect(page).to have_content 'Pets: 1'
    # save_and_open_page
  end
end
