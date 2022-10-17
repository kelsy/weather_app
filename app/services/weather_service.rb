# frozen_string_literal: true
require 'net/http'

class WeatherService
  API_KEY = ENV["open_weather_api_key"]
  BASE_URL = "https://api.openweathermap.org/data/2.5/weather"

  def initialize(latitude:, longitude:, postal_code:, country_code:, units: "imperial")
    @latitude = latitude
    @longitude = longitude
    @postal_code = postal_code
    @country_code = country_code
    @units = units
  end

  def call
    # If there is a postal code, first let's check the DB for cached weather data
    if postal_code.present? && country_code.present?
      weather = WeatherByPostalCode.find_by(postal_code: postal_code, country_code: country_code)
      if weather.present? && !weather.weather_data_stale?
        # return here and skip API call below
        return weather.weather_data
      end
    end

    response = Net::HTTP.get_response(uri)
  
    if response.is_a?(Net::HTTPSuccess)
      data = JSON.parse(response.body)
      weather_details = data["weather"].first

      weather = if weather.present?
        weather.update(
          current_temperature: data["main"]["temp"].to_i,
          feels_like: data["main"]["feels_like"].to_i,
          weather_description: weather_details["description"].downcase,
          icon_name: weather_details["icon"]
        )
      else
        WeatherByPostalCode.create(
          postal_code: postal_code,
          country_code: country_code,
          current_temperature: data["main"]["temp"].to_i,
          feels_like: data["main"]["feels_like"].to_i,
          weather_description: weather_details["description"].downcase,
          icon_name: weather_details["icon"]
        )
      end

      return weather.weather_data
    else
      # Return something to the UI
      return {
        status: "error"
      }
    end
  end

  private

  attr_reader :latitude, :longitude, :postal_code, :country_code, :units

  def uri
    URI("#{BASE_URL}?lat=#{latitude}&lon=#{longitude}&units=#{units}&appid=#{API_KEY}")
  end
end