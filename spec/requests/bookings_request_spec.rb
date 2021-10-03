require 'rails_helper'

RSpec.describe 'Bookings', type: :request do
  it 'Handles a missing booking correctly' do
    get booking_path('not-here')

    expect(response).to redirect_to(bookings_path)

    message = 'The booking you were looking for could not be found.'
    expect(flash[:alert]).to eq(message)
  end
end
