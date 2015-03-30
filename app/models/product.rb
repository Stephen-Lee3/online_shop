# -*- encoding : utf-8 -*-
class Product < ActiveRecord::Base
has_many :items
has_one :order, through: :items
belongs_to :category
has_many :marks
has_many :marking_users, through: :marks, source: :user
mount_uploader :picture, PictureUploader
 
 validates :name, presence: true, length: {maximum: 50}
 validates :price, presence: true, numericality: {greater_than_or_equal_to: 0}
 validates :inventory, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
end
