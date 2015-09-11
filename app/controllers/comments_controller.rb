class CommentsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!, except: [:index, :all]
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

  private
   def comment_params
   	params.require(:comment).permit(:user_id,:product_id,:content)
   end
end
