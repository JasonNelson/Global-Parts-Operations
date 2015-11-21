class SalesOrder < ActiveRecord::Base
  belongs_to :customer_account
  has_many :order_lines
  has_many :inventory_items, through: :order_lines

  after_initialize :init2

  validates :billing_street_add, length: { maximum: 81 }, presence: true
  validates :billing_city, length: { maximum: 26 }, presence: true
  validates :billing_zipcode, length: { maximum: 5 }, numericality: { only_integer: true }, presence: true
  
  validates :shipping_street_address, length: { maximum: 81 }, presence: true
  validates :shipping_city, length: { maximum: 26 }, presence: true
  validates :shipping_zipcode, length: { maximum: 5 }, numericality: { only_integer: true }, presence: true

  validates :cc_fname, length: { maximum: 26 }, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }, presence: true
  validates :cc_middle_initial, length: { maximum: 1 }, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }, presence: true
  validates :cc_lname, length: { maximum: 26 }, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }, presence: true

  validates :cc_number, length: { maximum: 16 }, length: { minimum: 16 }, numericality: { only_integer: true }, presence: true
  validates :cc_security_code, length: { maximum: 3 }, length: { minimum: 3 }, numericality: { only_integer: true }, presence: true

end

private

 def init2
   if self.new_record? && self.order_status_id.nil?
     self.order_status_id = 1
   end

   if self.new_record? && self.customer_account_id.nil?
     self.customer_account_id = 190
   end
 end
