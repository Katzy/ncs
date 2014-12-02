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

ActiveRecord::Schema.define(version: 20141202004900) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "teams", force: true do |t|
    t.string   "name",       null: false
    t.string   "section",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "coach"
    t.string   "cell"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                  default: false
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "wrestlers", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "weight"
    t.integer  "grade"
    t.integer  "wins"
    t.integer  "losses"
    t.integer  "section_place"
    t.integer  "state_place"
    t.integer  "tourney1_place"
    t.integer  "tourney2_place"
    t.integer  "tourney3_place"
    t.integer  "tourney4_place"
    t.integer  "tourney5_place"
    t.integer  "tourney6_place"
    t.integer  "tourney7_place"
    t.integer  "tourney8_place"
    t.integer  "team_id"
    t.text     "comments"
    t.string   "school"
  end

  add_index "wrestlers", ["team_id"], name: "index_wrestlers_on_team_id", using: :btree

end
