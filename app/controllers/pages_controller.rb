class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:confirm_deal]
  before_filter :validate_user, only: [:confirm_deal]
  
def validate_user
  if current_user.redemptions.where(:deal_id => params[:deal]).present?
    redirect_to :back, notice: 'You have already purchased this deal once.'
  end
end

  def test_purchase
    if Redemption.create(dispensary_id: params[:dispensary_id], user_id: params[:user_id], deal_id: params[:deal_id])
      redirect_to root_url, notice: 'congrats'
    end
  end
  
  # def redeem_deal
#     @redemption = Redemption.find(params[:id])
#     if @redemption.redeemed = true
#       redirect_to root_url, notice: 'This deal has already been redeemed.'
#     else
#       @redemption.redeemed = true
#       if @redemption.save
#         redirect_to root_url, notice: 'The deal has been successfully redeemed.'
#       end
#     end
#   end

  def support
    @support_inquiry = SupportInquiry.new
  end

  def welcome
    
  end

  def get_started

  end

  def confirm_deal
    @payment = Payment.new
    @deal = Deal.find(params[:deal])
    @dispensary = @deal.dispensary
    @user = current_user
  end
end
