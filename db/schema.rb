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

ActiveRecord::Schema.define(version: 20131201132840) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "carts", force: true do |t|
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
  end

  create_table "line_items", force: true do |t|
    t.integer  "flight_id"
    t.integer  "cart_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.string   "notes"
    t.float    "price"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "orders", ["user_id", "created_at"], name: "index_orders_on_user_id_and_created_at", using: :btree

  create_table "searches", force: true do |t|
    t.string   "departure_airport"
    t.datetime "departure_time"
    t.string   "arrival_airport"
    t.datetime "arrival_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
