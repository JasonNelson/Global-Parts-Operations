class OrderLine < ActiveRecord::Base
  belongs_to :sales_order
  belongs_to :inventory_item
end
