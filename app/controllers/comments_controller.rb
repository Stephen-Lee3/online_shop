class CommentsController < ApplicationController
  before_action :authenticate_user!
  def index
  	@product = Product.find(params[:product_id])
  	@comments = @product.comments.all
  	respond_to do |format|
      format.js
  	end
  end

  def create
  	@product = Product.find(params[:product_id])
  	@comment = @product.comments.build(comment_params)
   	if @comment.save
      respond_to do |format|
      	format.html{redirect_to @product}
        end
  	end
  end

  private
   def comment_params
   	params.require(:comment).permit(:user_id,:product_id,:content)
   end
end
