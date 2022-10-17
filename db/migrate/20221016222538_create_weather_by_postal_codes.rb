class CreateWeatherByPostalCodes < ActiveRecord::Migration[7.0]
  def change
    create_table :weather_by_postal_codes do |t|
      t.string :postal_code
      t.string :country_code
      t.integer :current_temperature
      t.integer :feels_like
      t.string :weather_description
      t.string :icon_name
      
      t.timestamps
      t.index [:postal_code, :country_code], unique: true
    end
  end
end
