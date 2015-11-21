json.array!(@so_pick_lists) do |so_pick_list|
  json.extract! so_pick_list, :id, :sales_order_id, :order_line_id
  json.url so_pick_list_url(so_pick_list, format: :json)
end
