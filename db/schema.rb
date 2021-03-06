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

ActiveRecord::Schema.define(version: 20200630141626) do

  create_table "events", force: :cascade do |t|
    t.string "eventname"
    t.string "place"
    t.date "eventday"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "eventdetail"
  end

  create_table "pboxes", force: :cascade do |t|
    t.string "pbox_name"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_pboxes_on_user_id"
  end

  create_table "refrigerators", force: :cascade do |t|
    t.string "name"
    t.date "removal_day", default: "2020-05-06"
    t.date "expiration_date"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_refrigerators_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "admin", default: false
    t.string "department"
    t.integer "room"
    t.date "removal_day", default: "2020-05-06"
    t.string "uid"
    t.string "provider"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
