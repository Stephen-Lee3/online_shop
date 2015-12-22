class Admin::AwardsController < ApplicationController
  def index
  	@awards = Award.all
  	@award = Award.new
  end

  def edit
  	@award = Award.find(params[:id])
  end

  def create
  	@award = Award.new(award_params)
  	@award.save
  	redirect_to admin_awards_path
  end

  def update
  end

  def destroy
  end

  private
  def award_params
  	params.require(:award).permit(:name,:quantity,:expire_at,:odds)
  end
end
