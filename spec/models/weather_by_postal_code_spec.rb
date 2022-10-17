require "rails_helper"

RSpec.describe WeatherByPostalCode, type: :model do
  it { is_expected.to validate_presence_of(:postal_code) }
  it { is_expected.to validate_presence_of(:country_code) }
  it { is_expected.to validate_presence_of(:current_temperature) }

  it { is_expected.to validate_uniqueness_of(:postal_code).scoped_to(:country_code) }

  let(:weather) {
    WeatherByPostalCode.new(
      postal_code: "90210",
      country_code: "us",
      current_temperature: 71,
      icon_name: "01d",
      weather_description: "cloudy"
    )
  }

  describe "#weather_data_stale?" do


    context "when updated_at is more than 30 minutes ago" do
      it "should be true" do
        weather.updated_at = 32.minutes.ago
        expect(weather.weather_data_stale?).to be true
      end
    end

    context "when updated_at is less than 30 minutes ago" do
      it "should be false" do
        weather.updated_at = 2.minutes.ago
        expect(weather.weather_data_stale?).to be false
      end
    end
  end

  describe "#weather_data" do
    it "should return a hash of weather data" do
      updated_at = 2.minutes.ago
      weather.updated_at = updated_at

      expect(weather.weather_data).to eq (
        {
          current_temperature: 71,
          feels_like: nil,
          weather_description: "cloudy",
          icon_name: "01d",
          updated_at: updated_at
        }
      )
    end
  end
end