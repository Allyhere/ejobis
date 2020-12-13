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

ActiveRecord::Schema.define(version: 2020_12_12_221647) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.text "release"
    t.string "email"
    t.string "phone"
    t.string "address"
    t.integer "cnpj"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "linkedin"
    t.string "city"
    t.string "state"
    t.string "website"
    t.index ["user_id"], name: "index_companies_on_user_id"
  end

  create_table "ejobers", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.date "birthday"
    t.string "gender"
    t.string "ethnic"
    t.string "deficiency"
    t.string "skills"
    t.string "release"
    t.string "position"
    t.string "address"
    t.integer "cpf"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_ejobers_on_user_id"
  end

  create_table "ejobis", force: :cascade do |t|
    t.bigint "ejober_id", null: false
    t.bigint "company_id", null: false
    t.string "position"
    t.text "release"
    t.date "start_date"
    t.date "end_date"
    t.date "start_time"
    t.date "end_time"
    t.integer "fee"
    t.string "address"
    t.boolean "acceptance"
    t.boolean "validation"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.index ["company_id"], name: "index_ejobis_on_company_id"
    t.index ["ejober_id"], name: "index_ejobis_on_ejober_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "companies", "users"
  add_foreign_key "ejobers", "users"
  add_foreign_key "ejobis", "companies"
  add_foreign_key "ejobis", "ejobers"
end