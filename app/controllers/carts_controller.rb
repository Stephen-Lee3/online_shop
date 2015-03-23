class CartsController < ApplicationController
  before_action :find_cart
  def show
  @items = current_user.cart.items.all
  end
end
