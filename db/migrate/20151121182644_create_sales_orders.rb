class CreateSalesOrders < ActiveRecord::Migration[4.2]
  def change
    create_table :sales_orders do |t|
      t.string :billing_street_add
      t.string :billing_city
      t.string :billing_state
      t.string :billing_zipcode
      t.string :shipping_street_address
      t.string :shipping_city
      t.string :shipping_state
      t.string :shipping_zipcode
      t.string :cc_fname
      t.string :cc_middle_initial
      t.string :cc_lname
      t.string :cc_number
      t.string :cc_security_code
      t.string :cc_exp_month
      t.string :cc_exp_year
      t.decimal :subtotal, precision: 7, scale: 2
      t.integer :tax_percent
      t.decimal :shipping_fee, precision: 5, scale: 2
      t.decimal :total, precision: 20, scale: 2
      t.references :customer_account, index: true, foreign_key: true
      t.references :order_status, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
