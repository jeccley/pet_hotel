# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Users can view pets' do
  let(:customer) { FactoryBot.create(:customer) }
  let(:pet) { FactoryBot.create(:pet, customer:) }

  before do
    visit customer_pet_path(customer, pet)
  end

  scenario 'with the pet details' do
    visit '/'
    click_link customer.name
    click_link pet.name
    expect(page).to have_content pet.name
    expect(page).to have_content pet.animal
    expect(page).to have_content pet.vaccinated.to_s.capitalize
    expect(page).to have_content pet.status
    expect(page.current_path).to eq customer_pet_path(customer, pet)
  end
end
