class OrdersController < ApplicationController
  before_action :authenticate_user!
  after_action :delete_same_item_in_cart, only: :create #从购物车删除已买商品
  after_action :update_inventory, only: :create #更新库存
  load_and_authorize_resource except: :preview
  def index
   @orders = current_user.orders.includes(:product,:item).paginate(page: params[:page], per_page: 5).order('created_at DESC')
  end

  def show
    @order = Order.find(params[:id])
  end

  def preview
  	@order = Order.new
  	@product = Product.find(params[:product_id]) 
    1.times{ @order.build_item(product: @product)}
  end

  def create
  	@order = current_user.orders.build(order_params)
    @order.total = @order.calcu_total 
   
    if !@order.verify_code.blank?
       @order.judge_total  
    end

    if @order.save 
      redirect_to orders_path
  	 else
  	 	flash[:notice] = "提交订单失败"
  	 	render 'preview'
  	end
  end

  private
   def order_params
   	params.require(:order).permit(:buyer,:phone,:address,:user_id,:verify_code,
   		item_attributes: [:order_id,:product_id,:quantity,:cart_id]
      )
   end
   
   def delete_same_item_in_cart #从购物车删除商品
     @cart = current_user.cart
     @item = @cart.items.find_by_product_id(@product.id)
     @item.delete if @item
   end

   def update_inventory  #更新库存
      @product = @order.product
      product_inventory = @product.inventory - @order.item.quantity
      @product.update_attributes(inventory: product_inventory)
   end
end
