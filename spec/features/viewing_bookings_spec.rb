require 'rails_helper'

RSpec.feature 'Users can view bookings' do
  scenario 'with the booking details' do
    booking = FactoryBot.create(:booking, name: 'Regular Customer')

    visit '/'
    click_link 'Regular Customer'

    expect(page.current_url).to eq booking_url(booking)
  end
end
