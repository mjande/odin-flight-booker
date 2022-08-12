# frozen_string_literal: true

# The Flight model represents all flights to and from any airport. Columns in the
# flight table: origin_id, destination_id, departure_time, and duration.
class Flight < ApplicationRecord
  belongs_to :origin, class_name: 'Airport', foreign_key: 'origin_id'
  belongs_to :destination, class_name: 'Airport', foreign_key: 'destination_id'
  has_many :passengers
  has_many :bookings

  scope :filter_by_origin, ->(origin) { where(origin:) }
  scope :filter_by_destination, ->(destination) { where(destination:) }
  scope :filter_by_date, lambda { |date|
    where(departure_time: [Time.parse(date).beginning_of_day..Time.parse(date).end_of_day]) unless date.nil?
  }

  def departure_date_formatted
    departure_time.strftime('%m/%d/%Y')
  end

  def departure_time_formatted
    departure_time.strftime('%I:%M%p')
  end

  def arrival_time_formatted
    arrival_time = departure_time + (flight_duration * 3600)
    arrival_time.strftime('%I:%M%p')
  end
end
