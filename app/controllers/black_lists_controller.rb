class BlackListsController < ApplicationController
  def create
  	@black_list = BlackList.new()
  	@black_list.email = params[:email]
  	@black_list.ip = params[:ip]
   if @black_list.save
   	flash[:notice] = "已拉入ip黑名单！"
     redirect_to :back
   end
  end
end
