class PassengerMailer < ApplicationMailer
  default from: 'notification@flightbooker.com'

  def confirmation_email
    @passenger = params[:passenger]
    @booking_url = url(params[:booking])
    mail(to: @passenger.email, subject: 'Booking Confirmation from Flight Booker')
  end
end
