class RedemptionsController < ApplicationController
  def create
    @redemption = Redemption.new(redemption_params)

    if @redemption.save
      respond_to do |format|
        format.html {redirect_to root_url, notice: 'you have successfully redeemed your deal.'}
      end
    end
  end

  def destroy
  end

  def update
    @redemption = Redemption.find(params[:id])
    if @redemption.redeemed = true
      redirect_to root_url, notice: 'This deal has already been redeemed.'
    else
      redirect_to root_url, notice: 'Deal successfully redeemed.'
    end
  end

  def index
  end

  private

  def redemption_params
    params.require(:redemption).permit(:user_id, :deal_id, :redeemed)
  end

end
