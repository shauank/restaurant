# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160204180341) do

  create_table "addresses", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "detail_id"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "pincode"
    t.string   "slug"
    t.float    "latitude",   limit: 24
    t.float    "longitude",  limit: 24
  end

  add_index "addresses", ["detail_id"], name: "index_addresses_on_detail_id", using: :btree

  create_table "cuisines", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "typ"
  end

  create_table "cuisines_details", id: false, force: true do |t|
    t.integer "detail_id"
    t.integer "cuisine_id"
  end

  create_table "details", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "string"
    t.string   "hours_from"
    t.string   "hours_to"
    t.integer  "price_from"
    t.integer  "price_to"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "slug"
    t.decimal  "per_head_charge",    precision: 10, scale: 2
  end

  create_table "details_food_types", id: false, force: true do |t|
    t.integer "detail_id"
    t.integer "food_type_id"
  end

  create_table "food_types", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "typ"
  end

  create_table "reservations", force: true do |t|
    t.integer  "seats"
    t.date     "reserved_date"
    t.string   "reserved_time"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "detail_id"
    t.string   "slug"
    t.string   "status"
    t.string   "number"
  end

  add_index "reservations", ["detail_id"], name: "index_reservations_on_detail_id", using: :btree
  add_index "reservations", ["user_id"], name: "index_reservations_on_user_id", using: :btree

  create_table "sql_injection", id: false, force: true do |t|
    t.integer "name"
  end

  create_table "transactions", force: true do |t|
    t.decimal  "amount",                  precision: 10, scale: 2
    t.integer  "user_id"
    t.integer  "reservation_id"
    t.string   "transaction_id"
    t.integer  "user_payment_profile_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
  end

  add_index "transactions", ["reservation_id"], name: "index_transactions_on_reservation_id", using: :btree
  add_index "transactions", ["user_id"], name: "index_transactions_on_user_id", using: :btree
  add_index "transactions", ["user_payment_profile_id"], name: "index_transactions_on_user_payment_profile_id", using: :btree

  create_table "user_payment_profiles", force: true do |t|
    t.integer "payment_profile_id"
    t.string  "card_number"
    t.integer "user_id"
  end

  add_index "user_payment_profiles", ["user_id"], name: "index_user_payment_profiles_on_user_id", using: :btree

  create_table "user_profiles", force: true do |t|
    t.string  "provider_name"
    t.string  "provider_token"
    t.integer "user_id"
  end

  add_index "user_profiles", ["user_id"], name: "index_user_profiles_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "roles_mask"
    t.string   "slug"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
