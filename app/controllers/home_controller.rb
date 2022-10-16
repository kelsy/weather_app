# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @location = LocationService.new(query: "512 N Killingsworth St, Portland, OR").call
    @weather = WeatherService.new(latitude: @location[:latitude], longitude: @location[:longitude]).call
  end
end
