require 'rails_helper'

RSpec.describe 'Bookings', type: :request do
  it 'Handles a missing booking correctly' do
    customer = FactoryBot.create(:customer, name: 'Regular Customer')
    get customer_booking_path(customer, 'not-here')

    expect(response).to redirect_to(customer_bookings_path(customer))

    message = 'The booking you were looking for could not be found.'
    expect(flash[:alert]).to eq(message)
  end
end
