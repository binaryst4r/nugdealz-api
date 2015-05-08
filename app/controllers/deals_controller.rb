class DealsController < ApplicationController
  # before_filter :set_dispensary

  def show
    @dispensary = Dispensary.find(params[:dispensary_id])
  end

  def index
    @dispensary = Dispensary.find(params[:dispensary_id])

  end

  def new
    @dispensary = Dispensary.find(params[:dispensary_id])
    @deal = Deal.new
  end

  def create
    @deal = Deal.new(deal_params)

    if @deal.save
      respond_to do |format|
        format.html {redirect_to dispensary_deals_url(@deal.dispensary)}
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def deal_params
    params.require(:deal).permit(:title, :description, :fine_print, :quantity_available, :price, :dispensary_id, :recreational, :medical)
  end

  # def set_dispensary

  # end

end
