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

ActiveRecord::Schema.define(version: 20180307222410) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accepted_plans", force: :cascade do |t|
    t.integer  "insurance_plan_id"
    t.integer  "office_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "accepted_plans", ["insurance_plan_id"], name: "index_accepted_plans_on_insurance_plan_id", using: :btree
  add_index "accepted_plans", ["office_id"], name: "index_accepted_plans_on_office_id", using: :btree

  create_table "addresses", force: :cascade do |t|
    t.string   "street1"
    t.string   "street2"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "office_id"
    t.string   "addressable_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "claims", force: :cascade do |t|
    t.integer  "office_id"
    t.integer  "user_id"
    t.string   "code"
    t.datetime "notified_at"
    t.boolean  "successful",  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employees", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "office_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "employees", ["user_id", "office_id"], name: "index_employees_on_user_id_and_office_id", unique: true, using: :btree

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "insurance_carriers", force: :cascade do |t|
    t.string   "logo"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "insurance_plans", force: :cascade do |t|
    t.integer  "insurance_carrier_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "insurance_plans", ["insurance_carrier_id"], name: "index_insurance_plans_on_insurance_carrier_id", using: :btree

  create_table "offices", force: :cascade do |t|
    t.string   "name",                  default: "",    null: false
    t.string   "phone"
    t.text     "services_description"
    t.text     "awards_description"
    t.text     "email"
    t.boolean  "claimed",               default: false, null: false
    t.string   "slug"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "banner"
    t.string   "languages"
    t.boolean  "public_transit",        default: false
    t.boolean  "wheelchair_accessible", default: false
  end

  add_index "offices", ["slug"], name: "index_offices_on_slug", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.integer  "office_id"
    t.integer  "yelp_account_id"
    t.text     "text"
    t.string   "url"
    t.decimal  "rating"
    t.jsonb    "user_info"
    t.datetime "posted_at"
    t.jsonb    "raw_response"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reviews", ["office_id"], name: "index_reviews_on_office_id", using: :btree
  add_index "reviews", ["yelp_account_id"], name: "index_reviews_on_yelp_account_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: ""
    t.string   "encrypted_password",     default: "",        null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,         null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.boolean  "admin",                  default: false
    t.string   "type",                   default: "Patient"
    t.string   "first_name"
    t.string   "phone"
    t.text     "services_description"
    t.text     "awards_description"
    t.boolean  "verified"
    t.string   "avatar"
    t.string   "slug"
    t.string   "last_name"
    t.boolean  "seeded",                 default: false
    t.string   "title"
    t.string   "gender"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["slug"], name: "index_users_on_slug", using: :btree

  create_table "yelp_accounts", force: :cascade do |t|
    t.integer  "office_id"
    t.string   "external_id"
    t.string   "url"
    t.string   "name"
    t.decimal  "rating"
    t.integer  "review_count"
    t.jsonb    "raw_response"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "yelp_accounts", ["office_id"], name: "index_yelp_accounts_on_office_id", using: :btree

end
