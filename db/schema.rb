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

ActiveRecord::Schema.define(version: 20150107134203) do

  create_table "cats", force: true do |t|
    t.string   "name",       limit: 255
    t.string   "color",      limit: 255
    t.string   "sex",        limit: 255
    t.string   "breeder",    limit: 255
    t.string   "owner",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "parents", force: true do |t|
    t.integer  "cat_id",     limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "father_id",  limit: 4
    t.integer  "mother_id",  limit: 4
  end

  add_index "parents", ["cat_id"], name: "index_parents_on_cat_id", using: :btree
  add_index "parents", ["father_id"], name: "fk_rails_ed8b2b5b42", using: :btree
  add_index "parents", ["mother_id"], name: "fk_rails_b9bdadb2f3", using: :btree

  create_table "reservations", force: true do |t|
    t.integer  "table_id",   limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "reservations", ["table_id"], name: "index_reservations_on_table_id", using: :btree
  add_index "reservations", ["user_id"], name: "index_reservations_on_user_id", using: :btree

  create_table "tables", force: true do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "users", force: true do |t|
    t.string   "username",        limit: 255
    t.string   "password_digest", limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_foreign_key "parents", "cats", column: "father_id"
  add_foreign_key "parents", "cats", column: "mother_id"
  add_foreign_key "reservations", "tables"
  add_foreign_key "reservations", "users"
end
