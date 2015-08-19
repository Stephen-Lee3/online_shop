# -*- encoding : utf-8 -*-
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  has_one :cart, dependent: :destroy
  has_many :orders
  has_many :marks, dependent: :destroy
  has_many :mark_products, through: :marks, source: :product
  has_many :comments
   mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
 
 validates :nick_name, presence: true, length: {minimum: 2, maximum: 10},
          uniqueness: {case_sensitive: false}

   
   after_create :create_cart
   def create_cart
    Cart.create(user_id: self.id)
   end

 def marking?(product)
  marks.find_by_product_id(product)
 end

 def unmarked!(mark_product)
   marks.find_by_product_id(mark_product).destroy
 end
end
