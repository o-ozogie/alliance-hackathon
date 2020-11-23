# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_23_223520) do

  create_table "alerts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "user_email"
    t.bigint "log_id"
    t.index ["log_id"], name: "index_alerts_on_log_id"
  end

  create_table "infected_users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "infected_at"
    t.string "user_email"
  end

  create_table "logs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "created_at"
    t.bigint "spots_id"
    t.string "user_email"
    t.index ["spots_id"], name: "index_logs_on_spots_id"
  end

  create_table "spots", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.decimal "longitude", precision: 15, scale: 10
    t.decimal "latitude", precision: 15, scale: 10
  end

  create_table "users", primary_key: "email", id: :string, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "password", null: false
    t.string "name"
    t.date "birth_date"
    t.string "address"
    t.string "string"
    t.string "blood_type"
  end

end
