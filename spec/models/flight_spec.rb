require 'rails_helper'

RSpec.describe Flight, type: :model do
  it 'is valid with valid attributes' do
    expect(build(:flight)).to be_valid
  end
  it 'is not valid with missing origin' do
    expect(build(:flight, origin: nil)).to be_invalid
  end
  it 'is not valid with missing destination' do
    expect(build(:flight, destination: nil)).to be_invalid
  end
  it 'is not valid with missing departure time' do
    expect(build(:flight, departure_time: nil)).to be_invalid
  end
  it 'is not valid with missing flight duration' do
    expect(build(:flight, departure_time: nil)).to be_invalid
  end

  describe '.filter_by_all' do
    let(:bos) { create(:airport, code: 'BOS') }
    let(:sea) { create(:airport, code: 'SEA') }
    let!(:flight1) do
      create(:flight, origin: bos, destination: sea,
                      departure_time: Time.zone.parse('2022-08-09 10:00'))
    end
    let!(:flight2) do
      create(:flight, origin: bos, destination: sea,
                      departure_time: Time.zone.parse('2022-08-09 15:00'))
    end
    let!(:flight3) do
      create(:flight, destination: sea,
                      departure_time: Time.zone.parse('2022-08-09 15:00'))
    end
    let!(:flight4) do
      create(:flight, origin: bos,
                      departure_time: Time.zone.parse('2022-08-09 15:00'))
    end
    let!(:flight5) do
      create(:flight, origin: bos, destination: sea)
    end

    it 'returns relation of flights with matching attributes' do
      expect(Flight.filter_by_all(origin: bos.id, destination: sea.id, date: '2022-08-09')).to include(flight1, flight2)
    end

    it 'does not return flights with a different origin' do
      expect(Flight.filter_by_all(origin: bos.id, destination: sea.id, date: '2022-08-09')).not_to include(flight3)
    end

    it 'does not return flights with a different destination' do
      expect(Flight.filter_by_all(origin: bos.id, destination: sea.id, date: '2022-08-09')).not_to include(flight4)
    end

    it 'does not return flights on different dates' do
      expect(Flight.filter_by_all(origin: bos.id, destination: sea.id, date: '2022-08-09')).not_to include(flight5)
    end
  end
end
