# Hometime (API)
The server of Hometime API test. Hosted on Heroku.

## Version
- Rails ~> 5.2.4.5
- Ruby ~> 2.7.2

## Set-up
You need to have **Docker** and **Docker Compose** installed on your machine to be able to run the following commands.
```
# Open your default terminal and run the following
➜ docker-compose build                                    # Builds the project
➜ docker-compose run web rake db:create                   # Builds the database
➜ docker-compose up                                       # Starts the server
```

## Installing a new Gem
To install a new gem please edit the `Gemfile` and run the following commands afterwards.
```
# Open your default terminal and run the following
➜ docker-compose down                                     # Stops the server
➜ docker-compose run web bundle install                   # Run 'bundle install' inside the container
➜ docker-compose up --build                               # Starts and rebuilds the project
```

## Extra commands
For other cases please check the commands below.
```
# Open your default terminal and run the following
➜ docker-compose run web rails db:migrate                 # Run the migration
➜ docker-compose run web rails console                    # Open the rails console
➜ docker-compose run web rake routes |grep 'test_courses' # List routes with 'guest' in it
➜ docker attach <CONTAINER_NAME>                          # Attach to the application container (for when you're trying to use Debugger/Byebug)
```

## Test the API
For easier testing, I've set up an accessible API of this project through Heroku. Do note that Heroku has a downtime at first request so if it's slow for the first time the dyno is being set up.

Root Route which redirects to "https://hometime.io/":
```
GET ➜ https://hometime-api-test.herokuapp.com/
```

Route to request all Reservations:
```
GET ➜ https://hometime-api-test.herokuapp.com/reservations
```

Route to request all Guests:
```
GET ➜ https://hometime-api-test.herokuapp.com/guests
```

Create a reservation:
```
POST ➜ https://hometime-api-test.herokuapp.com/reservations
```
Here's a payload that you can use for it:
```
{
  "reservation": {
    "start_date": "2020-03-12",
    "end_date": "2020-03-16",
    "expected_payout_amount": "3800.00",
    "guest_details": {
      "localized_description": "4 guests",
      "number_of_adults": 2,
      "number_of_children": 2,
      "number_of_infants": 0
    },
    "guest_email": "wayne_woodbridge@bnb.com",
    "guest_first_name": "Wayne",
    "guest_id": 1,
    "guest_last_name": "Woodbridge", "guest_phone_numbers": [
      "639123456789",
      "639123456789"
    ],
    "listing_security_price_accurate": "500.00",
    "host_currency": "AUD",
    "nights": 4,
    "number_of_guests": 4,
    "status_type": "accepted",
    "total_paid_amount_accurate": "4500.00",
  }
}
```
You can also use a payload in this format:
```
{
  "start_date": "2020-03-12",
  "end_date": "2020-03-16",
  "nights": 4,
  "guests": 4,
  "adults": 2,
  "children": 2,
  "infants": 0,
  "status": "accepted",
  "guest": {
    "id": 1,
    "first_name": "Wayne",
    "last_name": "Woodbridge",
    "phone": "639123456789",
    "email": "wayne_woodbridge@bnb.com"
  },
  "currency": "AUD",
  "payout_price": "3800.00",
  "security_price": "500",
  "total_price": "4500.00"
}
```
