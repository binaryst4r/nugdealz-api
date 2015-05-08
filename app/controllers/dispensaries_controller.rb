class DispensariesController < ApplicationController
	def show
		@dispensary = Dispensary.find(params[:id])
	end

	def edit
		@dispensary = Dispensary.find(params[:id])
	end

	def index
		@dispensaries = Dispensary.all
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
