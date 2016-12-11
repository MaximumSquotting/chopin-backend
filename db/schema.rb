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

ActiveRecord::Schema.define(version: 20161211190506) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "offers", force: :cascade do |t|
    t.string   "name",                                          default: "", null: false
    t.string   "description",                                   default: "", null: false
    t.integer  "cost_per_person"
    t.integer  "max_number_of_people"
    t.integer  "user_id"
    t.datetime "created_at",                                                 null: false
    t.datetime "updated_at",                                                 null: false
    t.string   "address",                                       default: "", null: false
    t.decimal  "latitude",             precision: 10, scale: 6
    t.decimal  "longitude",            precision: 10, scale: 6
    t.datetime "offer_date"
    t.index ["user_id"], name: "index_offers_on_user_id", using: :btree
  end

  create_table "payments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "offer_id"
    t.integer  "amount"
    t.string   "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["offer_id"], name: "index_payments_on_offer_id", using: :btree
    t.index ["user_id"], name: "index_payments_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                                            default: "",      null: false
    t.string   "address",                                         default: "",      null: false
    t.decimal  "latitude",               precision: 10, scale: 6, default: "0.0",   null: false
    t.decimal  "longitude",              precision: 10, scale: 6, default: "0.0",   null: false
    t.string   "provider",                                        default: "email", null: false
    t.string   "uid",                                             default: "",      null: false
    t.string   "email",                                           default: "",      null: false
    t.string   "encrypted_password",                              default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                                   default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.json     "tokens"
    t.datetime "created_at",                                                        null: false
    t.datetime "updated_at",                                                        null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree
  end

  add_foreign_key "offers", "users"
  add_foreign_key "payments", "offers"
  add_foreign_key "payments", "users"
end
