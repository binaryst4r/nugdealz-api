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
        format.html {redirect_to dispensary_manage_deals_url(@deal.dispensary)}
      end
    end
  end

  def edit
    @deal = Deal.find(params[:id])
    @dispensary = @deal.dispensary
    respond_to :js, :html
  end

  def update
    @deal = Deal.find(params[:id])

    respond_to do |format|
      if @deal.update(deal_params)
        format.html {redirect_to dispensary_manage_deals_url(@deal.dispensary, @deal), notice: 'Deal Successfully Updated.'}
      else
        format.html {redirect_to :back, notice: "Something didn't work there"}
      end
    end
  end

  def destroy
    @deal = Deal.find(params[:id])
    @deal.destroy

    respond_to do |format|
      format.js
    end
  end

  private

  def deal_params
    params.require(:deal).permit(:title, :description, :fine_print, :quantity_available, :price, :dispensary_id, :recreational, :medical)
  end

  # def set_dispensary

  # end

end
