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

  scenario 'matching flight inputs' do
    visit flights_path
    select 'ORD', from: :origin_id
    select 'SEA', from: :destination_id
    select '2', from: :number_of_passengers
    select '08/09/2022', from: :departure_time
    click_on 'Search'
    expect(page).to have_content(flight.id)
  end

  scenario 'no matching flight inputs' do
    visit flights_path
    click_on 'Search'
    expect(page).to have_content('Sorry, there are no flights for that trip.')
  end
end
