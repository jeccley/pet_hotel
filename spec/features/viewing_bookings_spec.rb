require 'rails_helper'

RSpec.feature 'Users can view bookings' do
  let(:customer) { FactoryBot.create(:customer) }
  let(:booking) { FactoryBot.create(:booking, customer: customer) }

  before do
    visit customer_booking_path(customer, booking)
  end

  scenario 'with the booking details' do
    visit '/'
    click_link customer.name
    click_link booking.drop_off.to_s
    expect(page).to have_content booking.drop_off.to_s
    expect(page).to have_content booking.notes
    expect(page).to have_content customer.name
    expect(page.current_path).to eq customer_booking_path(customer, booking)
  end
end
