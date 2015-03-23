class ItemsController < ApplicationController
  before_action :find_cart
  def create
  	@cart = current_user.cart
  	@product = Product.find(params[:product_id])
  	@item = @cart.items.build(product: @product)
  	if @item.save
     redirect_to @product
      else
      	flash[:notice] = "添加失败！"
      	redirect_to @product
   end
  end

  def destroy
  end
  
end
