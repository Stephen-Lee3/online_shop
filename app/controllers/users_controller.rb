class UsersController < ApplicationController
   before_action :authenticate_user!, only: [:edit,:update]

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
