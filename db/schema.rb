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

ActiveRecord::Schema[7.0].define(version: 2025_01_10_012828) do
  create_table "comments", charset: "utf8mb3", force: :cascade do |t|
    t.text "text", null: false
    t.string "from"
    t.bigint "message_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["message_id"], name: "index_comments_on_message_id"
  end

  create_table "dtct_reqs", charset: "utf8mb3", force: :cascade do |t|
    t.string "memo"
    t.bigint "message_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["message_id"], name: "index_dtct_reqs_on_message_id"
  end

  create_table "letters", charset: "utf8mb3", force: :cascade do |t|
    t.text "text", null: false
    t.bigint "message_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["message_id"], name: "index_letters_on_message_id"
  end

  create_table "messages", charset: "utf8mb3", force: :cascade do |t|
    t.string "to"
    t.string "date"
    t.string "from"
    t.boolean "permit_comment", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.string "uuid"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "users", charset: "utf8mb3", force: :cascade do |t|
    t.string "nickname", null: false
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

  add_foreign_key "comments", "messages"
  add_foreign_key "dtct_reqs", "messages"
  add_foreign_key "letters", "messages"
  add_foreign_key "messages", "users"
end
