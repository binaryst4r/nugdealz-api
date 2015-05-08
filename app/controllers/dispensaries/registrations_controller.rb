class Dispensaries::RegistrationsController < Devise::RegistrationsController

  before_filter :configure_permitted_parameters

  def new
    @dispensary = Dispensary.new
    if params[:dispensary_application]
      @da = DispensaryApplication.find(params[:dispensary_application])
    end
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:name, :email, :city, :address1, :address2, :state, :zip, :recreational, :medical)
  end


end
