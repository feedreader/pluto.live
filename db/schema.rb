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

ActiveRecord::Schema.define(version: 1) do

  create_table "activities", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "trackable_id"
    t.string   "trackable_type"
    t.string   "action"
    t.text     "text"
    t.string   "tmpl"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "feeds", force: :cascade do |t|
    t.string   "key",                                 null: false
    t.string   "encoding",           default: "utf8", null: false
    t.string   "format"
    t.string   "title"
    t.string   "auto_title"
    t.string   "title2"
    t.string   "auto_title2"
    t.string   "url"
    t.string   "auto_url"
    t.string   "feed_url"
    t.string   "auto_feed_url"
    t.text     "summary"
    t.string   "generator"
    t.datetime "published"
    t.datetime "built"
    t.datetime "touched"
    t.string   "author"
    t.string   "email"
    t.string   "avatar"
    t.string   "github"
    t.string   "twitter"
    t.string   "meetup"
    t.string   "includes"
    t.string   "excludes"
    t.datetime "last_published"
    t.datetime "fetched"
    t.integer  "http_code"
    t.string   "http_etag"
    t.string   "http_last_modified"
    t.string   "http_server"
    t.string   "md5"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", force: :cascade do |t|
    t.string   "guid"
    t.string   "url"
    t.string   "title"
    t.text     "summary"
    t.text     "content"
    t.datetime "published"
    t.datetime "touched"
    t.integer  "feed_id",    null: false
    t.datetime "fetched"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "logs", force: :cascade do |t|
    t.string   "msg",        null: false
    t.string   "level",      null: false
    t.string   "app"
    t.string   "tag"
    t.integer  "pid"
    t.integer  "tid"
    t.string   "ts"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "props", force: :cascade do |t|
    t.string   "key",        null: false
    t.string   "value",      null: false
    t.string   "kind"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sites", force: :cascade do |t|
    t.string   "key",                null: false
    t.string   "title",              null: false
    t.string   "author"
    t.string   "email"
    t.datetime "updated"
    t.string   "includes"
    t.string   "excludes"
    t.string   "url"
    t.datetime "fetched"
    t.integer  "http_code"
    t.string   "http_etag"
    t.string   "http_last_modified"
    t.string   "http_server"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.integer  "site_id",    null: false
    t.integer  "feed_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
