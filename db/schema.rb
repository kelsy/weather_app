# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_10_16_222538) do
  create_table "weather_by_postal_codes", force: :cascade do |t|
    t.string "postal_code"
    t.string "country_code"
    t.integer "current_temperature"
    t.integer "feels_like"
    t.string "weather_description"
    t.string "icon_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["postal_code", "country_code"], name: "index_weather_by_postal_codes_on_postal_code_and_country_code", unique: true
  end

end
