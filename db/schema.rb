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

ActiveRecord::Schema.define(version: 2018_09_17_044357) do

  create_table "add_register_columns", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "classlists", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "teacher"
    t.string "department"
    t.string "number"
    t.string "textbook"
    t.string "day_of_the_week"
    t.integer "time_schedule"
    t.string "season"
    t.string "grade"
    t.string "evaluation"
  end

  create_table "data", force: :cascade do |t|
    t.integer "day_of_the_week"
    t.integer "time_schedule"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "day_data", force: :cascade do |t|
    t.integer "day_of_the_week"
    t.integer "time_schedule"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "class_condition"
  end

  create_table "hoges", force: :cascade do |t|
    t.string "name"
    t.date "sales_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "registers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "registraters", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "email"
    t.string "department"
    t.string "friend_id"
    t.integer "grade"
  end

  create_table "when_days", force: :cascade do |t|
    t.string "day_of_the_week"
    t.string "time_schedule"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
