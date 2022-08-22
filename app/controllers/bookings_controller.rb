# frozen_string_literal: true

# BookingsController handles actions for all bookings
class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new(flight_id: params[:flight_id])
    @passengers = @booking.passengers.build
  end

  def create
    @booking = Booking.new(booking_params)
    @passengers = @booking.passengers
    if @booking.save
      flash[:success] = 'Your flight was successfully booked!'
      redirect_to @booking
    else
      # Store the error messages on all passengers in an array in flash[:error]
      flash.now[:error] ||= []
      @passengers.each do |passenger|
        passenger.errors.full_messages.each do |message|
          flash.now[:error] << "Passenger's #{message.downcase}."
        end
      end
      flash.now[:error].uniq!
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: %i[name email])
  end
end
