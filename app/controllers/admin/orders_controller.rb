class Admin::OrdersController < Admin::BaseController
  def index
  	@orders = Order.all.paginate(page: params[:page], per_page: 30).order("created_at desc")
  end

  def edit
  	@order = Order.find(params[:id])
  end

  def update
  	@order = Order.find(params[:id])
  	@order.update_attributes(order_params)
  	flash[:notice] = "修改完成"
  	redirect_to admin_orders_path
  end

  def destroy
  	@order = Order.find(params[:id])
  	@order.delete
  	redirect_to admin_orders_path
  end

  private
   def order_params
   	params.require(:order).permit(:buyer, :phone,:address)
   end
end
