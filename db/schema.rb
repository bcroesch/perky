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

ActiveRecord::Schema.define(version: 20140208175903) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: true do |t|
    t.string   "name"
    t.string   "stripe_customer_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "perk_selections", force: true do |t|
    t.integer  "user_id"
    t.integer  "perk_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "perk_selections", ["perk_id"], name: "index_perk_selections_on_perk_id", using: :btree
  add_index "perk_selections", ["user_id"], name: "index_perk_selections_on_user_id", using: :btree

  create_table "perks", force: true do |t|
    t.string   "name"
    t.integer  "credits"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
  end

  create_table "purchases", force: true do |t|
    t.string   "kind"
    t.integer  "perk_id"
    t.integer  "user_id"
    t.integer  "credits"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "purchases", ["perk_id"], name: "index_purchases_on_perk_id", using: :btree
  add_index "purchases", ["user_id"], name: "index_purchases_on_user_id", using: :btree

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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.boolean  "superuser"
    t.boolean  "admin"
    t.integer  "monthly_credits"
    t.integer  "account_id"
    t.integer  "adhoc_credits"
  end

  add_index "users", ["account_id"], name: "index_users_on_account_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
