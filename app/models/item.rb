class Item < ActiveRecord::Base
belongs_to :product
belongs_to :cart
belongs_to :order

 validates :quantity, presence: true, 
 numericality: {only_integer: true, greater_than_or_equal_to: 0,
 	less_than_or_equal_to: :product_inventory}
 validates :product_id, presence: true

 def product_inventory
 	self.product.inventory
 end
end
