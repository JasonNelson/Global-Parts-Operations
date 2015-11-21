json.array!(@sales_orders) do |sales_order|
  json.extract! sales_order, :id, :billing_street_add, :billing_city, :billing_state, :billing_zipcode, :shipping_street_address, :shipping_city, :shipping_state, :shipping_zipcode, :cc_fname, :cc_middle_initial, :cc_lname, :cc_number, :cc_security_code, :cc_exp_month, :cc_exp_year, :subtotal, :tax_percent, :shipping_fee, :total, :customer_account_id, :order_line_id, :order_status_id
  json.url sales_order_url(sales_order, format: :json)
end
