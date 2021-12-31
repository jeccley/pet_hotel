# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Customer, type: :model do
  before do
    @valid_customer = FactoryBot.create(:customer, last_name: 'Customer')
  end

  it 'is valid with a first name, last name, phone and email' do
    expect(@valid_customer).to be_valid
  end

  it 'is invalid without a first name' do
    invalid_customer = Customer.create(
      last_name: 'Customer',
      phone: '123123123',
      email: 'ivc@company.com'
    )

    expect(invalid_customer).to_not be_valid
  end

  it 'is invalid without a phone number' do
    invalid_customer = Customer.create(
      first_name: 'Invalid',
      last_name: 'Customer',
      email: 'ivc@company.com'
    )

    expect(invalid_customer).to_not be_valid
  end

  it 'is invalid without an email' do
    invalid_customer = Customer.create(
      first_name: 'Invalid',
      last_name: 'Customer',
      phone: '123123123'
    )

    expect(invalid_customer).to_not be_valid
  end

  it 'returns a customers full name as a string' do
    expect(@valid_customer.name).to eq('Regular Customer')
  end
end
