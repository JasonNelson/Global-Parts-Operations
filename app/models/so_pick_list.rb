class SoPickList < ActiveRecord::Base
  belongs_to :sales_order
  belongs_to :order_line
end
