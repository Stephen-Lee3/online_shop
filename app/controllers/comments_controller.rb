class CommentsController < ApplicationController
  load_and_authorize_resource except: :ban
  before_action :authenticate_user!, except: [:index, :all]
  before_action :insure_can_comment, only: [:create]
  before_action :load_comments_data, except: :all
  def index
  	@comments_count = @product.comments.count
    respond_to do |format|
      format.js
  	end
  end

  def create
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

  
  def ban
    @user = User.find(params[:id])
    @user.update_attributes(status: "ban_comment")
    respond_to do |format| 
      format.js
      format.html {redirect_to @product}
    end
  end

  def destroy
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
   
   def insure_can_comment
    if BlackList.find_by_ip(current_user.current_sign_in_ip) || current_user.status == "ban_comment"
     flash[:notice] = "抱歉，你已被限制发言。"
     redirect_to :back
    end
   end

   def load_comments_data
    @product = Product.find(params[:product_id])
    @comments = @product.comments.includes(:user).limit(10).order('created_at DESC')
   end
end
