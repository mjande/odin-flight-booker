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


airport_codes = %w[ATL DFW DEN ORD LAX CLT MCO LAS PHX MIA SEA IAH JFK EWR FLL MSP SFO DTW BOS SLC PHL BWI TPA SAN LGA MDW BNA IAD]

airport_codes.each do |airport_code|
  Airport.create(code: airport_code)
end

15.times do
  orig = Airport.all.sample
  dest = Airport.where.not(id: orig.id).sample
  dur = Faker::Number.between(from: 3, to: 8)
  start = Faker::Time.between(from: Time.now, to: Time.now.next_year)
  new_flight = Flight.create(origin_id: orig.id, destination_id: dest.id, departure_time: start, flight_duration: dur)
end