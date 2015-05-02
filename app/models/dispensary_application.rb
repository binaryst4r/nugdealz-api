class DispensaryApplication < ActiveRecord::Base

  def address
    "#{address1} #{address2 if address2}, #{city}, #{state} #{zip}"
  end
end
