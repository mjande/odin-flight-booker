# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

Flight.delete_all
Airport.delete_all

airport_codes = %w[ATL DFW DEN ORD DTW]

airport_codes.each do |airport_code|
  Airport.create(code: airport_code)
end

dates = []
7.times do |i|
  new_date = Time.zone.parse("Jan #{i + 1} 2023")
  dates << new_date
end

Airport.all.each do |departure_airport|
  Airport.where.not(id: departure_airport.id).each do |arrival_airport|
    dates.each do |date|
      departure_time = Faker::Time.between_dates(from: date.beginning_of_day, to: date.end_of_day)
      flight_duration = Faker::Number.between(from: 3, to: 8)

      Flight.create(origin_id: departure_airport.id,
                    destination_id: arrival_airport.id, departure_time:,
                    flight_duration:)
    end
  end

  5.times do
    destination_id = Airport.where.not(id: departure_airport.id).sample.id
    departure_time = Faker::Time.between_dates(from: dates[0], to: dates[-1])
    flight_duration = Faker::Number.between(from: 3, to: 8)

    Flight.create(origin_id: departure_airport.id,
                  destination_id:,
                  departure_time:,
                  flight_duration:)
  end
end
