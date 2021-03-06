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

ActiveRecord::Schema.define(version: 20160325013241) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "entries", force: :cascade do |t|
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.string   "headline",                                     null: false
    t.string   "authorship"
    t.text     "summary",                                      null: false
    t.text     "url",                                          null: false
    t.text     "notes"
    t.datetime "published_at", default: '2015-07-16 02:22:06', null: false
    t.integer  "feed_id",                                      null: false
  end

  add_index "entries", ["feed_id", "url"], name: "index_entries_on_feed_id_and_url", unique: true, using: :btree

  create_table "feeds", force: :cascade do |t|
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "name",           null: false
    t.text     "url",            null: false
    t.integer  "user_id"
    t.integer  "publication_id"
  end

  add_index "feeds", ["user_id", "url"], name: "index_feeds_on_user_id_and_url", unique: true, using: :btree

  create_table "publications", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "name",        null: false
    t.text     "description"
    t.text     "url",         null: false
    t.integer  "user_id",     null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",            null: false
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  add_foreign_key "entries", "feeds"
  add_foreign_key "feeds", "publications"
  add_foreign_key "feeds", "users"
  add_foreign_key "publications", "users"
end
