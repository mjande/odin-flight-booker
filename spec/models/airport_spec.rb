require 'rails_helper'

RSpec.describe Airport, type: :model do
  it 'is valid with valid attributes' do
    expect(Airport.new(code: 'BOS')).to be_valid
  end
  it 'is not valid with missing airport code' do
    expect(Airport.new).not_to be_valid
  end
end
