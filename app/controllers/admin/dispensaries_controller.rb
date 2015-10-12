class Admin::DispensariesController < ApplicationController


  def index
    @dispensaries = Dispensary.order('name asc')
  end

  def edit
    @dispensary = Dispensary.find(params[:id])  
  end

  def update
    @dispensary = Dispensary.find(params[:id])

    if @dispensary.update(dispensary_params)
      respond_to do |format|
        format.html {redirect_to admin_dispensaries_url}
      end
    end
  end

  private

  def dispensary_params
    params.require(:dispensary).permit(:name, :email, :address1, :address2, :ein, :leafly_slug, :license_number, :city, :state, :zip)
  end

end
