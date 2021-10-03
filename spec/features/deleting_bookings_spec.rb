require 'rails_helper'

RSpec.feature 'Users can delete bookings' do
  scenario 'succssfully' do
    FactoryBot.create(:booking, name: 'Regular Customer')

    visit '/'
    click_link 'Regular Customer'
    click_link 'Delete Booking'

    expect(page).to have_content 'Booking has been deleted.'
    expect(page.current_url).to eq bookings_url
    expect(page).to have_no_content 'Regular Customer'
  end
end
