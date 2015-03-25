class OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
   @orders = current_user.orders.all
  end

  def show
  end

  def preview
  	@order = Order.new
  	@product = Product.find(params[:product_id])
  	@item = @order.items.build(product: @product)
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

end
