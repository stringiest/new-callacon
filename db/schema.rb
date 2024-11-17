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

ActiveRecord::Schema[7.1].define(version: 2024_11_17_145434) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  # Custom types defined in this database.
  # Note that some types may not work with other database engines. Be careful if changing database.
  create_enum "chillout_house", ["yes", "no", "don't mind"]
  create_enum "dog_house", ["yes", "no", "don't mind"]
  create_enum "hot_tub_house", ["yes", "no", "don't mind"]
  create_enum "lark_or_owl", ["lark", "owl", "neither"]
  create_enum "late_n_loud", ["yes", "no", "don't mind"]
  create_enum "massage_house", ["yes", "no", "don't mind"]
  create_enum "sharing_bed", ["double", "two singles"]

  create_table "bookings", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.date "arrival"
    t.date "departure"
    t.uuid "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "event_id", null: false
    t.boolean "cancellable"
    t.integer "assistance_donate"
    t.boolean "assistance_claim"
    t.boolean "single_person"
    t.integer "dog"
    t.enum "lark_or_owl", null: false, enum_type: "lark_or_owl"
    t.enum "massage_house", null: false, enum_type: "massage_house"
    t.enum "late_n_loud", null: false, enum_type: "late_n_loud"
    t.enum "chillout_house", null: false, enum_type: "chillout_house"
    t.enum "dog_house", null: false, enum_type: "dog_house"
    t.enum "hot_tub_house", null: false, enum_type: "hot_tub_house"
    t.boolean "family_room"
    t.string "sharing_with"
    t.enum "sharing_bed", enum_type: "sharing_bed"
    t.string "comments"
    t.index ["event_id"], name: "index_bookings_on_event_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "events", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "bookings", "events"
  add_foreign_key "bookings", "users"
end
