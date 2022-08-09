class FlightsController < ApplicationController
  def index
    @airport_options = Airport.all.map { |airport| [airport.code, airport.id] }
    @date_options = Flight.all.map { |flight| [flight.departure_date_formatted, flight.departure_time] }

    @matching_flights = Flight.filter_by_origin(params[:origin_id]).filter_by_destination(params[:destination_id]).filter_by_date(params[:departure_time])
  end
end
