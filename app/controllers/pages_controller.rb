class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:confirm_deal]
  def welcome

  end

  def get_started

  end

  def confirm_deal
    @deal = Deal.find(params[:deal])
    @user = current_user
  end
end
