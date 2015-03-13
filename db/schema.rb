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

ActiveRecord::Schema.define(version: 0) do

  create_table "books", force: true do |t|
    t.string "title",       limit: 50
    t.string "description", limit: 50
  end

  create_table "comments", force: true do |t|
    t.text    "content"
    t.integer "picture_id", null: false
  end

  add_index "comments", ["picture_id"], name: "index_comments_picture"

  create_table "pictures", force: true do |t|
    t.string    "title",                     limit: 50
    t.string    "description",               limit: 50
    t.string    "picture_file_file_name"
    t.string    "picture_file_content_type"
    t.integer   "picture_file_file_size"
    t.timestamp "picture_file_updated_at"
  end

end
