require 'rails_helper'

RSpec.describe WeatherService do
  let(:response) { Net::HTTPSuccess.new(1.0, '200', 'OK') }

  let(:data) {
   '{"coord":{"lon":-122.6739,"lat":45.628},"weather":[{"id":800,"main":"Clear","description":"clear sky","icon":"01n"}],"base":"stations","main":{"temp":75.33,"feels_like":74.25,"temp_min":70.48,"temp_max":79.25,"pressure":1011,"humidity":36},"visibility":10000,"wind":{"speed":8.05,"deg":100,"gust":21.85},"clouds":{"all":0},"dt":1665891006,"sys":{"type":2,"id":2072986,"country":"US","sunrise":1665844024,"sunset":1665883528},"timezone":-25200,"id":5814616,"name":"Vancouver","cod":200}'
  }

  describe "#call" do
    let(:weather_data) {
      {
        
        current_temperature: 75, 
        feels_like: 74, 
        icon_name: "01n", 
        updated_at: nil, 
        weather_description: "clear sky"
      }
    }
    it "returns weather data given a latitude and longitude" do
      expect_any_instance_of(Net::HTTP).to receive(:request).at_least(:once) { response }
      expect(response).to receive(:body).at_least(:once) { data }

      expect(WeatherService.new(latitude: "45.628", longitude: "-122.6739", postal_code: nil, country_code: nil).call).to eq(weather_data)
    end
  end
end