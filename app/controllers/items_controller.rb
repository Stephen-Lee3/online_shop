class ItemsController < ApplicationController
  before_action :find_cart
  before_action :authenticate_user!
  def create
  	@cart = current_user.cart
  	@product = Product.find(params[:product_id])

     if @cart.items.find_by_product_id(@product.id)
        respond_to do |format|
         format.js
         format.html {redirect_to product_path(@product), alert: "该商品已在您购物车内！"}
         
        end
      else
  	@item = @cart.items.build(product: @product)
  	if @item.save
      flash[:notice] = "已添加进购物车！"
      respond_to do |format|
     format.html {redirect_to @product}
      end
   end
  end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.delete
    respond_to do |format|
      format.html{redirect_to current_user.cart}
    end
  end
   
end
