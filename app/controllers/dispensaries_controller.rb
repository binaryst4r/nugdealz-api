class DispensariesController < ApplicationController
	def show
		@dispensary = Dispensary.find(params[:id])
	end
end
