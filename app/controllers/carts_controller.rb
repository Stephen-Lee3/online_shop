class CartsController < ApplicationController
 load_and_authorize_resource
 before_action :authenticate_user!, :find_cart 
  def show
  @items = current_user.cart.items.includes(:product).paginate(page: params[:page], per_page: 5).order('created_at DESC')
  end

  def destroy
  	@items = current_user.cart.items.all
  	@items.delete_all
  	redirect_to cart_path(current_user.cart)
  end
end
