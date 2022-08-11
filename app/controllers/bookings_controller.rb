class BookingsController < ApplicationController
  def new
    @booking = Booking.new(flight_id: params[:flight_id])
    num_of_passengers = params[:num_of_passengers].to_i
    num_of_passengers.times { @booking.passengers.build }
  end
end