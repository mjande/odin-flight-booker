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

ActiveRecord::Schema[7.0].define(version: 2022_08_10_184957) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "airports", force: :cascade do |t|
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bookings", force: :cascade do |t|
    t.bigint "flight_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flight_id"], name: "index_bookings_on_flight_id"
  end

  create_table "flights", force: :cascade do |t|
    t.bigint "origin_id", null: false
    t.bigint "destination_id", null: false
    t.datetime "departure_time"
    t.integer "flight_duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["destination_id"], name: "index_flights_on_destination_id"
    t.index ["origin_id"], name: "index_flights_on_origin_id"
  end

  create_table "passengers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.bigint "flight_id", null: false
    t.bigint "booking_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_passengers_on_booking_id"
    t.index ["flight_id"], name: "index_passengers_on_flight_id"
  end

  add_foreign_key "bookings", "flights"
  add_foreign_key "flights", "airports", column: "destination_id"
  add_foreign_key "flights", "airports", column: "origin_id"
  add_foreign_key "passengers", "bookings"
  add_foreign_key "passengers", "flights"
end
