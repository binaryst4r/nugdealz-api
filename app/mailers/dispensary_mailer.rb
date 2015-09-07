class DispensaryMailer < ActionMailer::Base
  default from: "team@nugdealz.com"  

  def application_confirmation(dispensary_application)
    @dispensary_application = dispensary_application

    mail to: @dispensary_application.contact_email, subject: 'You have been approved.'
  end
  
end
