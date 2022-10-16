# frozen_string_literal: true
require 'net/http'
# require 'uri'

class WeatherService
  API_KEY = ENV["open_weather_api_key"]
  BASE_URL = "https://api.openweathermap.org/data/2.5/weather"

  def initialize(latitude:, longitude:, units: "imperial")
    @latitude = latitude
    @longitude = longitude
    @units = units
  end

  def call
    response = Net::HTTP.get_response(uri)
  
    puts response.inspect
    # if response.is_a?(Net::HTTPSuccess)
      @data = JSON.parse(response.body)
    # else
      # We should fall back to something if the API is down
      # @data = {}
    # end
  end

  private

  attr_reader :latitude, :longitude, :units

  def uri
    URI("#{BASE_URL}?lat=#{latitude}&lon=#{longitude}&units=#{units}&appid=#{API_KEY}")
  end

end