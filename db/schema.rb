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

ActiveRecord::Schema.define(version: 20131127205627) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "airports", force: true do |t|
    t.string   "airport_code"
    t.string   "airport_name"
    t.string   "location_city"
    t.string   "country"
    t.string   "latitude"
    t.string   "longitude"
    t.string   "altitude"
    t.string   "timezone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "flight_legs", force: true do |t|
    t.integer  "leg_no"
    t.string   "flight_no"
    t.integer  "route_id"
    t.decimal  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "flights", force: true do |t|
    t.string   "airline",     null: false
    t.string   "flight_no",   null: false
    t.string   "plane_type",  null: false
    t.datetime "leave_time",  null: false
    t.string   "leave_city",  null: false
    t.datetime "arrive_time", null: false
    t.string   "arrive_city", null: false
    t.text     "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "price",       null: false
    t.string   "cabin_class", null: false
  end

  create_table "routes", force: true do |t|
    t.integer  "route_id"
    t.string   "airport_origin"
    t.string   "airport_destination"
    t.float    "distance"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
  end

end
