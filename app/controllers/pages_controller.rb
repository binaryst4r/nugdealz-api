class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:confirm_deal]

  def test_purchase
    if Redemption.create(dispensary_id: params[:dispensary_id], user_id: params[:user_id], deal_id: params[:deal_id])
      redirect_to root_url, notice: 'congrats'
    end


  end

  def welcome

  end

  def get_started

  end

  def confirm_deal
    @payment = Payment.new
    @deal = Deal.find(params[:deal])
    @user = current_user
  end
end
