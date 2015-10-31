class DispensariesController < ApplicationController

  before_filter :authenticate_dispensary!, only: [:show, :update, :edit]
  before_filter :authorize_dispensary, only: [:show, :update, :edit]

  def authorize_dispensary
    dispensary = Dispensary.find(params[:id])
    if current_dispensary != dispensary
      redirect_to root_url, notice: "Hey! You can't do that"
    end
  end

  def manage_deals
    @dispensary = Dispensary.find(params[:dispensary_id])
    @deals = @dispensary.deals
  end

  def manage_rewards
    @dispensary = Dispensary.find(params[:dispensary_id])
    @rewards = @dispensary.dispensary_rewards
  end

	def show
		@dispensary = Dispensary.find(params[:id])
    @deals = @dispensary.deals
    @redemptions = @dispensary.redemptions
	end

	def edit
		@dispensary = Dispensary.find(params[:id])
	end

  def menu
    @dispensary = Dispensary.find(params[:dispensary_id])
    app_id = "b42999e4"
    app_key = "1c49dab735a206ea5f16c78dd6c53c65"
    slug = @dispensary.leafly_slug
    dispensary = HTTParty.get("http://data.leafly.com/locations/#{slug}", {headers:{"app_id" => app_id, "app_key" => app_key}})
    @specials = dispensary["specialsList"]

    respond_to :js

  end

	def index
		@dispensaries = Dispensary.order('name asc')

		if params[:search]
			@search = params[:search].downcase
			by_name = @dispensaries.where('lower(name) like ?', "%#{@search}%")
			by_location  = @dispensaries.near(@search)
			deals = @dispensaries = Deal.where('lower(description) like ?', "%#{@search}%")
			by_deals = deals.map{|x| x.dispensary}
			by_deals = Dispensary.where(id: by_deals.map(&:id))

			result = by_name + by_location + by_deals
			@dispensaries = result.uniq

		end
	end

	def update
		@dispensary = Dispensary.find(params[:id])

		if @dispensary.update(dispensary_params)
			respond_to do |format|
				format.html {redirect_to dispensary_url(@dispensary)}
			end
		end
	end

	private

	def dispensary_params
		params.require(:dispensary).permit(:name, :email, :address1, :address2, :ein, :license_number, :city, :state, :zip)
	end

end
