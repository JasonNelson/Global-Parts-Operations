class CreateSoPickLists < ActiveRecord::Migration
  def change
    create_table :so_pick_lists do |t|
      t.references :sales_order, index: true, foreign_key: true
      t.references :order_line, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
