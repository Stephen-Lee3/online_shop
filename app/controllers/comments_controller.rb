class CommentsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!, except: [:index, :all]
  before_action :insure_not_black_list, only: [:create]
  def index
  	@product = Product.find(params[:product_id])
    @comments = @product.comments.includes(:user).limit(10).order('created_at DESC')
  	@comments_count = @product.comments.count
    respond_to do |format|
      format.js
  	end
  end

  def create
  	@product = Product.find(params[:product_id])
    @comments = @product.comments.includes(:user).limit(10).order('created_at DESC')
  	@comment = @product.comments.build(comment_params)
   	if @comment.save
      respond_to do |format|
        format.js
      	format.html{redirect_to @product}
        end
  	end
  
  end

  def all
   @product = Product.find(params[:id])
   @comments = @product.comments.includes(:user).paginate(page: params[:page], per_page: 10).order('created_at DESC') 
  end


  def destroy
    @product = Product.find(params[:product_id])
    @comments = @product.comments.includes(:user).limit(10).order('created_at DESC')
    @comment = Comment.find(params[:id])
    if @comment.delete
      respond_to do |format|
           format.html {redirect_to product_path(@comment.product)}
           format.js
      end
    end
  end

  private
   def comment_params
   	params.require(:comment).permit(:user_id,:product_id,:content)
   end
   
   def insure_not_black_list
    if BlackList.where(ip: current_user.current_sign_in_ip).exists?
     flash[:notice] = "抱歉，你已被限制发言。"
     redirect_to :back
    end
   end
end
