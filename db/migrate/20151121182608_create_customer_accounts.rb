class CreateCustomerAccounts < ActiveRecord::Migration[4.2]
  def change
    create_table :customer_accounts do |t|
      t.string :fname
      t.string :middle_initial
      t.string :lname
      t.string :street_add
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :email
      t.string :home_phone
      t.string :cell_phone
      t.string :phone_pref
      t.string :password

      t.timestamps null: false
    end
  end
end
