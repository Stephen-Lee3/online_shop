# -*- encoding : utf-8 -*-
class Product < ActiveRecord::Base
mount_uploader :picture, PictureUploader
end
