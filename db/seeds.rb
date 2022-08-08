# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Airport::delete_all

airport_codes = %w(ATL DFW DEN ORD LAX CLT MCO LAS PHX MIA SEA IAH JFK EWR FLL MSP SFO DTW BOS SLC PHL BWI TPA SAN LGA MDW BNA IAD)

airport_codes.each do |airport_code|
  Airport.create(code: airport_code)
end