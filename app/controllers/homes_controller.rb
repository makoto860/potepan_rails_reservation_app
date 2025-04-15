class HomesController < ApplicationController
  before_action :set_user

  def top
  end

  def tokyo
  end

  def kyoto
  end

  def osaka
  end

  def sapporo
  end

  private
    def set_user
      @user = User.find(current_user.id)
    end
end
