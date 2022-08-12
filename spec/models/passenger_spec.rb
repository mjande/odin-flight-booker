require 'rails_helper'

RSpec.describe Passenger, type: :model do
  it 'is valid with valid attributes' do
    expect(build(:passenger)).to be_valid
  end

  it 'is not valid with missing name' do
    expect(build(:passenger, name: nil)).to be_invalid
  end

  it 'is not valid with missing email' do
    expect(build(:passenger, email: nil)).to be_invalid
  end
end
