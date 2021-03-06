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

ActiveRecord::Schema.define(version: 20151021053949) do

  create_table "acts", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "performances", force: :cascade do |t|
    t.integer  "show_id"
    t.integer  "act_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "performances", ["act_id"], name: "index_performances_on_act_id"
  add_index "performances", ["show_id"], name: "index_performances_on_show_id"

  create_table "places", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ratings", force: :cascade do |t|
    t.integer  "rating_value"
    t.integer  "user_id"
    t.integer  "song_id"
    t.integer  "release_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "ratings", ["release_id"], name: "index_ratings_on_release_id"
  add_index "ratings", ["song_id"], name: "index_ratings_on_song_id"
  add_index "ratings", ["user_id"], name: "index_ratings_on_user_id"

  create_table "releases", force: :cascade do |t|
    t.string   "title"
    t.datetime "release_date"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "shows", force: :cascade do |t|
    t.datetime "date"
    t.integer  "place_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "note"
  end

  add_index "shows", ["place_id"], name: "index_shows_on_place_id"

  create_table "songs", force: :cascade do |t|
    t.string   "title"
    t.text     "lyrics"
    t.integer  "release_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "tracknumber", default: 1
  end

  add_index "songs", ["release_id"], name: "index_songs_on_release_id"

  create_table "stories", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "user_id"
    t.integer  "song_id"
    t.integer  "release_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "show_id"
  end

  add_index "stories", ["release_id"], name: "index_stories_on_release_id"
  add_index "stories", ["show_id"], name: "index_stories_on_show_id"
  add_index "stories", ["song_id"], name: "index_stories_on_song_id"
  add_index "stories", ["user_id"], name: "index_stories_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",        null: false
    t.string   "encrypted_password",     default: "",        null: false
    t.string   "name"
    t.datetime "birthdate"
    t.string   "role",                   default: "citizen", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,         null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "subscription",           default: "Never"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
