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

ActiveRecord::Schema[7.0].define(version: 2023_12_16_231232) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "age_groups", force: :cascade do |t|
    t.integer "start_age"
    t.integer "end_age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "offer_details", force: :cascade do |t|
    t.bigint "offer_id", null: false
    t.integer "start_age"
    t.integer "end_age"
    t.integer "play_hours"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["offer_id"], name: "index_offer_details_on_offer_id"
  end

  create_table "offers", force: :cascade do |t|
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "gender", default: [], array: true
    t.string "genre"
    t.string "title"
    t.integer "payout"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "birthdate"
    t.string "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.integer "age"
  end

end
