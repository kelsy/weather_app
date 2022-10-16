# frozen_string_literal: true

class HomeController < ApplicationController
  def index
  end

  def search
    @location = LocationService.new(query: params[:query]).call
    @weather = WeatherService.new(latitude: @location[:latitude], longitude: @location[:longitude]).call
  end
end
