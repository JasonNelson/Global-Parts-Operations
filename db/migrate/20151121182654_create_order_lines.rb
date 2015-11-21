class CreateOrderLines < ActiveRecord::Migration
  def change
    create_table :order_lines do |t|
      t.integer :qty_ordered
      t.decimal :unit_price, precision: 5, scale: 2
      t.decimal :total_price, precision: 7, scale: 2
      t.references :sales_order, index: true, foreign_key: true
      t.references :inventory_item, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
