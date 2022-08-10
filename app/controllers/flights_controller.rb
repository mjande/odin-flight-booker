class FlightsController < ApplicationController
  def index
    @airport_options = Airport.all.map { |airport| [airport.code, airport.id] }
    @date_options = Flight.all.map { |flight| [flight.departure_date_formatted, flight.departure_time] }

    unless params[:origin_id].blank?
      @search = {origin: Airport.find(params[:origin_id]).code, destination: Airport.find(params[:destination_id]).code, date: Flight.filter_by_date(params[:departure_time]).first.departure_date_formatted}
      @matching_flights = Flight.filter_by_origin(params[:origin_id]).filter_by_destination(params[:destination_id]).filter_by_date(params[:departure_time])
    end
  end
end
