require 'rails_helper'

RSpec.describe Airport, type: :model do
  it 'is valid with valid attributes' do
    expect(build(:airport)).to be_valid
  end
  it 'is not valid with missing airport code' do
    expect(build(:airport, code: nil)).not_to be_valid
  end
end
