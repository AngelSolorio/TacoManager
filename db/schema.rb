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

ActiveRecord::Schema.define(version: 20130814061843) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: true do |t|
    t.integer  "user_id"
    t.integer  "establishment_id"
    t.string   "title"
    t.text     "description",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dishes", force: true do |t|
    t.string   "name",                     null: false
    t.float    "price",      default: 0.0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "establishments", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "address",                null: false
    t.float    "latitude"
    t.float    "longitude"
    t.string   "phone",                  null: false
    t.string   "schedule",               null: false
    t.integer  "points",     default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "establishments", ["points"], name: "index_establishments_on_points", using: :btree

  create_table "identities", force: true do |t|
    t.string   "name",            null: false
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "menus", force: true do |t|
    t.integer  "dish_id"
    t.integer  "establishment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rates", force: true do |t|
    t.integer  "user_id"
    t.integer  "establishment_id"
    t.integer  "rate_value",       default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "requisitions", force: true do |t|
    t.float    "cost",       default: 0.0, null: false
    t.string   "checktime",                null: false
    t.string   "status",                   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name",                           null: false
    t.string   "email"
    t.string   "password_digest"
    t.string   "provider"
    t.string   "uid"
    t.boolean  "active",          default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
