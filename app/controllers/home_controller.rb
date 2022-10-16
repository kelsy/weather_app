# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @data = WeatherService.new(latitude: "45.6280", longitude: "-122.6739").call
  end
end
