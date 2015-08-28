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

ActiveRecord::Schema.define(version: 20150826133700) do

  create_table "addresses", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.integer  "pincode"
    t.integer  "restaurant_detail_id"
    t.integer  "restaurant_details_id"
  end

  add_index "addresses", ["restaurant_detail_id"], name: "index_addresses_on_restaurant_detail_id", using: :btree
  add_index "addresses", ["restaurant_details_id"], name: "index_addresses_on_restaurant_details_id", using: :btree

  create_table "cuisines", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
  end

  create_table "food_types", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "typ",        null: false
  end

  create_table "food_types_restaurant_details", id: false, force: true do |t|
    t.integer "restaurant_detail_id"
    t.integer "food_type_id"
  end

  create_table "restaurant_details", force: true do |t|
    t.string   "name"
    t.datetime "hours_from"
    t.datetime "hours_to"
    t.integer  "price_from"
    t.integer  "price_to"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "restaurant_details_cuisines", force: true do |t|
    t.integer "cuisine_id"
    t.integer "restaurant_detail_id"
  end

  add_index "restaurant_details_cuisines", ["cuisine_id"], name: "index_restaurant_details_cuisines_on_cuisine_id", using: :btree
  add_index "restaurant_details_cuisines", ["restaurant_detail_id"], name: "index_restaurant_details_cuisines_on_restaurant_detail_id", using: :btree

end
