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

ActiveRecord::Schema.define(version: 20150519133147) do

  create_table "deals", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.text     "fine_print"
    t.integer  "quantity_available"
    t.integer  "dispensary_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "price",              default: 0.0
    t.boolean  "medical",            default: false
    t.boolean  "recreational",       default: false
    t.boolean  "active",             default: true
  end

  create_table "dispensaries", force: true do |t|
    t.string   "name"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                                  null: false
    t.string   "encrypted_password",                     null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "recreational",           default: false
    t.boolean  "medical",                default: false
    t.float    "latitude"
    t.float    "longitude"
    t.string   "leafly_slug"
    t.string   "ein"
    t.string   "license_number"
    t.decimal  "balance",                default: 0.0
    t.string   "phone"
    t.string   "logo"
    t.string   "cover_image"
  end

  add_index "dispensaries", ["email"], name: "index_dispensaries_on_email", unique: true
  add_index "dispensaries", ["reset_password_token"], name: "index_dispensaries_on_reset_password_token", unique: true

  create_table "dispensary_applications", force: true do |t|
    t.string   "dispensary_name"
    t.string   "contact_name"
    t.string   "contact_email"
    t.string   "phone"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "medical",         default: false
    t.boolean  "recreational",    default: false
    t.boolean  "verified",        default: false
    t.string   "ein"
    t.string   "license_number"
  end

  create_table "dispensary_rewards", force: true do |t|
    t.string   "title"
    t.decimal  "price",         default: 0.0
    t.integer  "dispensary_id"
    t.boolean  "active",        default: false
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "dispensary_rewards", ["dispensary_id"], name: "index_dispensary_rewards_on_dispensary_id"

  create_table "loyalty_programs", force: true do |t|
    t.integer  "user_id"
    t.integer  "dispensary_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "loyalty_programs", ["dispensary_id"], name: "index_loyalty_programs_on_dispensary_id"
  add_index "loyalty_programs", ["user_id"], name: "index_loyalty_programs_on_user_id"

  create_table "nugdealz_rewards", force: true do |t|
    t.string   "title"
    t.string   "price"
    t.string   "active"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payments", force: true do |t|
    t.integer  "user_id"
    t.integer  "amount"
    t.integer  "deal_id"
    t.string   "charge_token"
    t.string   "card_last_4"
    t.string   "card_brand"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "point_buckets", force: true do |t|
    t.integer  "user_id"
    t.integer  "loyalty_program_id"
    t.decimal  "value",              default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "point_buckets", ["loyalty_program_id"], name: "index_point_buckets_on_loyalty_program_id"
  add_index "point_buckets", ["user_id"], name: "index_point_buckets_on_user_id"

  create_table "redemptions", force: true do |t|
    t.integer  "user_id"
    t.integer  "deal_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "dispensary_id"
    t.boolean  "redeemed",      default: false
  end

  create_table "support_inquiries", force: true do |t|
    t.string   "email"
    t.string   "subject"
    t.integer  "user_id"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "support_inquiries", ["user_id"], name: "index_support_inquiries_on_user_id"

  create_table "users", force: true do |t|
    t.string   "email",                                  null: false
    t.string   "encrypted_password",                     null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                  default: false
    t.string   "stripe_customer_token"
    t.integer  "sign_in_count",          default: 0
    t.decimal  "nugdealz_points",        default: 0.0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
