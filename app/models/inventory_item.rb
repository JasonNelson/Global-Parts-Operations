class InventoryItem < ActiveRecord::Base
   has_many :order_lines
   has_many :sales_orders, through: :order_lines
end
