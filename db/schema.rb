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

ActiveRecord::Schema.define(version: 2019_03_20_021815) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "abilities", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "usable_card_id"
    t.index ["usable_card_id"], name: "index_abilities_on_usable_card_id"
  end

  create_table "decks", force: :cascade do |t|
    t.string "name"
    t.string "legion1"
    t.string "legion2"
    t.string "tier"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "card_1"
    t.string "card_2"
    t.string "card_3"
    t.string "card_4"
    t.string "card_5"
    t.string "card_6"
    t.string "card_7"
    t.string "card_8"
    t.string "card_9"
    t.string "card_10"
    t.string "card_11"
    t.string "card_12"
    t.integer "user_id"
  end

  create_table "usable_cards", force: :cascade do |t|
    t.string "name"
    t.string "legion"
    t.string "tier"
    t.string "card_type"
    t.integer "stage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "cooldown"
    t.integer "cost"
    t.integer "squad_size"
    t.integer "health"
    t.string "armor"
    t.integer "range"
    t.integer "damage"
    t.float "attack_speed"
    t.string "image_url"
    t.bigint "deck_id"
    t.index ["deck_id"], name: "index_usable_cards_on_deck_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "votes", id: :serial, force: :cascade do |t|
    t.string "votable_type"
    t.integer "votable_id"
    t.string "voter_type"
    t.integer "voter_id"
    t.boolean "vote_flag"
    t.string "vote_scope"
    t.integer "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
    t.index ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"
  end

  add_foreign_key "abilities", "usable_cards"
  add_foreign_key "usable_cards", "decks"
end
