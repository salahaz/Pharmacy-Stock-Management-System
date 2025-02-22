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

ActiveRecord::Schema.define(version: 20171221114709) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bls", force: :cascade do |t|
    t.integer "provider_id"
    t.bigint "order_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "finalpph"
    t.index ["order_id"], name: "index_bls_on_order_id", unique: true
  end

  create_table "medicine_logs", force: :cascade do |t|
    t.integer "receipt_id"
    t.integer "stock_id"
    t.integer "qt_sold"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "medicines", force: :cascade do |t|
    t.string "name"
    t.bigint "barcode"
    t.string "active_substance"
    t.integer "unit_gram"
    t.decimal "tva"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "unit"
    t.index ["barcode"], name: "index_medicines_on_barcode", unique: true
    t.index ["name"], name: "index_medicines_on_name"
  end

  create_table "providers", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "receipts", force: :cascade do |t|
    t.string "client_name"
    t.integer "user_id"
    t.float "finalpph"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sales", force: :cascade do |t|
    t.bigint "stock_id"
    t.integer "quantity_sold"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "total_price"
    t.index ["stock_id"], name: "index_sales_on_stock_id"
  end

  create_table "stocks", force: :cascade do |t|
    t.integer "medicine_qt"
    t.integer "qt_sold"
    t.float "pph"
    t.date "expiration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "bl_id"
    t.bigint "medicine_id"
    t.string "medicine_name"
    t.float "ppv"
    t.index ["bl_id"], name: "index_stocks_on_bl_id"
    t.index ["medicine_id"], name: "index_stocks_on_medicine_id"
  end

  create_table "tiers", force: :cascade do |t|
    t.string "name"
    t.float "value"
    t.boolean "is_flat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "occupation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.boolean "admin", default: false
    t.boolean "pharmacist", default: false
    t.boolean "intern", default: false
    t.index ["name"], name: "index_users_on_name", unique: true
  end

  add_foreign_key "sales", "stocks"
  add_foreign_key "stocks", "bls"
  add_foreign_key "stocks", "medicines"
end
