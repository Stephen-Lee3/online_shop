class CartsController < ApplicationController
  before_action :find_cart
  def show
  @items = current_user.cart.items.paginate(page: params[:page], per_page: 5).order('created_at DESC')
  end
end
