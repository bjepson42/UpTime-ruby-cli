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

ActiveRecord::Schema.define(version: 4) do

  create_table "activities", force: :cascade do |t|
    t.string   "status"
    t.integer  "user_id"
    t.integer  "possibility_id"
    t.integer  "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "exclude",        default: false
  end

  create_table "possibilities", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "past_tense"
    t.integer  "physical_intensity"
    t.integer  "mental_intensity"
    t.integer  "fun_index"
    t.integer  "duration_in_minutes"
    t.string   "necessary_location"
    t.boolean  "others_required"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "nick_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
