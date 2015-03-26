# -*- encoding : utf-8 -*-
class Product < ActiveRecord::Base
has_many :items
belongs_to :category
mount_uploader :picture, PictureUploader
end
