json.array!(@inventory_items) do |inventory_item|
  json.extract! inventory_item, :id, :barcode, :product_name, :description, :selling_price, :unit_of_measure, :qty_on_hand, :location_aisle, :location_area
  json.url inventory_item_url(inventory_item, format: :json)
end
