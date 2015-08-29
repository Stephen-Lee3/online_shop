class Admin::ProductsController < ApplicationController
  def index
   @products = Product.all.paginate(page: params[:page], per_page: 30).order("created_at desc")
  end

  def new
  end

  def create
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(product_params)
      flash[:notice] = "update successful"
    else
      flash[:notice] = "failed!"
   end
    redirect_to admin_products_path
  end

  def destroy
  end

  private
  def product_params
    params.require(:product).permit(:name,:price,:inventory,:picture,:description)
  end
end
