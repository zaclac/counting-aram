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

ActiveRecord::Schema.define(version: 20150113182421) do

  create_table "champion_lists", force: :cascade do |t|
    t.text     "list"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "champions", force: :cascade do |t|
    t.string   "name"
    t.integer  "champID"
    t.integer  "games",                 default: 0
    t.integer  "wins",                  default: 0
    t.integer  "losses",                default: 0
    t.integer  "kills",                 default: 0
    t.integer  "deaths",                default: 0
    t.integer  "assists",               default: 0
    t.integer  "pentakills",            default: 0
    t.integer  "quadrakills",           default: 0
    t.integer  "double_kills",          default: 0
    t.integer  "triple_kills",          default: 0
    t.integer  "largest_killing_spree", default: 0
    t.integer  "killing_sprees",        default: 0
    t.integer  "summoner_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "champions", ["summoner_id"], name: "index_champions_on_summoner_id"

  create_table "summoners", force: :cascade do |t|
    t.string   "name"
    t.integer  "game_count", default: 0
    t.string   "last_game",  default: "0"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "summonerID"
  end

end
