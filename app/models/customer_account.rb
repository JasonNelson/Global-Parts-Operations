class CustomerAccount < ActiveRecord::Base
   has_many :sales_orders, :dependent => :destroy

   validates :email, confirmation: true
   # validates :email_confirmation, presence: true
   
   validates :fname, length: { maximum: 26 }, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }, presence: true
   validates :middle_initial, length: { maximum: 1 }, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }, presence: true
   validates :lname, length: { maximum: 26 }, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }, presence: true

   validates :street_add, length: { maximum: 81 }, presence: true
   validates :city, length: { maximum: 26 }, presence: true
   validates :zipcode, length: { maximum: 5 }, numericality: { only_integer: true }, presence: true

   validates :home_phone, length: { maximum: 20 }, numericality: { only_integer: true }
   validates :cell_phone, length: { maximum: 20 }, numericality: { only_integer: true }, presence: true
end
