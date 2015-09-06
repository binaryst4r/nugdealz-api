class UserMailer < ActionMailer::Base
  default from: "help@nugdealz.com"
  require 'rqrcode_png'

  def signup_confirmation(user)
    @user = user

    mail to: user.email, subject: 'Welcome to NugDealz'
  end

  def redemption_confirmation(user, redemption)
    @user = user
    @redemption = redemption
    @redeem_url = "http://api.qrserver.com/v1/create-qr-code/?data=10.0.0.177:3000/users/#{user.id}/redemptions/#{@redemption.id}/redeem&size=200x200"

    mail to: user.email, subject: 'Your Deal from nugdealz'
  end
end
