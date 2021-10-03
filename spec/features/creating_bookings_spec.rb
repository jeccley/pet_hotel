require "rails_helper"

RSpec.feature "Users can create new bookings" do
  scenario "with valid attributes" do
    visit "/"
    
    click_link "New Booking"
    
    fill_in "Name", with: "Regular Customer"
    fill_in "Drop off", with: Date.today
    fill_in "Pick up", with: Date.today + 14
    
    click_button "Create Booking"
    
    expect(page).to have_content "Booking has been created."
    booking = Booking.find_by!(name: "Regular Customer")
      expect(page.current_url).to eq booking_url(booking)
      
      title = "Regular Customer - Bookings - Pet Hotel"
      expect(page).to have_title title
  end
end
