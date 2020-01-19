# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_200_119_014_444) do
  create_table "categories", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_categories_on_name", unique: true
  end

  create_table "cocktails", force: :cascade do |t|
    t.string "name", null: false
    t.string "youtube_link", default: "", null: false
    t.text "ingredients", default: "", null: false
    t.string "glassware", default: "", null: false
    t.text "technique", default: "", null: false
    t.string "garnish", default: "", null: false
    t.boolean "signature", default: false, null: false
    t.boolean "menu", default: false, null: false
    t.integer "category_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "image_data"
    t.index ["category_id"], name: "index_cocktails_on_category_id"
    t.index ["name"], name: "index_cocktails_on_name", unique: true
  end
end
