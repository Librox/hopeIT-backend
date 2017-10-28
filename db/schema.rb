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

ActiveRecord::Schema.define(version: 20171028111639) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "donation_types", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_donation_types_on_name", unique: true
  end

  create_table "donations", force: :cascade do |t|
    t.bigint "donation_type_id"
    t.bigint "donor_id"
    t.bigint "patient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "amount", default: 0, null: false
    t.index ["donation_type_id"], name: "index_donations_on_donation_type_id"
    t.index ["donor_id"], name: "index_donations_on_donor_id"
    t.index ["patient_id"], name: "index_donations_on_patient_id"
  end

  create_table "donors", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "email", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_donors_on_email", unique: true
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "donor_id", null: false
    t.string "title", null: false
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "admin_id", null: false
    t.index ["admin_id"], name: "index_messages_on_admin_id"
    t.index ["donor_id"], name: "index_messages_on_donor_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.text "description", default: "", null: false
    t.string "photo", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "donation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "amount", default: 0, null: false
    t.string "status", default: "pending", null: false
    t.string "payment_uuid", default: "", null: false
    t.string "order_id"
    t.index ["donation_id"], name: "index_payments_on_donation_id"
    t.index ["order_id"], name: "index_payments_on_order_id", unique: true
    t.index ["payment_uuid"], name: "index_payments_on_payment_uuid", unique: true
  end

  add_foreign_key "donations", "donation_types"
  add_foreign_key "donations", "donors"
  add_foreign_key "donations", "patients"
  add_foreign_key "messages", "admins"
  add_foreign_key "messages", "donors"
  add_foreign_key "payments", "donations"
end
