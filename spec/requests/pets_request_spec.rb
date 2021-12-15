require 'rails_helper'

RSpec.describe 'Pets', type: :request do
  it 'Handles a missing pet correctly' do
    customer = FactoryBot.create(:customer)
    get customer_pet_path(customer, 'not-here')

    expect(response).to redirect_to(customer_pets_path(customer))

    message = 'The pet you were looking for could not be found.'
    expect(flash[:alert]).to eq(message)
  end
end
