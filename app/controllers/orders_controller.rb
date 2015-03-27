class OrdersController < ApplicationController
  before_action :authenticate_user!
  after_action :delete_same_item_in_cart, only: :create
  def index
   @orders = current_user.orders.includes(:products,:items).paginate(page: params[:page], per_page: 5).order('created_at DESC')
  end

  def show
    @order = Order.find(params[:id])
  end

  def preview
  	@order = Order.new
  	@product = Product.find(params[:product_id]) 
    session[:product_id] = @product.id
    1.times{ @order.items.build(product: @product)}
  end

  def create
  	@order = current_user.orders.build(order_params)
  	if @order.save 
      redirect_to orders_path
  	 else
  	 	flash[:notice] = "提交订单失败"
  	 	render 'preview'
  	end
  end

  private
   def order_params
   	params.require(:order).permit(:buyer,:phone,:address,:user_id,
   		items_attributes: [:order_id,:product_id,:quantity,:cart_id])
   end
   
   def delete_same_item_in_cart
     @cart = current_user.cart
     @item = @cart.items.find_by_product_id(session[:product_id])
     @item.delete if @item
     session[:product_id] = nil
   end
end
