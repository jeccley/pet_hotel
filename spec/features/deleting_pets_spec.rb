require 'rails_helper'

RSpec.feature 'Users can delete pets' do
  let(:customer) { FactoryBot.create(:customer) }
  let(:pet) { FactoryBot.create(:pet, customer: customer) }

  before do
    visit customer_pet_path(customer, pet)
  end

  scenario 'succssfully' do
    click_link 'Delete Pet'

    expect(page).to have_content 'Pet has been deleted.'
    expect(page.current_url).to eq customer_url(customer)
    expect(page).to have_no_content pet.name
  end
end
