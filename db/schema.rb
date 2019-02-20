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

ActiveRecord::Schema.define(version: 2015_11_21_182711) do

  create_table "customer_accounts", force: :cascade do |t|
    t.string "fname"
    t.string "middle_initial"
    t.string "lname"
    t.string "street_add"
    t.string "city"
    t.string "state"
    t.string "zipcode"
    t.string "email"
    t.string "home_phone"
    t.string "cell_phone"
    t.string "phone_pref"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inventory_items", force: :cascade do |t|
    t.integer "barcode"
    t.string "product_name"
    t.text "description"
    t.decimal "selling_price", precision: 5, scale: 2
    t.string "unit_of_measure"
    t.integer "qty_on_hand"
    t.integer "location_aisle"
    t.string "location_area"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_lines", force: :cascade do |t|
    t.integer "qty_ordered"
    t.decimal "unit_price", precision: 5, scale: 2
    t.decimal "total_price", precision: 7, scale: 2
    t.integer "sales_order_id"
    t.integer "inventory_item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["inventory_item_id"], name: "index_order_lines_on_inventory_item_id"
    t.index ["sales_order_id"], name: "index_order_lines_on_sales_order_id"
  end

  create_table "order_statuses", force: :cascade do |t|
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sales_orders", force: :cascade do |t|
    t.string "billing_street_add"
    t.string "billing_city"
    t.string "billing_state"
    t.string "billing_zipcode"
    t.string "shipping_street_address"
    t.string "shipping_city"
    t.string "shipping_state"
    t.string "shipping_zipcode"
    t.string "cc_fname"
    t.string "cc_middle_initial"
    t.string "cc_lname"
    t.string "cc_number"
    t.string "cc_security_code"
    t.string "cc_exp_month"
    t.string "cc_exp_year"
    t.decimal "subtotal", precision: 7, scale: 2
    t.integer "tax_percent"
    t.decimal "shipping_fee", precision: 5, scale: 2
    t.decimal "total", precision: 20, scale: 2
    t.integer "customer_account_id"
    t.integer "order_status_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_account_id"], name: "index_sales_orders_on_customer_account_id"
    t.index ["order_status_id"], name: "index_sales_orders_on_order_status_id"
  end

  create_table "so_pick_lists", force: :cascade do |t|
    t.integer "sales_order_id"
    t.integer "order_line_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_line_id"], name: "index_so_pick_lists_on_order_line_id"
    t.index ["sales_order_id"], name: "index_so_pick_lists_on_sales_order_id"
  end

  create_table "so_shipments", force: :cascade do |t|
    t.integer "sales_order_id"
    t.integer "customer_account_id"
    t.string "ship_date"
    t.string "ship_time"
    t.string "expected_delivery_date"
    t.string "carrier"
    t.string "method"
    t.integer "tracking_num"
    t.string "shipped_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_account_id"], name: "index_so_shipments_on_customer_account_id"
    t.index ["sales_order_id"], name: "index_so_shipments_on_sales_order_id"
  end

end
