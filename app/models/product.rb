# -*- encoding : utf-8 -*-
class Product < ActiveRecord::Base
has_many :items
mount_uploader :picture, PictureUploader
end
