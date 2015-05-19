class UserMailer < ActionMailer::Base
  default from: "help@nugdealz.com"

  def signup_confirmation(user)
    @user = user

    mail to: user.email, subject: 'Welcome to NugDealz'
  end

  def redemption_confirmation(user, redemption)
    @user = user
    @redemption = redemption

    mail to: user.email, subject: 'Welcome to NugDealz'
  end
end
