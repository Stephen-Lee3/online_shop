class Order < ActiveRecord::Base
 belongs_to :user
 has_one :item, dependent: :destroy
 has_one :product, through: :item
 accepts_nested_attributes_for :item
 
 attr_accessor :verify_code
 validates :buyer, presence: true, length: {minimum: 2, maximum: 20}
 validates :phone, presence: true, length: {minimum: 5, maximum: 15}
 validates :address, presence: true, length: {maximum: 60}

 after_create :increment_sales_counter

 def calcu_total    #订单总价
 	self.item.product.price * self.item.quantity
 end
 
 def judge_total 
    coupon = Coupon.find_by_verify_code(self.verify_code)
    if coupon && coupon.expire_at > Time.now
       if self.total - coupon.value < 0
       	  self.total == 0
       else
       self.total -= coupon.value
       end
       coupon.delete
    end
  end

 private

  def increment_sales_counter
  	product = self.product
  	product.update_attributes(sales: product.sales + self.item.quantity )
  end
end
