class DispensariesController < ApplicationController
	def show
		@dispensary = Dispensary.find(params[:id])
	end

	def edit
		@dispensary = Dispensary.find(params[:id])
	end

	def index
		if params[:nav_search]
			@search = params[:nav_search]
		elsif params[:search]
			@search = params[:search]
		else
			@search = ""
		end

		dispensaries = Dispensary.where('name like ?', "%#{@search}%")

		if params[:location].present?
			location = Geocoder.search(params[:location]).first.address
			@dispensaries = dispensaries.near(location)
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
