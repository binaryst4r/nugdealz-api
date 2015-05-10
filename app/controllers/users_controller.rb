class UsersController < ApplicationController

  def dashboard

  end

  def edit

  end

  def update

  end

  def show
    @user = User.find(params[:id])
  end
end
