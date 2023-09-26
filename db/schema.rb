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

ActiveRecord::Schema[7.0].define(version: 2023_09_26_065450) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "properties", force: :cascade do |t|
    t.integer "property_id"
    t.string "council_property_number"
    t.string "full_address"
    t.float "latitude"
    t.float "longitude"
    t.string "postcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.geometry "geom", limit: {:srid=>4326, :type=>"geometry"}
  end

  create_table "vic_lgas", force: :cascade do |t|
    t.integer "gid"
    t.string "pfi", limit: 10
    t.string "lga_code", limit: 4
    t.string "lga_name", limit: 45
    t.string "gaz_lga", limit: 45
    t.string "gazregn", limit: 20
    t.string "abslgacode", limit: 6
    t.datetime "pfi_cr"
    t.bigint "ufi"
    t.datetime "ufi_cr"
    t.bigint "ufi_old"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.geometry "geom", limit: {:srid=>4283, :type=>"multi_polygon"}
  end

end
