class ItemsController < ApplicationController
  before_action :find_cart
  def create
  	@cart = current_user.cart
  	@product = Product.find(params[:product_id])

     if @cart.items.find_by_product_id(@product)
        # not finish
      else
  	@item = @cart.items.build(product: @product)
  	if @item.save
      respond_to do |format|
     format.html {redirect_to @product}
     format.js
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
