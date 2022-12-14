# Weather App

This weather app currently:
* Retrieves & displays the current temperature for any given address
* Caches weather data by postal code for 30 minutes if postal code is available for the location
* Displays when the postal code's weather data was last fetched

:sparkles: Test it out live on [Heroku](https://vast-forest-92948.herokuapp.com/).

## Setup

After cloning this repo, run the following to set up the app for the first time:
```
$ bundle config set --local without 'production'
$ bundle install
$ rails db:migrate
```

You will also need a free API key from [Open Weather](https://openweathermap.org/).
Once you sign up for the API key, run:
```
bundle exec figaro install
```

And then add this line to your `config/application.yml` file where `"API_KEY"` is your own key:
```
open_weather_api_key: "API_KEY"
```

## Running tests

```
$ bundle exec rspec
```

## Deployment instructions
Any deployment environment will need an `ENV["open_weather_api_key"]` variable set with your Open Weather API key. To set this variable on heroku, run this command with your API key in place of `API_KEY`:

```
heroku config:set open_weather_api_key=API_KEY
heroku run rails db:migrate
```

## Future Updates
* Use Redis for caching and add caching to the Location lookup as well. For the sake of simplicity and the initial functionality, leaving Redis out of the stack.
* Persist the last several weather lookups in the UI
* Offer alternate geocoder results for fuzzy addresses ("Did you mean?")