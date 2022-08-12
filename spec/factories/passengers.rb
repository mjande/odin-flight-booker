FactoryBot.define do
  factory :passenger do
    name { 'Joe' }
    email { 'joe@gmail.com' }
    booking { create(:booking) }
  end
end
