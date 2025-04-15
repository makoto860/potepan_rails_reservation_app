class HomesController < ApplicationController
  before_action :set_user

  def top
  end

  def area_search
    if params[:address].present?
      @rooms = Room.where('address LIKE ?', "%#{params[:address]}%")
    else
      @rooms = Room.all
    end
  end

  def tokyo
    @rooms = Room.where('address LIKE ?', "%東京%")
  end

  def kyoto
    @rooms = Room.where('address LIKE ?', "%京都%")
  end

  def osaka
    @rooms = Room.where('address LIKE ?', "%大阪%")
  end

  def sapporo
    @rooms = Room.where('address LIKE ?', "%札幌%")
  end

  private
    def set_user
      @user = User.find_by(params[:id])
    end
end
