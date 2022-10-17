class WeatherByPostalCode < ApplicationRecord
  validates :postal_code, :country_code, :current_temperature, presence: true
  validates :postal_code, uniqueness: { scope: :country_code }

  # It would be nice to make a serializer for this
  def weather_data
    {
      current_temperature: current_temperature,
      feels_like: feels_like,
      weather_description: weather_description,
      icon_name: icon_name,
      updated_at: updated_at
    }
  end

  def weather_data_stale?
    # Checks if updated_at is *earlier* than 30 minutes ago
    updated_at < 30.minutes.ago
  end
end
