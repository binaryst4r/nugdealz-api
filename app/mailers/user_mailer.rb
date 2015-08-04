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
    @qr = RQRCode::QRCode.new(user_redemption_url(user, redemption)).to_img.resize(200, 200).to_data_url

    mail to: user.email, subject: 'Your Deal from nugdealz'
  end
end
