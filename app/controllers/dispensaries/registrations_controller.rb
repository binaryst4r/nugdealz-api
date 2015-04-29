class Dispensaries::RegistrationsController < Devise::RegistrationsController

  before_filter :configure_permitted_parameters

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:name, :email, :city, :address1, :address2, :state, :zip)
  end


end
