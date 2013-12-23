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

ActiveRecord::Schema.define(version: 20131223035231) do

  create_table "adventure_asset_types", force: true do |t|
    t.string   "adventure_asset_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "adventure_assets", force: true do |t|
    t.integer  "adventure_id"
    t.text     "comment"
    t.integer  "adventure_asset_types_id"
    t.binary   "asset"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "adventure_comments", force: true do |t|
    t.integer  "adventure_id"
    t.text     "comment"
    t.float    "comment_lat"
    t.float    "comment_lon"
    t.integer  "comment_elevation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "adventure_coordinates", force: true do |t|
    t.integer  "adventure_id"
    t.datetime "date_time"
    t.float    "lat"
    t.float    "lon"
    t.integer  "elevation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "adventure_types", force: true do |t|
    t.string   "adventure_type"
    t.string   "string"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "adventures", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "comments"
    t.integer  "type"
    t.string   "closestCityStart"
    t.string   "closestCityEnd"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "f_name"
    t.string   "l_name"
    t.string   "email"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
