require 'rails_helper'

RSpec.describe Booking, type: :model do
  let(:customer) { FactoryBot.create(:customer) }
  let(:booking) { FactoryBot.create(:booking, customer: customer) }

  it 'is valid with drop off and pick up dates' do
    valid_booking = FactoryBot.create(:booking, customer: customer)

    expect(valid_booking).to be_valid
  end

  it 'is invalid without a drop off date' do
    invalid_booking = Booking.create(
      pick_up: Date.today
    )

    expect(invalid_booking).to_not be_valid
  end

  it 'is invalid without a pick up date' do
    invalid_booking = Booking.create(
      drop_off: Date.today
    )

    expect(invalid_booking).to_not be_valid
  end
end
