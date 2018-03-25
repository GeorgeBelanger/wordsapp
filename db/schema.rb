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

ActiveRecord::Schema.define(version: 20180324025156) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authentications", force: :cascade do |t|
    t.string   "uid"
    t.string   "token"
    t.string   "provider"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.string   "password_digest"
    t.string   "password_confirmation"
    t.string   "password_salt"
    t.string   "password_hash"
    t.string   "remember_token"
    t.string   "confirmation_token"
    t.string   "profile_picture"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "provider"
    t.string   "uid"
  end

  create_table "words", force: :cascade do |t|
    t.string   "user_id"
    t.string   "language"
    t.string   "untranslated_word"
    t.string   "translated_word"
    t.string   "user_phonem"
    t.integer  "common_rank"
    t.string   "audio_link"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_foreign_key "authentications", "users"
end
