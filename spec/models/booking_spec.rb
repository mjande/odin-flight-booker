require 'rails_helper'

RSpec.describe Booking, type: :model do
  let!(:origin) { Airport.new(code: 'BOS') }
  let!(:destination) { Airport.new(code: 'SEA') }
  let!(:flight) { Flight.create(origin:, destination:, departure_time: Time.zone.now, flight_duration: 1) }
  let(:passenger_params) { { name: 'Joe', email: 'joe@gmail.com' } }

  it 'is valid with valid attributes' do
    booking = Booking.new(flight_id: flight.id)
    booking.passengers.build(passenger_params)
    expect(booking).to be_valid
  end

  it 'is not valid with missing flight' do
    booking = Booking.new
    booking.passengers.build(passenger_params)
    expect(booking).to be_invalid
  end

  it 'is not valid with no passengers' do
    expect(Booking.new(flight_id: flight.id)).to be_invalid
  end
end
