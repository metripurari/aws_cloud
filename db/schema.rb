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

ActiveRecord::Schema.define(version: 20191218090349) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "aws_amazon_cloud_products", force: :cascade do |t|
    t.string "sku"
    t.string "productFamily"
    t.string "servicecode"
    t.string "location"
    t.string "locationType"
    t.string "usagetype"
    t.string "operation"
    t.string "requestDescription"
    t.string "requestType"
    t.string "servicename"
    t.string "transferType"
    t.string "fromLocation"
    t.string "fromLocationType"
    t.string "toLocationType"
    t.string "toLocation"
    t.string "group"
    t.string "groupDescription"
    t.bigint "aws_amazon_cloud_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aws_amazon_cloud_id"], name: "index_aws_amazon_cloud_products_on_aws_amazon_cloud_id"
  end

  create_table "aws_amazon_clouds", force: :cascade do |t|
    t.string "formatVersion"
    t.string "disclaimer"
    t.string "offerCode"
    t.string "version"
    t.datetime "publicationDate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "price_dimensions", force: :cascade do |t|
    t.string "rateCode"
    t.string "description"
    t.string "beginRange"
    t.string "endRange"
    t.string "unit"
    t.bigint "product_on_demand_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_on_demand_id"], name: "index_price_dimensions_on_product_on_demand_id"
  end

  create_table "price_per_units", force: :cascade do |t|
    t.string "unit"
    t.string "price"
    t.bigint "price_dimension_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["price_dimension_id"], name: "index_price_per_units_on_price_dimension_id"
  end

  create_table "product_on_demands", force: :cascade do |t|
    t.string "offerTermCode"
    t.datetime "effectiveDate"
    t.bigint "aws_amazon_cloud_product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aws_amazon_cloud_product_id"], name: "index_product_on_demands_on_aws_amazon_cloud_product_id"
  end

  add_foreign_key "aws_amazon_cloud_products", "aws_amazon_clouds"
  add_foreign_key "price_dimensions", "product_on_demands"
  add_foreign_key "price_per_units", "price_dimensions"
  add_foreign_key "product_on_demands", "aws_amazon_cloud_products"
end
