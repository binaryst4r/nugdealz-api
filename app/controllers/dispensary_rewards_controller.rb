class DispensaryRewardsController < ApplicationController

  def show
    @dispensary = Dispensary.find(params[:dispensary_id])
  end

  def index
    @dispensary = Dispensary.find(params[:dispensary_id])

  end

  def new
    @dispensary = Dispensary.find(params[:dispensary_id])
    @dispensary_reward = DispensaryReward.new
  end

  def create
    @dispensary_reward = DispensaryReward.new(dispensary_reward_params)

    if @dispensary_reward.save
      respond_to do |format|
        format.html {redirect_to dispensary_manage_rewards_url(@dispensary_reward.dispensary), notice: 'Reward added!'}
      end
    end
  end

  def edit
    @dispensary_reward = DispensaryReward.find(params[:id])
    @dispensary = @dispensary_reward.dispensary
    respond_to :js, :html
  end

  def update
    @dispensary_reward = DispensaryReward.find(params[:id])

    respond_to do |format|
      if @dispensary_reward.update(dispensary_reward_params)
        format.html {redirect_to dispensary_manage_rewards_url(@dispensary_reward.dispensary, @dispensary_reward), notice: 'Reward Successfully Updated.'}
      else
        format.html {redirect_to :back, notice: "Something didn't work there"}
      end
    end
  end

  def destroy
    @dispensary_reward = DispensaryReward.find(params[:id])
    @dispensary_reward.destroy

    respond_to do |format|
      format.js
    end

  end

  private

  def dispensary_reward_params
    params.require(:dispensary_reward).permit(:title, :price, :dispensary_id, :image, :active)
  end



end
