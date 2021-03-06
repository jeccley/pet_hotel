# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Users can create new customers' do
  let(:user) { FactoryBot.create(:user) }

  before do
    login_as(user)
    visit '/'
    click_link 'New Customer'
  end

  scenario 'with valid attributes' do
    fill_in 'First name', with: 'Jonathan'
    fill_in 'Last name', with: 'Eccles'
    fill_in 'Phone', with: '07931514075'
    fill_in 'Email', with: 'text@example.com'
    fill_in 'Notes', with: 'Some additional information about the customer'
    fill_in 'Vet details', with: 'The name and contact info for their vet'
    click_button 'Create Customer'

    expect(page).to have_content 'Customer has been created.'
    within('.attributes') do
      expect(page).to have_content "Created by: #{user.email}"
    end

    customer = Customer.find_by!(last_name: 'Eccles')
    expect(page.current_url).to eq customer_url(customer)

    title = 'Jonathan Eccles - Customer - Pet Hotel'
    expect(page).to have_title title
  end

  scenario 'when providing invalid attributes' do
    click_button 'Create Customer'

    expect(page).to have_content 'Customer has not been created.'
    expect(page).to have_content "First name can't be blank"
    expect(page).to have_content "Last name can't be blank"
    expect(page).to have_content "Phone can't be blank"
    expect(page).to have_content "Email can't be blank"
  end
end
