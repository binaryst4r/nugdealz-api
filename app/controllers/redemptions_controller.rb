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

  def redeem
    @redemption = Redemption.find(params[:redemption_id])
    if @redemption.redeemed
      redirect_to root_url, notice: 'This deal has already been redeemed'
    else
      @redemption.redeemed = true
      respond_to do |format|
        if @redemption.save
          format.html {redirect_to root_url, notice: 'This deal has been redeemed successfully.'}
        else
          format.html {redirect_to root_url, notice: 'Something went wrong, please try again.'}        
        end
      end
    end

    
  end

  private

  def redemption_params
    params.require(:redemption).permit(:user_id, :deal_id, :redeemed)
  end

end
