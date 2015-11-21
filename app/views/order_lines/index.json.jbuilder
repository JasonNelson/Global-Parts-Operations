json.array!(@order_lines) do |order_line|
  json.extract! order_line, :id, :qty_ordered, :unit_price, :total_price, :sales_order_id, :inventory_item_id
  json.url order_line_url(order_line, format: :json)
end
