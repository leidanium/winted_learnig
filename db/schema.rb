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

ActiveRecord::Schema.define(version: 2021_11_26_103114) do

  create_table "addresses", force: :cascade do |t|
    t.string "street"
    t.string "compl"
    t.string "zip"
    t.string "city"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "article_attributes", force: :cascade do |t|
    t.string "value"
    t.integer "attribute_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "article_id", null: false
    t.index ["article_id"], name: "index_article_attributes_on_article_id"
    t.index ["attribute_id"], name: "index_article_attributes_on_attribute_id"
  end

  create_table "article_categories", force: :cascade do |t|
    t.integer "article_id", null: false
    t.integer "category_id", null: false
    t.index ["article_id"], name: "index_article_categories_on_article_id"
    t.index ["category_id"], name: "index_article_categories_on_category_id"
  end

  create_table "articles", force: :cascade do |t|
    t.string "name"
    t.float "price"
    t.text "desc"
    t.boolean "sold"
    t.integer "condition"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "address_id", null: false
    t.index ["address_id"], name: "index_articles_on_address_id"
  end

  create_table "attributes", force: :cascade do |t|
    t.string "name"
    t.integer "v_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.boolean "main"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "article_attributes", "articles"
  add_foreign_key "article_categories", "articles"
  add_foreign_key "article_categories", "categories"
  add_foreign_key "articles", "addresses"
end
