class BookingsController < ApplicationController
  def new
    @booking = Booking.new(flight_id: params[:flight_id])
    num_of_passengers = params[:num_of_passengers].to_i
    num_of_passengers.times { @booking.passengers.build(flight_id: params[:flight_id]) }
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      render :booking
    else
      redirect_to :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    require(:booking).permit(:flight_id, passengers_attributes: [:name, :email])
  end
end