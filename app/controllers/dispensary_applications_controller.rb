class DispensaryApplicationsController < ApplicationController
  before_filter :authenticate_user!, except: [:new]
  before_filter :authorize_admin, except: [:new]

  def authorize_admin
    unless current_user.admin
      redirect_to root_url, notice: 'You do not have permission to access that page.'
    end
  end

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

  def update
    @dispensary_application = DispensaryApplication.find(params[:id])
    if @dispensary_application.update(dispensary_application_params)
      ###EMAIL DISPENSARY
      respond_to do |format|
        format.js
      end
    end
  end

  def index
    @dispensary_applications = DispensaryApplication.all
  end

  def show
  end


  private

  def dispensary_application_params
    params.require(:dispensary_application).permit(:dispensary_name, :address1, :address2, :city, :state, :zip, :contact_name, :contact_email, :phone, :recreational, :medical, :verified)
  end
end
