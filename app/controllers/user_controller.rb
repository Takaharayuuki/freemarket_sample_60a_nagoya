class UserController < ApplicationController
  def show
  end
  
  def edit
  end

  def update
  end

  def identification
    @prefecture = Prefecture.all
    @user = User.find(params[:id])
  end
end
