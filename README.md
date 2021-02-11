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

## Test the APIs
For easier testing, I've set up an accessible API of this project through Heroku. Do note that Heroku has a downtime at first request so if it's slow for the first time the dyno is being set up.

Root Route which redirects to "https://hometime.io/":
GET ➜ https://hometime-api-test.herokuapp.com/

Route to request all Reservations:
GET ➜ https://hometime-api-test.herokuapp.com/reservations

Route to request all Guests:
GET ➜ https://hometime-api-test.herokuapp.com/guests

