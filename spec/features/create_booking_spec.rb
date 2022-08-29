require 'rails_helper'

describe 'Creating a booking', type: :feature, driver: :selenium_chrome_headless do
  let!(:flight) do
    Flight.create!(
      origin: Airport.create(code: 'ORD'),
      destination: Airport.create(code: 'SEA'),
      departure_time: '2022-08-09 10:00',
      flight_duration: '5'
    )
  end

  before do
    visit flights_path
    select 'ORD', from: :origin_id
    select 'SEA', from: :destination_id
    select '08/09/2022', from: :departure_time
    click_on 'Search'
    choose :flight_id, option: flight.id
    click_on 'Book Flight'
  end

  context 'with valid inputs' do
    before do
      fill_in 'booking_passengers_attributes_0_name', with: 'Joe'
      fill_in 'booking_passengers_attributes_0_email', with: 'joe@gmail.com'
      click_on 'Add Passenger'
      fill_in 'booking_passengers_attributes_1_name', with: 'Sarah'
      fill_in 'booking_passengers_attributes_1_email', with: 'sarah@gmail.com'
      click_on 'Create Booking'
      sleep(0.1)
      open_email('joe@gmail.com')
    end

    it 'opens booking page' do
      expect(page).to have_content('Your flight was successfully booked!')
    end

    it 'sends email to passengers' do
      expect(current_email).not_to be_nil
    end

    it 'includes link to booking page in email' do
      current_email.click_link 'Your Booking'
      expect(page).to have_content('Your Booking')
    end
  end

  context 'with invalid inputs' do
    before do
      click_on 'Create Booking'
    end

    it 'adds warning to banner' do
      expect(page).to have_content("can't be blank.")
    end
  end
end
