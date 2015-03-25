# -*- encoding : utf-8 -*-
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  has_one :cart, dependent: :destroy
  has_many :orders
   mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
 
 validates :nick_name, presence: true, length: {minimum: 2, maximum: 10},
          uniqueness: {case_sensitive: false}

end
