class Admin::UsersController < Admin::BaseController
  def index
   	@users = User.all.paginate(page: params[:page], per_page: 30).order("created_at desc")
    @admin_users = Role.find_by_name("admin").users.paginate(page: params[:page], per_page: 30).order("created_at desc")
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update_attributes(user_params)
  		flash[:notice] = "update successful"
  	else
  		flash[:notice] = "failed!"
   end
    redirect_to admin_users_path
  end

  def destroy
  end

  private
  def user_params
  	params.require(:user).permit(:nick_name,:real_name, :phone, :address)
  end
end
