# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Users can delete bookings' do
  let(:customer) { FactoryBot.create(:customer) }
  let(:booking) { FactoryBot.create(:booking, customer:) }

  before do
    visit customer_booking_path(customer, booking)
  end

  scenario 'succssfully' do
    click_link 'Delete Booking'

    expect(page).to have_content 'Booking has been deleted.'
    expect(page.current_url).to eq customer_url(customer)
    expect(page).to have_no_content 'foofoo'
  end
end
