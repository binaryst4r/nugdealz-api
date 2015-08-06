class DispensaryApplication < ActiveRecord::Base

  after_create :send_admin_email

  def send_admin_email
    AdminMailer.new_dispensary_application(self).deliver
  end

  def address
    "#{address1} #{address2 if address2}, #{city}, #{state} #{zip}"
  end
end
