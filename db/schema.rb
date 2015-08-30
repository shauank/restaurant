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

ActiveRecord::Schema.define(version: 20150829180020) do

  create_table "addresses", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "detail_id"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "pincode"
  end

  add_index "addresses", ["detail_id"], name: "index_addresses_on_detail_id", using: :btree

  create_table "cuisines", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "typ"
  end

  create_table "details", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "string"
    t.datetime "hours_from"
    t.datetime "hours_to"
    t.integer  "price_from"
    t.integer  "price_to"
  end

  create_table "cuisines_details", id: false, force: true do |t|
    t.integer "detail_id"
    t.integer "cuisine_id"
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

end
