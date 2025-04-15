class UsersController < ApplicationController
  before_action :set_user

  def account
    @user = User.find(current_user.id)
  end

  def profile
    @user = User.find(current_user.id)
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)

    if @user.user_avatar.attached?
      @user.user_avatar.attach(params[:user][:user_avatar])
    else
      @user.user_avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'default-user-avatar.png')),
      filename: 'default-user-avatar.png',
      content_type: 'image/png')
    end

    if @user.update(user_params)
      flash[:notice] = "ユーザープロフィールを更新しました。"
      redirect_to :users_profile, status: :unprocessable_entity
    else
      render "edit"
    end
  end

  private
    def user_params
      params.require(:user).permit(:user_name, :user_avatar, :user_introduction).merge(user_id: current_user.id)
    end

    def set_user
      @user = User.find(current_user.id)
    end
end
