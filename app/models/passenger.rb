# frozen_string_literal: true

# The Passenger model contains the name and email of any passenger who has booked
# a flight.
class Passenger < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true

  belongs_to :booking

  delegate :flight, to: :booking
end
