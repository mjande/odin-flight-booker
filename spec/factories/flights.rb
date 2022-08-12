FactoryBot.define do
  factory :flight do
    origin { create(:airport) }
    destination { create(:airport) }
    departure_time { '2022-08-08 11:49:47' }
    flight_duration { 1 }
  end
end
