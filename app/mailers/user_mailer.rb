class UserMailer < ActionMailer::Base
  default from: "\"nugdealz team\" <info@nugdealz.com>"

  def signup_confirmation(user)
    @user = user

    mail to: user.email, subject: 'Welcome to NugDealz'
  end

  def redemption_confirmation(user, redemption)
    @user = user
    @redemption = redemption
    @redeem_url = "http://api.qrserver.com/v1/create-qr-code/?data=nugdealz.herokuapp.com/users/#{user.id}/redemptions/#{@redemption.id}/redeem&size=200x200"

    mail to: user.email, subject: 'Your Deal from nugdealz'
  end
end
