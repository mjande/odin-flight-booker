require 'rails_helper'

describe 'Creating a booking', type: :feature do
  let!(:flight) do
    Flight.create(
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
    select '2', from: :number_of_passengers
    select '08/09/2022', from: :departure_time
    click_on 'Search'
    choose :flight_id, option: flight.id
    click_on 'Book Flight'
  end

  scenario 'with valid inputs' do
    fill_in 'booking_passengers_attributes_0_name', with: 'Joe'
    fill_in 'booking_passengers_attributes_0_email', with: 'joe@gmail.com'
    fill_in 'booking_passengers_attributes_1_name', with: 'Sarah'
    fill_in 'booking_passengers_attributes_1_email', with: 'sarah@gmail.com'
    click_on 'Create Booking'
    expect(page).to have_content('Your flight was successfully booked!')
  end

  scenario 'with invalid inputs' do
    click_on 'Create Booking'
    expect(page).to have_content("can't be blank.")
  end
end
