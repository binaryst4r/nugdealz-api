class DispensariesController < ApplicationController
	def show
		@dispensary = Dispensary.find(params[:id])
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
		if params[:filter]
			if params[:filter] == 'recreational'
				@dispensaries = Dispensary.recreational
			elsif params[:filter] == 'medical'
				@dispensaries = Dispensary.medical
			end
		else
			@dispensaries = Dispensary.all
		end

		if params[:nav_search]
			@search = params[:nav_search]
		elsif params[:search]
			@search = params[:search]
		else
			@search = ""
		end

		dispensaries = @dispensaries.where('name like ?', "%#{@search}%")

		if params[:location].present?
			@location = Geocoder.search(params[:location]).first.address
			@dispensaries = dispensaries.near(@location)
			@dispensaries.sort_by{|d| d.distance_to(@location)}
		else
			@dispensaries = dispensaries
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
		params.require(:dispensary).permit(:name, :email, :address1, :address2, :city, :state, :zip)
	end

end
