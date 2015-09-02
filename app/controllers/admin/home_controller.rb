class Admin::HomeController < ApplicationController
  def index
  @time = Time.now.strftime("%Y-%m-%d %H:%M:%S")
  #用户最多的10个城市
  @top_provinces = User.select("s_province, count(*)").group("s_province").order("count(*) DESC").limit(10)
   
   @provinces_user_count = [] #10个城市的用户数
   @top_provinces.each do |province|
    @provinces_user_count << User.where(s_province: province.s_province).count
   end

   @male_count = User.where(sex: "male").count
   @female_count = User.where(sex: "female").count
  end
end
