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

ActiveRecord::Schema.define(version: 20171222073317) do

  create_table "admins", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "remember_digest"
  end

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.string "gender"
    t.string "designation"
    t.string "phone"
    t.string "email"
    t.date "date_of_join"
    t.string "address"
    t.boolean "active"
    t.string "username"
    t.string "personal_email"
    t.date "date_of_birth"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.string "picture"
    t.index ["email"], name: "index_employees_on_email", unique: true
  end

end
