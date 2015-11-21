class SoShipment < ActiveRecord::Base
  belongs_to :sales_order
  belongs_to :customer_account

  after_initialize :init

  validates :tracking_num, length: { maximum: 10 }, numericality: { only_integer: true }, presence: true
  validates :shipped_by, length: { maximum: 5 }, numericality: { only_integer: true }, presence: true
end

private

 def init
   if self.new_record? && self.customer_account_id.nil?
     self.customer_account_id = 2283
   end

   # get current time and date
   time = Time.new

   if self.new_record? && self.ship_date.nil?
     self.ship_date = time.month.to_s + '/' + time.day.to_s + '/' + time.year.to_s
   end

   if self.new_record? && self.ship_time.nil?
     self.ship_time = time.hour.to_s + ':' + time.min.to_s + ':' + time.sec.to_s + ' ' + time.zone.to_s
   end

   # add 3 days for shipping
   days = 3  # = 60 * 60 * 24
   t = Time.now + days * 86400

   if self.new_record? && self.expected_delivery_date.nil?
     self.expected_delivery_date = t.month.to_s + '/' + t.day.to_s + '/' + t.year.to_s
   end
 end
