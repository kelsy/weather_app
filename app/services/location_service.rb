# frozen_string_literal: true

class LocationService
  def initialize(query:)
    @query = query
  end

  def call
    results = Geocoder.search(query)
    result = results.first

    {
      latitude: result.latitude,
      longitude: result.longitude,
      postal_code: result.postal_code
    }
  end

  private

  attr_reader :query

end