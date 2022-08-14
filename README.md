# Odin Flight Booker

![Home Page](/readme_img/home_page.png)

Odin Flight Booker allows a user to find and book flights based on origin/destination and dates. It is a learning project created as part of the curriculum at [The Odin Project](theodinproject.com), and it is not connected to any external APIs (users cannot book real flights with this app). Project specs can be found at the project page found [here](https://www.theodinproject.com/lessons/ruby-on-rails-flight-booker).

## Technologies

- Ruby (3.1.2)
- Rails (7.0.3)
- Tailwind CSS (2.0)

## Installation

You can access a live version of this app [here](https://stark-lowlands-16925.herokuapp.com/).

> Dependencies  
> - Ruby 3.1.2  
> - Rails 7.0.3  

To access a local version, make sure you have both dependencies, then clone the repo using the commands below.

```
git clone git@github.com:mjande/odin-flight-booker.git
cd odin-flight-booker
bundle install
bin/rails server
```

Then, navigate to `localhost:3000` to begin using the app.

## Features

- Search for flights

  Enter your information and click 'Search" to find any matching flights.

  ![Searching for flights](/readme_img/searching_flights.gif)

- Book flights

  After searching for a matching flight, choose one and click 'Book Flight.' Then, enter your passenger info in the spaces provided, and click 'Create Booking.' Congrats, you have booked your first flight!

  ![Booking a flight](/readme_img/booking_flight.gif)

## Testing

This app includes a small number of tests to verify that the features and models are working properly. 

To prepare the testing suite, use the commands below.

```
bundle install
rails generate rspec:install
```

- Running all tests:

```
rspec 
```

- Running tests for a specific file:

```
rspec spec/features/search_flights_spec.rb
```

## Acknowledgements

For inspiring this project and their constant support, I am deeply grateful to the community at The Odin Project and at their Discord.
