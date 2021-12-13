require 'rails_helper'

RSpec.feature 'Users can edit existing customer' do
  before do
    FactoryBot.create(:customer, name: 'Regular Customer')

    visit '/'
    click_link 'Regular Customer'
    click_link 'Edit Customer'
  end

  scenario 'with valid attributes' do
    fill_in 'Phone', with: '02075551234'
    click_button 'Update Customer'

    expect(page).to have_content 'Customer has been updated.'
    expect(page).to have_content '02075551234'
  end

  scenario 'when providing invalid attributes' do
    fill_in 'Name', with: ''
    click_button 'Update Customer'

    expect(page).to have_content 'Customer has not been updated.'
    expect(page).to have_content "Name can't be blank"
  end
end
