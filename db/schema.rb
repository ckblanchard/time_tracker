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

ActiveRecord::Schema.define(version: 20140726055154) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: true do |t|
    t.string   "contact_name"
    t.string   "company"
    t.string   "address"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.string   "phone_number"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "entries", force: true do |t|
    t.date     "entry_date"
    t.time     "start_time"
    t.time     "end_time"
    t.integer  "status",                                    default: 0
    t.integer  "user_id"
    t.integer  "invoice_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "total_time",        precision: 5, scale: 2
    t.integer  "subtotal_cents"
    t.string   "subtotal_currency",                         default: "USD", null: false
  end

  create_table "invoices", force: true do |t|
    t.datetime "invoice_date"
    t.integer  "status",       default: 0
    t.integer  "job_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "invoices", ["job_id"], name: "index_invoices_on_job_id", using: :btree

  create_table "jobs", force: true do |t|
    t.string   "job_name"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "rate_cents",    default: 0,     null: false
    t.string   "rate_currency", default: "USD", null: false
  end

  add_index "jobs", ["client_id"], name: "index_jobs_on_client_id", using: :btree

  create_table "profiles", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "phone_number"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
  end

  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "username"
    t.string   "avatar"
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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
