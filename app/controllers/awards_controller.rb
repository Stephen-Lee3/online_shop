class AwardsController < ApplicationController
  before_action :check_user_score, only: :judge
  def index
  end

  def judge
     award = Award.judge(current_user)
     flash[:notice] = "you gain #{award}"
     current_user.update_attributes(score: current_user.score - 100)
     redirect_to awards_path
  end

  private
  def check_user_score
  	if current_user.score < 100
  		flash[:notice] = "抱歉，你的积分不足100，不能参与抽奖"
  		redirect_to awards_path
  	end
  end
end
