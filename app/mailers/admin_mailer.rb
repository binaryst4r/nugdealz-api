class AdminMailer < ActionMailer::Base
  default from: "admin@nugdealz.com"

  def new_dispensary_application(dispensary_application)
    @dispensary_application = dispensary_application

    mail to: "larry@square1development.com", subject: 'New Dispensary Application'
  end

  def new_support_inquiry(support_inquiry)
    @support_inquiry = support_inquiry

    mail to: 'larry@square1development.com', subject: "New Support Inquiry - #{@support_inquiry.subject}"
  end
  
  def dispensary_setup
    
  end
end
