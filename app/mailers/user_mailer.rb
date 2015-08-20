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
    @qr = RQRCode::QRCode.new('http://www.google.com').as_png(resize_gte_to: false,
          resize_exactly_to: false,
          fill: 'white',
          color: 'black',
          size: 120,
          border_modules: 4,
          file: false,
          module_px_size: 6,
          output_file: nil)

    mail to: user.email, subject: 'Your Deal from nugdealz'
  end
end
