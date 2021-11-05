require 'rails_helper'

RSpec.feature 'Users can view pets' do
  before do
    eccles_hol = FactoryBot.create(:booking, name: 'Eccles Holiday')
    FactoryBot.create(:pet, booking: eccles_hol,
                            name: 'Blackberry',
                            animal: 'Dwarf Rabbit',
                            vaccinated: true)

    big_hol = FactoryBot.create(:booking, name: 'Long Holiday')
    FactoryBot.create(:pet, booking: big_hol,
                            name: 'Crumble', animal: 'Large Rabbit', vaccinated: true)

    visit '/'
  end

  scenario 'for a given project' do
    click_link 'Eccles Holiday'

    expect(page).to have_content 'Blackberry'
    expect(page).to_not have_content 'Large Rabbit'

    click_link 'Blackberry'
    within('.pet h2') do
      expect(page).to have_content 'Blackberry'
    end

    expect(page).to have_content 'Dwarf Rabbit'
  end
end
