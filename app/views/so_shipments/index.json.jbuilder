json.array!(@so_shipments) do |so_shipment|
  json.extract! so_shipment, :id, :sales_order_id, :customer_account_id, :ship_date, :ship_time, :expected_delivery_date, :carrier, :method, :tracking_num, :shipped_by
  json.url so_shipment_url(so_shipment, format: :json)
end
