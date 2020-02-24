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

ActiveRecord::Schema.define(version: 2020_02_19_231830) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "items", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "apncode"
    t.string "description"
    t.string "author"
    t.string "pcategory"
    t.string "doc_num"
    t.string "ref_num"
    t.decimal "rrp"
    t.decimal "lastbuyprice"
    t.decimal "extax_value"
    t.decimal "tax"
    t.decimal "discount"
    t.integer "stock"
    t.integer "quantity"
    t.date "date"
    t.time "time"
  end

  create_table "monthlytotals", force: :cascade do |t|
    t.integer "year"
    t.integer "month"
    t.decimal "extax"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "yearlytotals", force: :cascade do |t|
    t.integer "year"
    t.decimal "profit"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
