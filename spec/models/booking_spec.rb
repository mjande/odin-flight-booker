require 'rails_helper'

RSpec.describe Booking, type: :model do
  let(:passenger_params) { { name: 'Joe', email: 'joe@gmail.com' } }

  it 'is valid with valid attributes' do
    booking = build(:booking)
    expect(booking).to be_valid
  end

  it 'is not valid with missing flight' do
    booking = build(:booking, flight: nil)
    expect(booking).to be_invalid
  end

  it 'is not valid with no passengers' do
    booking = build(:booking)
    booking.passengers.clear
    expect(booking).to be_invalid
  end
end
