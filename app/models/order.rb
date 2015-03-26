class Order < ActiveRecord::Base
 belongs_to :user
 has_many :items
 has_many :products, through: :items
 accepts_nested_attributes_for :items
end
