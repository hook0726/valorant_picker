# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_05_21_105125) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "agent_picks", force: :cascade do |t|
    t.integer "match_id", null: false
    t.string "team_name"
    t.string "player_name"
    t.string "agent_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "map_id", null: false
    t.index ["map_id"], name: "index_agent_picks_on_map_id"
    t.index ["match_id"], name: "index_agent_picks_on_match_id"
  end

  create_table "agents", force: :cascade do |t|
    t.string "name"
    t.string "role"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "available_agents", force: :cascade do |t|
    t.bigint "player_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "agent_id"
    t.index ["player_id"], name: "index_available_agents_on_player_id"
  end

  create_table "composition_picks", force: :cascade do |t|
    t.bigint "team_composition_id", null: false
    t.bigint "agent_id", null: false
    t.string "player_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agent_id"], name: "index_composition_picks_on_agent_id"
    t.index ["team_composition_id"], name: "index_composition_picks_on_team_composition_id"
  end

  create_table "maps", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "match_maps", force: :cascade do |t|
    t.bigint "match_id", null: false
    t.bigint "map_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["map_id"], name: "index_match_maps_on_map_id"
    t.index ["match_id"], name: "index_match_maps_on_match_id"
  end

  create_table "matches", force: :cascade do |t|
    t.string "title"
    t.string "subtitle"
    t.string "team1"
    t.string "team2"
    t.string "result"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "patch"
    t.datetime "match_time"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.string "role"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_players_on_user_id"
  end

  create_table "team_compositions", force: :cascade do |t|
    t.bigint "match_id", null: false
    t.bigint "map_id", null: false
    t.string "team_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["map_id"], name: "index_team_compositions_on_map_id"
    t.index ["match_id"], name: "index_team_compositions_on_match_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "agent_picks", "maps"
  add_foreign_key "agent_picks", "matches"
  add_foreign_key "available_agents", "players"
  add_foreign_key "composition_picks", "agents"
  add_foreign_key "composition_picks", "team_compositions"
  add_foreign_key "match_maps", "maps"
  add_foreign_key "match_maps", "matches"
  add_foreign_key "players", "users"
  add_foreign_key "team_compositions", "maps"
  add_foreign_key "team_compositions", "matches"
end
