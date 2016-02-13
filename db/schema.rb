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

ActiveRecord::Schema.define(version: 20160213083220) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cars", force: :cascade do |t|
    t.string   "make"
    t.string   "model"
    t.text     "description"
    t.string   "comfort_class"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "address"
    t.string   "city"
    t.string   "zip_code"
    t.text     "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rental_orders", force: :cascade do |t|
    t.integer  "customer_id"
    t.integer  "user_id"
    t.integer  "car_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "rental_orders", ["car_id"], name: "index_rental_orders_on_car_id", using: :btree
  add_index "rental_orders", ["customer_id"], name: "index_rental_orders_on_customer_id", using: :btree
  add_index "rental_orders", ["user_id"], name: "index_rental_orders_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "rental_orders", "cars"
  add_foreign_key "rental_orders", "customers"
  add_foreign_key "rental_orders", "users"
end
