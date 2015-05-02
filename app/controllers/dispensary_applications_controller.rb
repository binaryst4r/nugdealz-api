class DispensaryApplicationsController < ApplicationController
  def new
    @dispensary_application = DispensaryApplication.new
  end

  def create
    @dispensary_application = DispensaryApplication.new(dispensary_application_params)

    if @dispensary_application.save
      respond_to do |format|
        format.html{redirect_to root_url, notice: 'Thanks for applying to become a part of NUGDEALZ, we will reveiew your application and contact you shortly.'}
      end
    end
  end

  def destroy
  end

  def index
    @dispensary_applications = DispensaryApplication.all
  end

  def show
  end

  private

  def dispensary_application_params
    params.require(:dispensary_application).permit(:dispensary_name, :address1, :address2, :city, :state, :zip, :contact_name, :contact_email, :phone)
  end
end
