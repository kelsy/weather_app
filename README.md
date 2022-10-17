# Weather App

This weather app will:
* Accept an address as input (:heavy_check_mark:)
* Retrieve forecast data for the given address (:heavy_check_mark:)
* Display the current temperature (:heavy_check_mark:)
* Cache forecast details by zipcode for 30 minutes (:heavy_check_mark:)
* Display indicator if it is using cached data (:heavy_check_mark:)

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
```

## Future Updates
* Use Redis for caching and add caching to the Location lookup as well. For the sake of simplicity and the initial functionality, leaving Redis out of the stack.
* Persist the last several weather lookups in the UI