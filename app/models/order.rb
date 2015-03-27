class Order < ActiveRecord::Base
 belongs_to :user
 has_one :item
 has_one :product, through: :item
 accepts_nested_attributes_for :item

 validates :buyer, presence: true, length: {minimum: 2, maximum: 20}
 validates :phone, presence: true, length: {minimum: 5, maximum: 15}
 validates :address, presence: true, length: {maximum: 60}

 def total_price    #订单总价
 	self.product.price * self.item.quantity
 end
end
