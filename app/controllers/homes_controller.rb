class HomesController < ApplicationController
  def top
    @user = User.find_by(params[:user_name])
  end
end
