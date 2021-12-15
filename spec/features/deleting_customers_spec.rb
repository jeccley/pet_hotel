require 'rails_helper'

RSpec.feature 'Users can delete customers' do
  scenario 'successfully' do
    FactoryBot.create(:customer, last_name: 'Customer')

    visit '/'
    click_link 'Regular Customer'
    click_link 'Delete Customer'

    expect(page).to have_content 'Customer has been deleted.'
    expect(page.current_url).to eq customers_url
    expect(page).to have_no_content 'Regular Customer'
  end
end
