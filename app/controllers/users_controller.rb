class UsersController < ApplicationController
  def account
    @user = User.find_by(params[:user_name])
  end

  def profile
    @user = User.find_by(params[:user_name])
  end
end
