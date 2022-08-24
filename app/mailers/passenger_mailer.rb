class PassengerMailer < ApplicationMailer
  default from: 'notification@flightbooker.com'

  def confirmation_email
    @booking = params[:booking]
    @flight = @booking.flight
    @passenger = params[:passenger]
    @other_passengers = @booking.passengers.where.not(name: @passenger.name).to_a
    @url = booking_url(@booking)
    mail(to: @passenger.email, subject: 'Booking Confirmation from Flight Booker')
  end
end
