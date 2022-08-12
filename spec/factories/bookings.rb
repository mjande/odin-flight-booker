FactoryBot.define do
  factory :booking do
    flight
    after(:build) do |booking|
      booking.passengers << build(:passenger, booking:)
    end
  end
end
