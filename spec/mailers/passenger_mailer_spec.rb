require "rails_helper"

RSpec.describe PassengerMailer, type: :mailer do
  describe '#confirmation_email' do
    let(:booking) { create(:booking) }
    let(:passenger) { booking.passengers.first }
    let!(:other_passenger) { booking.passengers.create(name: 'Bob', email: 'bob@gmail.com') }

    # Create email
    let(:mail) { described_class.with(passenger:, booking:).confirmation_email }

    # Test that email was sent
    it 'sends the email' do
      expect { mail.deliver_now }.to change { ActionMailer::Base.deliveries.count }.by(1)
    end

    # Test contents of email
    it 'renders the subject' do
      expect(mail.subject).to eq('Booking Confirmation from Flight Booker')
    end

    it 'renders the receiver email' do
      expect(mail.to).to eq([passenger.email])
    end

    it 'renders the sender email' do
      expect(mail.from).to eq(['notification@flightbooker.com'])
    end

    it 'assigns @flight' do
      expect(mail.body.encoded).to match(booking.flight.destination.code)
    end

    it 'assigns @other_passengers' do
      expect(mail.body.encoded).to match(other_passenger.name)
    end
  end
end
