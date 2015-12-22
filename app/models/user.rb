# -*- encoding : utf-8 -*-
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  has_one :cart, dependent: :destroy
  has_many :orders
  has_many :marks, dependent: :destroy
  has_many :mark_products, through: :marks, source: :product
  has_many :comments
  has_many :authorities, dependent: :destroy
  has_many :roles, through: :authorities
  has_many :coupons, dependent: :destroy
  has_many :award_items, dependent: :destroy

   mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
 
 validates :nick_name, presence: true, length: {minimum: 2, maximum: 10},
          uniqueness: {case_sensitive: false}

   
   after_create :create_cart
   def create_cart
    Cart.create(user_id: self.id)
   end
   
   def update_score(order_total)
       self.update_attributes(score: self.score + order_total)    
   end  

   def check_avatar
     if avatar.blank?
      "default_avatar.jpg"
    else
      avatar
    end
   end
    
  def has_role?(role)
    if roles.find_by_name(role)
     true
     else
     false  
    end
  end
   
   
   Super_admin = ["admin@admin.com"]
  def super_admin?
    Super_admin.include?(email)
  end

 def marking?(product)
  marks.find_by_product_id(product)
 end

 def unmarked!(mark_product)
   marks.find_by_product_id(mark_product).destroy
 end
end
