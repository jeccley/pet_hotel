require 'rails_helper'

RSpec.feature 'Users can view customer' do
  scenario 'with the customer details' do
    customer = FactoryBot.create(:customer, name: 'Regular Customer')

    visit '/'
    click_link 'Regular Customer'

    expect(page.current_url).to eq customer_url(customer)
  end
end
