# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_10_15_231618) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "favors", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "category"
    t.bigint "user_id"
    t.string "description"
    t.float "latitude"
    t.float "longitude"
    t.string "ip"
    t.string "street"
    t.string "city"
    t.string "state"
    t.string "country"
    t.boolean "use_current_location", default: false, null: false
    t.bigint "performer_id"
    t.boolean "completed"
    t.index ["performer_id"], name: "index_favors_on_performer_id"
    t.index ["user_id"], name: "index_favors_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "favor_id"
    t.integer "performer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["favor_id"], name: "index_notifications_on_favor_id"
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.integer "age"
    t.integer "favors_completed"
    t.integer "favors_offered"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "favors", "users"
  add_foreign_key "favors", "users", column: "performer_id"
  add_foreign_key "notifications", "favors"
  add_foreign_key "notifications", "users"
  add_foreign_key "profiles", "users"
end
