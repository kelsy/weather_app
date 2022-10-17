# frozen_string_literal: true

class HomeController < ApplicationController
  def index
  end

  def search
    @location = LocationService.new(query: params[:query]).call
    @weather = if @location.present?
      WeatherService.new(latitude: @location[:latitude], longitude: @location[:longitude], postal_code: @location[:postal_code], country_code: @location[:country_code]).call
    else
      {
        status: "not_found"
      }
    end
  end
end
