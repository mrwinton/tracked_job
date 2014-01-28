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

ActiveRecord::Schema.define(version: 20140128084338) do

  create_table "tracked_jobs", force: true do |t|
    t.string   "uuid",       null: false
    t.integer  "user_id"
    t.integer  "job_id",     null: false
    t.boolean  "success"
    t.text     "data"
    t.datetime "started_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
