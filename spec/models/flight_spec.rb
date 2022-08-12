require 'rails_helper'

RSpec.describe Flight, type: :model do
  let(:origin) { Airport.new(code: 'BOS') }
  let(:destination) { Airport.new(code: 'SEA') }
  subject(:flight) { Flight.new(origin:, destination:, departure_time: Time.zone.now, flight_duration: 7) }

  it 'is valid with valid attributes' do
    expect(flight).to be_valid
  end
  it 'is not valid with missing origin' do
    flight.origin = nil
    expect(flight).to be_invalid
  end
  it 'is not valid with missing destination' do
    flight.destination = nil
    expect(flight).to be_invalid
  end
  it 'is not valid with missing departure time' do
    flight.departure_time = nil
    expect(flight).to be_invalid
  end
  it 'is not valid with missing flight duration' do
    flight.flight_duration = nil
    expect(flight).to be_invalid
  end
end
