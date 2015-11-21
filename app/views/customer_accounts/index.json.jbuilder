json.array!(@customer_accounts) do |customer_account|
  json.extract! customer_account, :id, :fname, :middle_initial, :lname, :street_add, :city, :state, :zipcode, :email, :home_phone, :cell_phone, :phone_pref, :password
  json.url customer_account_url(customer_account, format: :json)
end
