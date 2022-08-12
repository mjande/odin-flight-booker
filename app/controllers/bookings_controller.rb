class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
  end
  
  def new
    @booking = Booking.new(flight_id: params[:flight_id])
    num_of_passengers = params[:num_of_passengers].to_i
    num_of_passengers.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)
    @passengers = @booking.passengers
    if @booking.save
      flash[:success] = "Your flight was successfully booked!"
      redirect_to @booking
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email])
  end
end