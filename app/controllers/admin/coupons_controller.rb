class Admin::CouponsController < ApplicationController
  def index
  	@coupons = Coupon.where(user_id: nil).order('created_at DESC')
  end

  def create
  	Coupon.generate_cp(params[:quantity],params[:value])
  	redirect_to admin_coupons_path
  end
end
