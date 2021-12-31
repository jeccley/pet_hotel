# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Customers', type: :request do
  it 'Handles a missing customer correctly' do
    get customer_path('not-here')

    expect(response).to redirect_to(customers_path)

    message = 'The customer you were looking for could not be found.'
    expect(flash[:alert]).to eq(message)
  end
end
