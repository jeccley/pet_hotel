# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Pet, type: :model do
  let(:customer) { FactoryBot.create(:customer) }
  let(:pet) { FactoryBot.create(:pet, customer:) }

  it 'is valid with a name, vaccination status and status' do
    valid_pet = FactoryBot.create(:pet, customer:, name: 'Example Pet')

    expect(valid_pet).to be_valid
  end

  it 'is invalid without a name' do
    invalid_pet = Pet.create(
      vaccinated: false,
      status: 'Active'
    )

    expect(invalid_pet).to_not be_valid
  end

  it 'is invalid without a vaccination flag' do
    invalid_pet = Pet.create(
      name: 'Thumper',
      status: 'Active'
    )

    expect(invalid_pet).to_not be_valid
  end

  it 'is invalid without a status' do
    invalid_pet = Pet.create(
      name: 'Thumper',
      vaccinated: false
    )

    expect(invalid_pet).to_not be_valid
  end
end
