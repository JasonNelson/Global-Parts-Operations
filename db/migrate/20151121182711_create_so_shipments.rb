class CreateSoShipments < ActiveRecord::Migration[4.2]
  def change
    create_table :so_shipments do |t|
      t.references :sales_order, index: true, foreign_key: true
      t.references :customer_account, index: true, foreign_key: true
      t.string :ship_date
      t.string :ship_time
      t.string :expected_delivery_date
      t.string :carrier
      t.string :method
      t.integer :tracking_num
      t.string :shipped_by

      t.timestamps null: false
    end
  end
end
