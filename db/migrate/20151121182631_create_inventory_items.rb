class CreateInventoryItems < ActiveRecord::Migration[4.2]
  def change
    create_table :inventory_items do |t|
      t.integer :barcode
      t.string :product_name
      t.text :description
      t.decimal :selling_price, precision: 5, scale: 2
      t.string :unit_of_measure
      t.integer :qty_on_hand
      t.integer :location_aisle
      t.string :location_area

      t.timestamps null: false
    end
  end
end
